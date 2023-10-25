<?php


namespace App\Http\Controllers\Auth;
use Exception;
header('Content-Type: application/json');

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use App\User;
use Auth;
use App\PrivacyPolicy;
use App\Blog;
use App\Mail\ForgetPassword;
use App\Message;
use App\MessageComment;
use App\BlogCategory;
use Image;
use File;
use App\SeoText;
use App\PropertyImage;
use Hash;
use App\ContactInformation;
use App\Rules\Captcha;
use App\Setting;
use App\BannerImage;
use App\Navigation;
use App\ConditionPrivacy;
use App\ManageText;
use App\NotificationText;
use App\ValidationText;
use App\PropertyType;
use App\Property;
use App\City;
use App\Aminity;
use App\NearestLocation;
use Validator;
use Str;
use App\Package;
use DB;
use App\Helpers\MailHelper;
use App\EmailTemplate;
use App\Mail\UserVerification;
use Mail;
use App\PropertyPurpose;
use App\PropertyAminity;
use App\Wishlist;
use App\Faq;
use App\PropertyNearestLocation;
use App\Order;
use App\PropertyReview;
use App\Testimonial;
use App\About;
use App\AboutSection;
use App\Practice;
use App\Segments;
use App\PaymentAccount;
Use Stripe;
use Stripe\Token;
use App\Mail\OrderConfirmation;
use Illuminate\Pagination\Paginator;



class Api extends Controller
{
    use AuthenticatesUsers;

    protected $redirectTo = RouteServiceProvider::HOME;

    public function __construct()
    {
        $this->middleware('guest:web')->except('userLogout');
    }
    
    public function storeLogin(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'email' => 'required|email:rfc,dns|email',
            'password' => 'required|min:6',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }
        $credential=[
            'email'=> $request->email,
            'password'=> $request->password
        ];

        $user=User::where('email',$request->email)->first();
        if($user){
            if($user->status==1){
                if(Hash::check($request->password,$user->password)){
                    if(Auth::guard('web')->attempt($credential,$request->remember)){
                      
                        $notify_lang=NotificationText::all();
                        $notification=$notify_lang->where('lang_key','login')->first()->custom_text;
                        $notification=array('messege'=>$notification,'status'=>'success','data'=>$user);
                        return json_encode($notification);
                    
                    }
                }else{
                    $notify_lang=NotificationText::all();
                    $notification=$notify_lang->where('lang_key','invalid_login')->first()->custom_text;
                    $notification=array('messege'=>$notification,'status'=>'error');
                    return json_encode($notification);
                
                }

            }else{
               
                $notify_lang=NotificationText::all();
                $notification='Please Verify your account'; 
                $notification=array('messege'=>$notification,'status'=>'error');              
                
                return json_encode($notification);
        
            }
        }else{
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','email_not_exist')->first()->custom_text;
            $notification=array('messege'=>$notification,'status'=>'error');

            return json_encode($notification);
        }

           
      
    }

    public function storeRegister(Request $request){
      
        $valid_lang=ValidationText::all();
        $validator = Validator::make($request->all(), [
            'name'=>'required',
            'email'=>'required|unique:users|email',
            'password'=>'required|min:3',
            'g-recaptcha-response'=>new Captcha()
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }

        $user=User::create([
            'name'=>$request->name,
            'slug'=>Str::slug($request->name),
            'email'=>$request->email,
            'usertype'=>$request->usertype,
            'password'=>Hash::make($request->password),
            'email_verified_token'=>Str::random(100)
        ]);

        MailHelper::setMailConfig();

        $template=EmailTemplate::where('id',5)->first();
        $message=$template->description;
        $subject=$template->subject;
        $message=str_replace('{{user_name}}',$user->name,$message);

        Mail::to($user->email)->send(new UserVerification($user,$message,$subject));

        $notify_lang=NotificationText::all();
        $notification=$notify_lang->where('lang_key','register')->first()->custom_text;
        return response()->json(['status'=>'success','message'=>'Register Successfully.']);

    }

        
    public function getUserProperties(Request $request)
    {
        $user_id = $request->user_id;
        $all = $request->property_type;
        if($all == 'all'){
            if(empty($request->filter)){

                $properties = Property::where('properties.status',1)->orderBy('properties.id','desc')
                ->select('properties.*', 'users.name as username','age_user.email as agentemail', 'age_user.name as agentname', 'users.image as userimage','cities.name as city_name','property_types.type as property_type_name','property_purposes.purpose as property_purpose_name')
                ->join('users', 'users.id', '=', 'properties.user_id')
                ->join('users as age_user', 'age_user.id', '=', 'properties.agent_id')
                ->join('property_types', 'property_types.id', '=', 'properties.property_type_id')
                ->join('property_purposes', 'property_purposes.id', '=', 'properties.property_purpose_id')
                ->join('cities', 'cities.id', '=', 'properties.city_id')->get();
            }else if($request->filter == 'yes'){ 
                
                $query = Property::where('properties.status',1)->orderBy('properties.id','desc')
                ->select('properties.*', 'users.name as username','age_user.email as agentemail', 'age_user.name as agentname', 'users.image as userimage','cities.name as city_name','cities.lat as city_lat','cities.long as city_long','property_types.type as property_type_name','property_purposes.purpose as property_purpose_name')
                ->join('users', 'users.id', '=', 'properties.user_id')
                ->join('users as age_user', 'age_user.id', '=', 'properties.agent_id')
                ->join('property_types', 'property_types.id', '=', 'properties.property_type_id')
                ->join('property_aminities', 'property_aminities.property_id', '=', 'properties.id')
                ->join('property_nearest_locations', 'property_nearest_locations.property_id', '=', 'properties.id')
                ->join('property_purposes', 'property_purposes.id', '=', 'properties.property_purpose_id')
                ->join('cities', 'cities.id', '=', 'properties.city_id');
                if(!empty($request->property_type_id) && $request->property_type_id != 0){
                    // print_r($request->property_type_id);die;
                    $query->where('properties.property_type_id',$request->property_type_id);
                }
                if(!empty($request->city_id) && $request->city_id != 0){
                    $query->where('properties.city_id',$request->city_id);
                }
                if(!empty($request->property_purpose_id) && $request->property_purpose_id != 0){
                    $query->where('properties.property_purpose_id',$request->property_purpose_id);
                }
                if(!empty($request->number_of_bedroom) && $request->number_of_bedroom != 0){
                    $query->where('properties.number_of_bedroom',$request->number_of_bedroom);
                }
                if(!empty($request->number_of_bathroom) && $request->number_of_bathroom != 0){
                    $query->where('properties.number_of_bathroom',$request->number_of_bathroom);
                }
                if(!empty($request->aminity_id) && $request->aminity_id != 0){
                    $query->where('property_aminities.aminity_id',$request->aminity_id);
                }
                if(!empty($request->price && $request->price != '0-10000')){
                    $priceRange = explode('-', $request->price);
                    $query->whereBetween('properties.price', [$priceRange[0], $priceRange[1]]);
                }
                if(!empty($request->area &&  $request->area != '0-2000')){
                    $areaRange = explode('-', $request->area);
                    $query->whereBetween('properties.area', [$areaRange[0], $areaRange[1]]);
                }
                if(!empty($request->nearest_location_id) && $request->nearest_location_id != 0){
                    $query->where('property_nearest_locations.nearest_location_id',$request->nearest_location_id);
                }
                $properties= $query->get();
                
            }

            $properties_count = $properties->count();
            if($request->proeperty_search){
                $properties=Property::where('title','LIKE','%'.$request->proeperty_search.'%')->where('properties.status',1)->select('properties.*', 'users.name as username','age_user.email as agentemail', 'age_user.name as agentname', 'users.image as userimage','cities.name as city_name','property_types.type as property_type_name','property_purposes.purpose as property_purpose_name')
                ->join('users', 'users.id', '=', 'properties.user_id')
                ->join('users as age_user', 'age_user.id', '=', 'properties.agent_id')
                ->join('property_types', 'property_types.id', '=', 'properties.property_type_id')
                ->join('property_purposes', 'property_purposes.id', '=', 'properties.property_purpose_id')
                ->join('cities', 'cities.id', '=', 'properties.city_id')->get();

                // print_r($search);die;
                foreach($properties as $propertimage)
                {
                    foreach ($propertimage->propertyImages as $value) {
                        $properties->prop_img = public_path().'/'.$value;
                    }
                }
                foreach ($properties as $aminity_item)
                {
                    foreach ($aminity_item->propertyAminities as $value) {
                        $properties->aminities = $value->aminity;
                    }
                }
                foreach ($properties as $aminity_item)
                {
                    foreach ($aminity_item->propertyAminities as $value) {
                        // $properties->aminities = $value->aminity;
                    }
                }
                foreach ($properties as $nearestLocations){
                    foreach ($nearestLocations->propertyNearestLocations as $property_item){
                        $properties->locations = $property_item->nearestLocation;
                    }
                }
                // print_r($properties->locations);die;
            }else{
                foreach($properties as $propertimage)
                {
                    foreach ($propertimage->propertyImages as $value) {
                        $properties->prop_img = public_path().'/'.$value;
                    }
                }
                foreach ($properties as $aminity_item)
                {
                    foreach ($aminity_item->propertyAminities as $value) {
                        $properties->aminities = $value->aminity;
                    }
                }

                foreach ($properties as $nearestLocations){
                    foreach ($nearestLocations->propertyNearestLocations as $property_item){
                        $properties->locations = $property_item->nearestLocation;
                    }
                }
                foreach ($properties as $index => $value){
                    $properties[$index]->agentname = $value['agentname'].'-'.$value['agentemail'];
                }
            }
        }else if($request->is_assigned == 'assigned'){
            $properties = Property::where('properties.agent_id',$user_id)->orderBy('properties.id','desc')
            ->select('properties.*', 'users.name as username', 'age_user.name as agentname','age_user.email as agentemail', 'users.image as userimage','cities.name as city_name','property_types.type as property_type_name','property_purposes.purpose as property_purpose_name')
            ->join('users', 'users.id', '=', 'properties.user_id')
            ->join('users as age_user', 'age_user.id', '=', 'properties.agent_id')
            ->join('property_types', 'property_types.id', '=', 'properties.property_type_id')
            ->join('property_purposes', 'property_purposes.id', '=', 'properties.property_purpose_id')
            ->join('cities', 'cities.id', '=', 'properties.city_id')
            ->get();
            foreach($properties as $propertimage)
            {
                foreach ($propertimage->propertyImages as $value) {
                    $properties->prop_img = public_path().'/'.$value;
                }
            }
            foreach ($properties as $aminity_item)
            {
                foreach ($aminity_item->propertyAminities as $value) {
                    $properties->aminities = $value->aminity;
                }
            }
            foreach ($properties as $nearestLocations){
                foreach ($nearestLocations->propertyNearestLocations as $property_item){
                    $properties->locations = $property_item->nearestLocation;
                }
            }
            foreach ($properties as $index => $value){
                $properties[$index]->agentname = $value['agentname'].'-'.$value['agentemail'];
            }
        }else{
            $properties = Property::where('users.id',$user_id)->orderBy('properties.id','desc')
            ->select('properties.*', 'users.name as username', 'age_user.name as agentname','age_user.email as agentemail', 'users.image as userimage','cities.name as city_name','property_types.type as property_type_name','property_purposes.purpose as property_purpose_name')
            ->join('users', 'users.id', '=', 'properties.user_id')
            ->join('users as age_user', 'age_user.id', '=', 'properties.agent_id')
            ->join('property_types', 'property_types.id', '=', 'properties.property_type_id')
            ->join('property_purposes', 'property_purposes.id', '=', 'properties.property_purpose_id')
            ->join('cities', 'cities.id', '=', 'properties.city_id')
            ->get();
            
            if($request->proeperty_search){
                $properties=Property::where('title','LIKE','%'.$request->proeperty_search.'%')->where('properties.status',1)->select('properties.*', 'users.name as username', 'age_user.name as agentname','age_user.email as agentemail', 'users.image as userimage','cities.name as city_name','property_types.type as property_type_name','property_purposes.purpose as property_purpose_name')
                ->join('users', 'users.id', '=', 'properties.user_id')
                ->join('users as age_user', 'age_user.id', '=', 'properties.agent_id')
                ->join('property_types', 'property_types.id', '=', 'properties.property_type_id')
                ->join('property_purposes', 'property_purposes.id', '=', 'properties.property_purpose_id')
                ->join('cities', 'cities.id', '=', 'properties.city_id')->get();

                // print_r($search);die;
                foreach($properties as $propertimage)
                {
                    foreach ($propertimage->propertyImages as $value) {
                        $properties->prop_img = public_path().'/'.$value;
                    }
                }
                foreach ($properties as $aminity_item)
                {
                    foreach ($aminity_item->propertyAminities as $value) {
                        $properties->aminities = $value->aminity;
                    }
                }
                foreach ($properties as $nearestLocations){
                    foreach ($nearestLocations->propertyNearestLocations as $property_item){
                        $properties->locations = $property_item->nearestLocation;
                    }
                }
                foreach ($properties as $index => $value){
                    $properties[$index]->agentname = $value['agentname'].'-'.$value['agentemail'];
                }
            }else{
                foreach($properties as $propertimage)
                {
                    foreach ($propertimage->propertyImages as $value) {
                        $properties->prop_img = public_path().'/'.$value;
                    }
                }
                foreach ($properties as $aminity_item)
                {
                    foreach ($aminity_item->propertyAminities as $value) {
                        $properties->aminities = $value->aminity;
                    }
                }
                foreach ($properties as $nearestLocations){
                    foreach ($nearestLocations->propertyNearestLocations as $property_item){
                        $properties->locations = $property_item->nearestLocation;
                    }
                }
                foreach ($properties as $index => $value){
                    $properties[$index]->agentname = $value['agentname'].'-'.$value['agentemail'];
                }
            }
        }

        if(!blank($properties)){
            return response()->json(['status'=>'success','message'=>'Data found successfully','data'=>$properties]);
        }else{
            return response()->json(['status'=>'error','message'=>'Data not found','data'=>[]]);
        }
    }

    public function propertDetails(Request $request){
       
        $properties = Property::where(['properties.id'=>$request->property_id])
        ->select('properties.*', 'users.name as username','age_user.email as agentemail', 'age_user.name as agentname', 'users.image as userimage','cities.name as city_name','property_types.type as property_type_name','property_purposes.purpose as property_purpose_name')
        ->join('users', 'users.id', '=', 'properties.user_id')
        ->join('users as age_user', 'age_user.id', '=', 'properties.agent_id')
        ->join('property_types', 'property_types.id', '=', 'properties.property_type_id')
        ->join('property_purposes', 'property_purposes.id', '=', 'properties.property_purpose_id')
        ->join('cities', 'cities.id', '=', 'properties.city_id')->get();
        
        foreach($properties as $propertimage)
        {
            foreach ($propertimage->propertyImages as $value) {
                $properties->prop_img = public_path().'/'.$value;
            }
        }
        foreach ($properties as $aminity_item)
        {
            foreach ($aminity_item->propertyAminities as $value) {
                $properties->aminities = $value->aminity;
            }
        }
        foreach ($properties as $nearestLocations){
            foreach ($nearestLocations->propertyNearestLocations as $property_item){
                $properties->locations = $property_item->nearestLocation;
            }
        }
        foreach ($properties as $index => $value){
            $properties[$index]->agentname = $value['agentname'].'-'.$value['agentemail'];
        }

        if($properties){
           
            // $properties->views=$properties[0]->views +1;
            // $properties->save();
            if(!blank($properties)){
                return response()->json(['status'=>'success','message'=>'Data found successfully','data'=>$properties]);
            }else{
                return response()->json(['status'=>'error','message'=>'Data not found','data'=>[]]);
            }
        }
    }

    public function profile(Request $request)
    {
        $user_id = $request->user_id;
        $user=User::where('id',$user_id)->get();
        if(!blank($user)){
            return response()->json(['status'=>'success','message'=>'Data found successfully','data'=>$user]);
        }else{
            return response()->json(['status'=>'error','message'=>'Data not found','data'=>[]]);
        }
    }

    
    public function updateProfile(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name'=>'required',
            'email'=>'required|email',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }
        $user_id = $request->user_id;
        $user=DB::table('users')->where('id',$user_id)->first();
        // for profile image

        if($request->file('profileimage')){
            // print_r($user->image);exit;
            $old_image=$user->image;
            $image=$request->profileimage;
            $image_extention=$image->getClientOriginalExtension();
            $image_name= 'user-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$image_extention;
            $image_path='uploads/custom-images/'.$image_name;
            Image::make($image)
                ->save(public_path().'/'.$image_path);

            $userimage=$image_path;
            DB::table('users')
            ->where('id', $user_id)  // optional - to ensure only one record is updated.
            ->update([
                'image'=>$userimage]);
            if($old_image){
                if(File::exists(public_path().'/'.$old_image))  unlink(public_path().'/'.$old_image);
            }

        }

        DB::table('users')
        ->where('id', $user_id)  // optional - to ensure only one record is updated.
        ->update([
            'name'=>$request->name,
            'slug'=>Str::slug($request->name),
            'phone'=>$request->phone,
            'about'=>$request->about,
            'link_one'=>$request->link_one,
            'link_two'=>$request->link_two,
            'link_three'=>$request->link_three,
            'link_four'=>$request->link_four,
            'address'=>$request->address,
            'website'=>$request->website]);


        $notify_lang=NotificationText::all();
        $notification=$notify_lang->where('lang_key','update')->first()->custom_text;
        $notification=array('messege'=>$notification,'status'=>'success');
        return json_encode($notification);
    }
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title'=>'required|unique:properties,title,',
            'property_type'=>'required',
            'city'=>'required',
            'address'=>'required',
            'email'=>'required|email',
            'purpose'=>'required|numeric',
            'price'=>'required|numeric',
            'area'=>'required|numeric',
            'unit'=>'required|numeric',
            'room'=>'required|numeric',
            'bedroom'=>'required|numeric',
            'bathroom'=>'required|numeric',
            'floor'=>'required|numeric',
            'description'=>'required',
            'banner_image'=>'required',
            'thumbnail_image'=>'required',
            'slider_images'=>'required',
            'latitude'=>'required',
            'longitude'=>'required',
            'featured'=>'required|numeric',
            'top_property'=>'required|numeric',
            'urgent_property'=>'required|numeric',
            // "pdf_file" => "required|mimes:pdf|max:10000"
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }
  

        $video_link='';
        if(preg_match('/https:\/\/www\.youtube\.com\/watch\?v=[^&]+/', $request->video_link)) {
            $video_link=$request->video_link;
        }
        $property=new Property();

        $property->user_type=0; 
        $property->user_id=$request->user_id;
        $property->agent_id=$request->agent_id;
        $property->title=$request->title;
        $property->expired_date=$request->expired_date==-1 ? null : $request->expired_date;
        $property->slug=$request->title;
        $property->property_type_id=$request->property_type;
        $property->city_id=$request->city;
        $property->address=$request->address;
        $property->phone=$request->phone;
        $property->email=$request->email;
        $property->website=$request->website;
        $property->property_purpose_id=$request->purpose;
        $property->price=$request->price;
        $property->period=$request->period ? $request->period : null;
        $property->area=$request->area;
        $property->number_of_unit=$request->unit;
        $property->number_of_room=$request->room;
        $property->number_of_bedroom=$request->bedroom;
        $property->number_of_bathroom=$request->bathroom;
        $property->number_of_floor=$request->floor;
        $property->number_of_kitchen=$request->kitchen;
        $property->number_of_parking=$request->parking;
        $property->furnishings=$request->furnishings;
        $property->video_link=$video_link;
        $property->google_map_embed_code=$request->google_map_embed_code;
        $property->description=$request->description;
        $property->status=0;
        $property->is_featured=$request->featured ? $request->featured : 0;
        $property->urgent_property=$request->urgent_property ? $request->urgent_property : 0;
        $property->top_property=$request->top_property ? $request->top_property : 0;
        $property->seo_title=$request->seo_title ? $request->seo_title : $request->title;
        $property->seo_description=$request->seo_description ? $request->seo_description : $request->title;
        //Lat and lang
        $property->lat = $request->latitude;
        $property->lang = $request->longitude;
        
        // pdf file
        if($request->file('pdf_file')){
            $file=$request->pdf_file;
            $file_ext=$file->getClientOriginalExtension();
            $file_name= 'property-file-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$file_ext;
            $file_path=$file_name;
            $file->move(public_path().'/uploads/custom-images/',$file_path);

            $property->file=$file_path;
        }
        // $property->save();
        // return redirect()->back();
        //thumbnail image
        if($request->file('thumbnail_image')){
            $thumbnail_image=$request->thumbnail_image;
            $thumbnail_extention=$thumbnail_image->getClientOriginalExtension();
            $thumb_name= 'property-thumb-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$thumbnail_extention;
            $thumb_path='uploads/custom-images/'.$thumb_name;

            Image::make($thumbnail_image)
                ->save(public_path().'/'.$thumb_path);
                $property->thumbnail_image=$thumb_path;

        }
        // banner image image
        if($request->file('banner_image')){
            $banner_image=$request->banner_image;
            $banner_ext=$banner_image->getClientOriginalExtension();
            $banner_name= 'listing-banner-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$banner_ext;
            $banner_path='uploads/custom-images/'.$banner_name;
            Image::make($banner_image)
                ->save(public_path().'/'.$banner_path);
                $property->banner_image=$banner_path;
        }
        $aminities = explode(',',$request->aminities);
        $nearest_locations = explode(',',$request->nearest_locations);
        $distances = explode(',',$request->distances);
        $addProperty = $property->save();
        
         // insert aminity
         if($aminities){
            foreach($aminities as $amnty){
                $aminity= new PropertyAminity();
                $aminity->property_id=$property->id;
                $aminity->aminity_id=$amnty;
                $aminity->save();
            }
        }
        // insert nearest place
        $exist_location=[];
        if($nearest_locations){
            foreach($nearest_locations as $index => $location){
                if($location){
                    if($distances[$index]){
                        if(!in_array($location, $exist_location)){
                            $nearest_location= new PropertyNearestLocation();
                            $nearest_location->property_id=$property->id;
                            $nearest_location->nearest_location_id=$location;
                            $nearest_location->distance=$distances[$index];
                            $nearest_location->save();
                        }
                        $exist_location[]=$location;

                    }
                }
            }
        }
        // slider image
        if($request->file('slider_images')){
            $images=$request->slider_images;
            foreach($images as $image){
                if($image != null){
                    $propertyImage=new PropertyImage();
                    $slider_ext=$image->getClientOriginalExtension();
                    // for small image
                    $slider_image= 'property-slide-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$slider_ext;
                    $slider_path='uploads/custom-images/'.$slider_image;

                    Image::make($image)
                        ->save(public_path().'/'.$slider_path);

                    $propertyImage->image=$slider_path;
                    $propertyImage->property_id=$property->id;
                    $propertyImage->save();
                }
            }
        }
   
        if(!blank($addProperty)){
            return response()->json(['status'=>'success','message'=>'Property Added Successfully']);
        }else{
            return response()->json(['status'=>'error','message'=>'Property not Added!','data'=>[]]);
        }

    }

    
    public function addtowishlist(Request $request){
        // end
        $validator = Validator::make($request->all(), [
            'property_id'=>'required',
            'user_id'=>'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }

        $isExist=Wishlist::where(['property_id'=>$request->property_id, 'user_id'=>$request->user_id])->first();
        if(!$isExist){
            $wishlist=new Wishlist();
            $wishlist->user_id=$request->user_id;
            $wishlist->property_id=$request->property_id;
            $wishlist->save();

            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','wishlist')->first()->custom_text;
            $notification=array('messege'=>$notification,'status'=>'success');
            return response()->json($notification);
        }else{
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','already_wishlist')->first()->custom_text;
            $notification=array('messege'=>$notification,'status'=>'error');
            return response()->json($notification);
        }
    }
    
    public function deleteWishlist(Request $request){

        $validator = Validator::make($request->all(), [
            'property_id'=>'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }

        $wishlist=Wishlist::where('property_id',$request->property_id)->delete();
        
        $notify_lang=NotificationText::all();
        if(!blank($wishlist)){
            $notification=$notify_lang->where('lang_key','delete')->first()->custom_text;
            $notification=array('messege'=>$notification,'status'=>'success');
            return response()->json($notification);
        }else{
            $notification="Your Property not remove in wishlist";
            $notification=array('messege'=>$notification,'status'=>'error');
            return response()->json($notification);

        }
    }
    public function getwishlist(Request $request){

        $validator = Validator::make($request->all(), [
            'user_id'=>'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }

        $properties = Property::where('properties.status',1)->where('wishlists.user_id',$request->user_id)->orderBy('properties.id','desc')
        ->select('properties.*', 'users.name as username', 'users.image as userimage','cities.name as city_name')
        ->join('wishlists', 'wishlists.property_id', '=', 'properties.id')
        ->join('users', 'users.id', '=', 'properties.user_id')
        ->join('cities', 'cities.id', '=', 'properties.city_id')
        ->get();
        foreach($properties as $propertimage)
        {
            foreach ($propertimage->propertyImages as $value) {
                $properties->prop_img = public_path().'/'.$value;
            }
        }

        if(!blank($properties)){
            $notification='Wishlist Found Successfully';
            $notification=array('messege'=>$notification,'status'=>'success','data'=>$properties);
            return response()->json($notification);
        }else{
            $notification="Wishlist not Found";
            $notification=array('messege'=>$notification,'status'=>'error','data'=>[]);
            return response()->json($notification);

        }
    }
    public function getCity(){
        $cities=City::where('status',1)->get();
        $notify_lang=NotificationText::all();
        if(!blank($cities)){
            $notification="City Found Successfully";
            $notification=array('messege'=>$notification,'status'=>'success','data'=>$cities);
            return response()->json($notification);
        }else{
            $notification="City not Found!";
            $notification=array('messege'=>$notification,'status'=>'error','data'=>[]);
            return response()->json($notification);

        }
    }
    public function getAminities(){
        $aminities=Aminity::where('status',1)->get();
        $notify_lang=NotificationText::all();
        if(!blank($aminities)){
            $notification="Aminities Found Successfully";
            $notification=array('messege'=>$notification,'status'=>'success','data'=>$aminities);
            return response()->json($notification);
        }else{
            $notification="Aminities not Found!";
            $notification=array('messege'=>$notification,'status'=>'error','data'=>[]);
            return response()->json($notification);

        }
    }
    public function getNearestLocation(){
        $nearest_locatoins=NearestLocation::where('status',1)->get();
        $notify_lang=NotificationText::all();
        if(!blank($nearest_locatoins)){
            $notification="Nearest Location Found Successfully";
            $notification=array('messege'=>$notification,'status'=>'success','data'=>$nearest_locatoins);
            return response()->json($notification);
        }else{
            $notification="Nearest Location not Found!";
            $notification=array('messege'=>$notification,'status'=>'error','data'=>[]);
            return response()->json($notification);

        }
    }
    public function getPropertyTypes(){
        $propertyTypes=PropertyType::where('status',1)->get();
        $notify_lang=NotificationText::all();
        if(!blank($propertyTypes)){
            $notification="Property Types Found Successfully";
            $notification=array('messege'=>$notification,'status'=>'success','data'=>$propertyTypes);
            return response()->json($notification);
        }else{
            $notification="Property Types not Found!";
            $notification=array('messege'=>$notification,'status'=>'error','data'=>[]);
            return response()->json($notification);

        }
    }
    public function getAgent(){
        $agent=User::where('usertype','Agent')->where('status',1)->get();
        $notify_lang=NotificationText::all();
        if(!blank($agent)){
            $notification="Agent Found Successfully";
            $notification=array('messege'=>$notification,'status'=>'success','data'=>$agent);
            return response()->json($notification);
        }else{
            $notification="Agent not Found!";
            $notification=array('messege'=>$notification,'status'=>'error','data'=>[]);
            return response()->json($notification);

        }
    }
    public function getPurpose(){
        $purposes=PropertyPurpose::where('status',1)->get();
        $notify_lang=NotificationText::all();
        if(!blank($purposes)){
            $notification="Property Purpose Found Successfully";
            $notification=array('messege'=>$notification,'status'=>'success','data'=>$purposes);
            return response()->json($notification);
        }else{
            $notification="Property Purpose not Found!";
            $notification=array('messege'=>$notification,'status'=>'error','data'=>[]);
            return response()->json($notification);

        }
    }
    public function updatePassword(Request $request){
        $validator = Validator::make($request->all(), [
            'current_password'=>'required',
            'password'=>'required|confirmed|min:3',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }
        
        $user=DB::table('users')->where('id',$request->user_id)->first();

        if(Hash::check($request->current_password,$user->password)){
            $password=Hash::make($request->password);
            
            DB::table('users')
            ->where('id', $request->user_id)
            ->update(['password'=>$password]);

            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','pass')->first()->custom_text;
            $notification=array('messege'=>$notification,'status'=>'success');

            return response()->json($notification);
        }else{
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','old_pass')->first()->custom_text;
            $notification=array('messege'=>$notification,'status'=>'error');
            return response()->json($notification);
        }


    }
    
    public function updateProperty(Request $request)
    {
        $property=Property::find($request->property_id);
        $validator = Validator::make($request->all(), [
            'title'=>'required',
            // 'slug'=>'required|unique:properties,slug,'.$property->id,
            'property_type'=>'required',
            'city'=>'required',
            'address'=>'required',
            'email'=>'required|email',
            'purpose'=>'required|numeric',
            'price'=>'required|numeric',
            'area'=>'required|numeric',
            'unit'=>'required|numeric',
            'room'=>'required|numeric',
            'bedroom'=>'required|numeric',
            'bathroom'=>'required|numeric',
            'floor'=>'required|numeric',
            'description'=>'required',
            'latitude'=>'required',
            'longitude'=>'required',
            'featured'=>'required|numeric',
            'top_property'=>'required|numeric',
            'urgent_property'=>'required|numeric',
            "pdf_file" => "mimes:pdf|max:10000"
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }
        $video_link='';
        if(preg_match('/https:\/\/www\.youtube\.com\/watch\?v=[^&]+/', $request->video_link)) {
            $video_link=$request->video_link;
        }
        $user=Auth::guard('web')->user();
        $property->title=$request->title;  
        $property->agent_id=$request->agent_id;    
        $property->property_type_id=$request->property_type;
        $property->city_id=$request->city;
        $property->address=$request->address;
        $property->phone=$request->phone;
        $property->email=$request->email;
        $property->website=$request->website;
        $property->property_purpose_id=$request->purpose;
        $property->price=$request->price;
        $property->period=$request->period ? $request->period : null;
        $property->area=$request->area;
        $property->number_of_unit=$request->unit;
        $property->number_of_room=$request->room;
        $property->number_of_bedroom=$request->bedroom;
        $property->number_of_bathroom=$request->bathroom;
        $property->number_of_floor=$request->floor;
        $property->number_of_kitchen=$request->kitchen;
        $property->number_of_parking=$request->parking;
        $property->video_link=$video_link;
        $property->google_map_embed_code=$request->google_map_embed_code;
        $property->furnishings=$request->furnishings;
        $property->description=$request->description;
        $property->is_featured=$request->featured ? $request->featured : 0;
        $property->urgent_property=$request->urgent_property ? $request->urgent_property : 0;
        $property->top_property=$request->top_property ? $request->top_property : 0;
        $property->seo_title=$request->seo_title ? $request->seo_title : $request->title;
        $property->seo_description=$request->seo_description ? $request->seo_description : $request->title;

        //Lat and lang
        $property->lat = $request->latitude;
        $property->lang = $request->longitude;

        // pdf file
        if($request->file('pdf_file')){
            $file=$request->pdf_file;
            $old_file=$property->file;
            $file_ext=$file->getClientOriginalExtension();
            $file_name= 'property-file-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$file_ext;
            $file_path=$file_name;
            $file->move(public_path().'/uploads/custom-images/',$file_path);
            $property->file=$file_path;
            $property->save();

            if($old_file){
                if(File::exists(public_path().'/'."uploads/custom-images/".$old_file)) unlink(public_path().'/'."uploads/custom-images/".$old_file);
            }
        }


        //thumbnail image
        if($request->file('thumbnail_image')){
            $old_thumbnail=$property->thumbnail_image;
            $thumbnail_image=$request->thumbnail_image;
            $thumbnail_extention=$thumbnail_image->getClientOriginalExtension();
            $thumb_name= 'property-thumb-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$thumbnail_extention;
            $thumb_path='uploads/custom-images/'.$thumb_name;
            Image::make($thumbnail_image)
                ->save(public_path().'/'.$thumb_path);

            $property->thumbnail_image=$thumb_path;
            $property->save();
            if(File::exists(public_path().'/'.$old_thumbnail)) unlink(public_path().'/'.$old_thumbnail);
        }

        // banner image image
        if($request->file('banner_image')){
            $old_banner=$property->banner_image;
            $banner_image=$request->banner_image;
            $banner_ext=$banner_image->getClientOriginalExtension();
            $banner_name= 'listing-banner-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$banner_ext;
            $banner_path='uploads/custom-images/'.$banner_name;

            Image::make($banner_image)
            ->save(public_path().'/'.$banner_path);


            $property->banner_image=$banner_path;
            $property->save();
            if(File::exists(public_path().'/'.$old_banner)) unlink(public_path().'/'.$old_banner);
        }
        $addProperty = $property->save();
        // property end
        $aminities = explode(',',$request->aminities);
        $nearest_locations = explode(',',$request->nearest_locations);

        // for aminity
        $old_aminities=$property->propertyAminities;
        if($aminities){
            foreach($aminities as $amnty){
                $aminity= new PropertyAminity();
                $aminity->property_id=$property->id;
                $aminity->aminity_id=$amnty;
                $aminity->save();
            }

            if($old_aminities->count()>0){
                foreach($old_aminities as $old_aminity){
                    $old_aminity->delete();
                }
            }
        }else{
            if($old_aminities->count()>0){
                foreach($old_aminities as $old_aminity){
                    $old_aminity->delete();
                }
            }
        }


        
        // insert nearest place
        $distances = explode(',',$request->distances);
        $old_nearest_locations=$property->propertyNearestLocations;
        $exist_location=[];
        $new_nearest_location=false;
        if($request->nearest_locations){
            foreach($nearest_locations as $index => $location){
                if($location){
                    if($distances[$index]){
                        if(!in_array($location, $exist_location)){
                            $nearest_location= new PropertyNearestLocation();
                            $nearest_location->property_id=$property->id;
                            $nearest_location->nearest_location_id=$location;
                            $nearest_location->distance=$distances[$index];
                            $nearest_location->save();
                            $new_nearest_location=true;
                        }
                        $exist_location[]=$location;

                    }
                }
            }

            if($new_nearest_location){
                if($old_nearest_locations->count() > 0){
                    foreach($old_nearest_locations as $old_location){
                        $old_location->delete();
                    }
                }
            }
        }else{
            if($old_nearest_locations->count() > 0){
                foreach($old_nearest_locations as $old_location){
                    $old_location->delete();
                }
            }

        }

        // slider image
        if($request->file('slider_images')){
            $images=$request->slider_images;
            foreach($images as $image){
                if($image != null){
                    $propertyImage=new PropertyImage();
                    $slider_ext=$image->getClientOriginalExtension();
                    // for small image
                    $slider_image= 'property-slide-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$slider_ext;
                    $slider_path='uploads/custom-images/'.$slider_image;
                    Image::make($image)
                        ->save(public_path().'/'.$slider_path);

                    $propertyImage->image=$slider_path;
                    $propertyImage->property_id=$property->id;
                    $propertyImage->save();

                }
            }
        }

        if(!blank($addProperty)){
            return response()->json(['status'=>'success','message'=>'Property Updated Successfully']);
        }else{
            return response()->json(['status'=>'error','message'=>'Property not Updated!']);
        }
    }
    public function propertyDestroy(Request $request)
    {

        $property=Property::find($request->property_id);
        $old_thumbnail=$property->thumbnail_image;
        $old_banner=$property->banner_image;
        $old_pdf=$property->file;
        PropertyAminity::where('property_id',$property->id)->delete();
        Wishlist::where('property_id',$property->id)->delete();
        PropertyReview::where('property_id',$property->id)->delete();
        PropertyNearestLocation::where('property_id',$property->id)->delete();

        foreach($property->propertyImages as $image){
            if(File::exists(public_path().'/'.$image->image)) unlink(public_path().'/'.$image->image);
        }
        PropertyImage::where('property_id',$property->id)->delete();

        if($old_pdf){
            if(File::exists(public_path().'/'.'uploads/custom-images/'.$old_pdf)) unlink(public_path().'/'.'uploads/custom-images/'.$old_pdf);
        }
        if($old_thumbnail){
            if(File::exists(public_path().'/'.$old_thumbnail)) unlink(public_path().'/'.$old_thumbnail);
        }
        if($old_banner){
            if(File::exists(public_path().'/'.$old_banner)) unlink(public_path().'/'.$old_banner);
        }

        $delete = $property->delete();
        
        if(!blank($delete)){
            return response()->json(['status'=>'success','message'=>'Property Deleted Successfully']);
        }else{
            return response()->json(['status'=>'error','message'=>'Property not Deleted!']);
        }
    }
    public function contactUs(){
        $contact=ContactInformation::first();
        
        if(!blank($contact)){
            return response()->json(['status'=>'success','message'=>'Data found Successfully','data'=>$contact]);
        }else{
            return response()->json(['status'=>'error','message'=>'Data not found!','data'=>[]]);
        }
    }
    public function aboutUs(){
        $about=About::first();
        $sections=AboutSection::all();
        $testimonials=Testimonial::where('status',1)->get();
        $propertyTypes=PropertyType::where('status',1)->orderBy('type','asc')->get();
        $aminities=Aminity::where('status',1)->orderBy('aminity','asc')->get();
        $nearestLocation = NearestLocation::all();

        if(!blank($about)){
            return response()->json(['status'=>'success','message'=>'Data found Successfully','data'=>$about]);
        }else{
            return response()->json(['status'=>'error','message'=>'Data not found!','data'=>[]]);
        }
    }
    public function privacyPolicy(){
        $privacy = PrivacyPolicy::first();
    
        if(!blank($privacy)){
            return response()->json(['status'=>'success','message'=>'Data found Successfully','data'=>$privacy]);
        }else{
            return response()->json(['status'=>'error','message'=>'Data not found!','data'=>[]]);
        }
    }
    public function termsCondition(){
        $termsCondtion=ConditionPrivacy::first();
    
        if(!blank($termsCondtion)){
            return response()->json(['status'=>'success','message'=>'Data found Successfully','data'=>$termsCondtion]);
        }else{
            return response()->json(['status'=>'error','message'=>'Data not found!','data'=>[]]);
        }
    }
    public function filterProperty(Request $request){
        
        $sortArry=[];
        
            $propertyAminities=PropertyAminity::whereHas('property',function($query) use ($request){
                if($request->property_type != 0){
                    $query->where(['property_type_id'=>$request->property_type,'status'=>1]);
                }
                if($request->city_id != 0){
                    $query->where(['city_id'=>$request->city_id,'status'=>1]);
                }
                if($request->search != 0){
                    $query->where('title','LIKE','%'.$request->search.'%')->where('status',1);
                }
    
                if($request->purpose_type != 0){
                    $query->where(['property_purpose_id'=>$request->purpose_type,'status'=>1]);
                }
                if($request->bedrooms != 0){
                    $query->where(['number_of_bedroom'=>$request->bedrooms,'status'=>1]);
                }
                if($request->bathrooms != 0){
                    $query->where(['number_of_bathroom'=>$request->bathrooms,'status'=>1]);
                }
                 if ($request->price != 0 && $request->price != '0-10000') {
    
                    $priceRange = explode('-', $request->price);            
                  
                    if (count($priceRange) === 2) {
                      
                      
                        $query->whereBetween('price', [$priceRange[0], $priceRange[1]])->where('status',1);
                    } 
                }
                if ($request->area != 0) {
                 
                    $areaRange = explode('-', $request->area);            
                   
                    if (count($areaRange) === 2) {
                        $query->whereBetween('area', [$areaRange[0], $areaRange[1]])->where('status',1);
                    } 
                }
                
    
                if($request->nearestLocations != 0){
                    
                    $nearlocations=PropertyNearestLocation::get();
                 
                    foreach($nearlocations as $nearlocation){               
                        if($nearlocation->nearest_location_id == $request->nearestLocations){
                          
                            $query->where('id',$nearlocation->property_id);
                           
                        }
                       
                    }
    
                  
                }
                $query->where(['status'=>1]);
            })->whereIn('aminity_id',$sortArry)
            ->select('property_id')->groupBy('property_id')      
            ->get();
            $propertyAminities=$propertyAminities->append($request->all());
            print_r($propertyAminities);die;
        

        $banner_image=BannerImage::find(1);
        $default_image=BannerImage::find(15);
        $menus=Navigation::all();
        $currency=Setting::first();
        $seo_text=SeoText::find(2);
        $propertyTypes=PropertyType::where('status',1)->orderBy('type','asc')->get();
        $cities=City::where('status',1)->orderBy('name','asc')->get();
        $aminities=Aminity::where('status',1)->orderBy('aminity','asc')->get();
        $websiteLang=ManageText::all();
        
        if($propertyAminities[0]){
            return response()->json(['status'=>'success','message'=>'Data found Successfully','data'=>$propertyAminities]);
        }else{
            return response()->json(['status'=>'error','message'=>'Data not found!','data'=>[]]);
        }
    }
    public function activity(Request $request){
    
        $allproperty = Property::where('user_id',$request->user_id)->count();
        $activeproperty = Property::where('user_id',$request->user_id)->where('status',1)->where('report_status',0)->get()->count();      
        $sellproperty = Property::where('user_id',$request->user_id)->where('status',0)->where('property_purpose_id',1)->get()->count();
        $rentproperty = Property::where('user_id',$request->user_id)->where('status',0)->where('property_purpose_id',2)->get()->count();
        $pro= ['allproperty'=>$allproperty , 'activeproperty'=>$activeproperty , 'sellproperty'=>$sellproperty,'rentproperty'=>$rentproperty];

        if(!blank($pro)){
            return response()->json(['status'=>'success','message'=>'Data found Successfully','data'=>$pro]);
        }else{
            return response()->json(['status'=>'error','message'=>'Data not found!','data'=>[]]);
        }
        
    }    
    public function notification(Request $request)
    {
        $support = DB::table('property_notification_contact')->where('property_notification_contact.notify_status',1)
        ->join('properties', 'property_notification_contact.property_id', '=', 'properties.id')       
        ->select(
            'property_notification_contact.*',
            'properties.title as properties_name'           
        )       
        ->get();
        foreach ($support as $key=> $value) {
            $support[$key] = 'Admin has Updated  ticket status for '.$value->properties_name.' Property.';
        }  
        $support_chat = DB::table('support_message')->where('notify_status',1)->where('receiver_id',$request->user_id)->get();
        $propertynotify = Property::where('notify_status',1)->where('user_id',$request->user_id)->get();     
        
        foreach ($propertynotify as $key=> $value) {
            $propertynotify[$key] = $value->title.' Property updated status';
        }  

        $websiteLang=ManageText::all();
        $pro= ['support'=>$support , 'propertynotify'=>$propertynotify];

        
        if(!blank($pro)){
            return response()->json(['status'=>'success','message'=>'Data found Successfully','data'=>$pro]);
        }else{
            return response()->json(['status'=>'error','message'=>'Data not found!','data'=>[]]);
        }

    }
    public function sendForgetEmail(Request $request){
 
         $validator = Validator::make($request->all(), [
            'email'=>'required|email',
            'g-recaptcha-response'=>new Captcha()
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }
 
         $user=User::where('email',$request->email)->first();
 
         MailHelper::setMailConfig();
         if($user){
             $user->forget_password_token=Str::random(100);
             $user->save();
             $template=EmailTemplate::where('id',1)->first();
             $message=$template->description;
             $subject=$template->subject;
             $message=str_replace('{{name}}',$user->name,$message);
             Mail::to($user->email)->send(new ForgetPassword($user,$message,$subject));
 
             $notify_lang=NotificationText::all();
             $notification=$notify_lang->where('lang_key','forget_pass')->first()->custom_text;
             return response()->json(['status'=>'success','message'=>$notification]);
 
         }else{
             $notify_lang=NotificationText::all();
             $notification=$notify_lang->where('lang_key','email_not_exist')->first()->custom_text;
             return response()->json(['status'=>'error','message'=>$notification]);
         }
 
    }    
    public function sendRequest(Request $request){

        $validator = Validator::make($request->all(), [
            'property_id'=>'required',
            'email'=>'required',
            'phone'=>'required',
            'name'=>'required',
            'message'=>'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }

        $user=Auth::guard('web')->user();

            $array = [
                   'user_id'     =>   $request->user_id, 
                   'name'   =>   $request->name,
                   'email'   =>   $request->email,
                   'phone'   =>   $request->phone,
                   'message'   =>   $request->message,
                   'property_id'   =>   $request->property_id,
                   'form_status'   =>   $request->form_status,
                   'status'   =>   1,
                   'agent_id'   =>   $request->agent_id
            ];
            

       $result = DB::table('property_notification_contact')->insertGetId($array);

        if($result){
            $notification='Your request has been sent successfully';
            $notification=array('messege'=>$notification,'status'=>'success');
            return response()->json($notification);
        }{
            $notification='Please Tyr Again!';
            $notification=array('messege'=>$notification,'status'=>'error');
            return response()->json($notification);
        }


    }
    public function chatSupportRequest(Request $request)
    {
        if($request->usertype == 'User'){
            if($request->form_status == 1){
                $support = DB::table('property_notification_contact')->where('property_notification_contact.user_id',$request->user_id)->where('property_notification_contact.form_status',1)
                ->join('properties', 'property_notification_contact.property_id', '=', 'properties.id')       
                ->select('property_notification_contact.*','properties.title as properties_name')->get();  
            }else if($request->form_status == 2){
                $support = DB::table('property_notification_contact')->where('property_notification_contact.user_id',$request->user_id)->where('property_notification_contact.form_status',2)
                ->join('properties', 'property_notification_contact.property_id', '=', 'properties.id')       
                ->select('property_notification_contact.*','properties.title as properties_name')->get();  
            }
        }elseif($request->usertype == 'Agent'){
            if($request->form_status == 1){
                $support = DB::table('property_notification_contact')->where('property_notification_contact.user_id',$request->user_id)->where('property_notification_contact.form_status',1)
                ->join('properties', 'property_notification_contact.property_id', '=', 'properties.id')       
                ->select('property_notification_contact.*','properties.title as properties_name')->get();  
            }else if($request->form_status == 2){
                $support = DB::table('property_notification_contact')->where('property_notification_contact.agent_id',$request->user_id)->where('property_notification_contact.form_status',2)
                ->join('properties', 'property_notification_contact.property_id', '=', 'properties.id')       
                ->select('property_notification_contact.*','properties.title as properties_name')->get();  
            }
        }
        
        if($support){
            $notification='Data found Successfully';
            $notification=array('messege'=>$notification,'status'=>'success','data'=>$support);
            return response()->json($notification);
        }{
            $notification='Data not found!';
            $notification=array('messege'=>$notification,'status'=>'error','data'=>[]);
            return response()->json($notification);
        }
    }
    public function chatSupportRequestUpdate(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'request_id'=>'required',
            'status'=>'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }

        $update = DB::table('property_notification_contact')->where('id',$request->request_id)->update(array('status' => $request->status));
        
        if($update){
            $notification='Status Updated Successfully';
            $message=$notification;
            return response()->json(['status'=>'success','message'=>$notification]);
        }else{
            $notification='Status Not Updated!';
            $message=$notification;
            return response()->json(['status'=>'error','message'=>$notification]);
        }
    }
    public function getConversations(Request $request)
   {
        $validator = Validator::make($request->all(), [
            'message_id'=>'required',
            'propertyId'=>'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }

        $conversations =  MessageComment::where(['message_id'=>$request->message_id, 'propertyId' => $request->propertyId])->with('user')->get();
        if($conversations){
            $notification='Data found Successfully';
            $notification=array('messege'=>$notification,'status'=>'success','data'=>$conversations);
            return response()->json($notification);
        }{
            $notification='Data not found!';
            $notification=array('messege'=>$notification,'status'=>'error','data'=>[]);
            return response()->json($notification);
        }
   }
   public function storeConversations(Request $request)
    {        
        $validator = Validator::make($request->all(), [
            'user_id'=>'required',
            'message'=>'required',
            'propertyId'=>'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }
        if($request->message_id == ''){
            $message_info = Message::create(
                [
                'sender_id' => $request->user_id,
                'receiver_id' => $request->receiver_id,
                'property_id' => $request->propertyId
                ]
            );
            $request->message_id = $message_info->id;
        }
        $conversation = new MessageComment;
        $conversation->user_id = $request->user_id;
        $conversation->message = $request->message;
        $conversation->message_id = !empty($request) ?  $request->message_id : '';
        $conversation->propertyId = $request->propertyId;
        $conversations = $conversation->save();
        
        if($conversations){
            $notification='Message sent Successfully';
            $notification=array('messege'=>$notification,'status'=>'success','data'=>$conversation);
            return response()->json($notification);
        }{
            $notification='Message not sent!';
            $notification=array('messege'=>$notification,'status'=>'error','data'=>[]);
            return response()->json($notification);
        }
   }
   public function supportSendmessage(Request $request)
   {
        $validator = Validator::make($request->all(), [
            'support_id'=>'required',
            'user_id'=>'required',
            'message'=>'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }

        $support['support_id'] = $request->support_id;
        $support['sender_id'] = $request->user_id;
        $support['receiver_id'] = '0';                
        $support['message'] = $request->message;

        $conversations = DB::table('support_message')->insert($support);
        if($conversations){
            $notification='Message sent Successfully';
            $notification=array('messege'=>$notification,'status'=>'success','data'=>$support);
            return response()->json($notification);
        }{
            $notification='Message not sent!';
            $notification=array('messege'=>$notification,'status'=>'error','data'=>[]);
            return response()->json($notification);
        }
   }
   public function supportGetmessage(Request $request)
   {
        $validator = Validator::make($request->all(), [
            'support_id'=>'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }
        $support_message = DB::table('support_message')->where('support_id',$request->support_id)->get();

        if($support_message){
            $notification='Message found Successfully';
            $notification=array('messege'=>$notification,'status'=>'success','data'=>$support_message);
            return response()->json($notification);
        }{
            $notification='Message not found!';
            $notification=array('messege'=>$notification,'status'=>'error','data'=>[]);
            return response()->json($notification);
        }
   }
   
   public function getChatUser(Request $request)
   {
        $validator = Validator::make($request->all(), [
            
            'user_id'=>'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }
        $user_messages = [];
        if($request->usertype == 'Agent'){

            $getIds = DB::table("messages")->select(DB::raw("GROUP_CONCAT(DISTINCT sender_id) as user_id"),DB::raw("GROUP_CONCAT(DISTINCT property_id) as property_id"))->where(['receiver_id'=>$request->user_id])->first();
            if(isset($getIds) && !empty($getIds)){
                $ids = explode(',', $getIds->user_id);
                $user_messages = User::where('id','!=', $request->user_id)->whereIn('id', $ids)->get();
                $property_ids = explode(',', $getIds->property_id);
                $property_name = Property::select('title')->whereIn('id', $property_ids)->get();
                foreach ($property_name as $index => $value) {
                    $user_messages[$index]->property_names = $value['title'];
                }
            }
        
        }else if($request->usertype == 'User'){
            $getIds = DB::table("messages")->select(DB::raw("GROUP_CONCAT(DISTINCT receiver_id) as agent_id"),DB::raw("GROUP_CONCAT(DISTINCT property_id) as property_id"))->where(['sender_id'=>$request->user_id])->first();
            if(isset($getIds) && !empty($getIds)){
                $ids = explode(',', $getIds->agent_id);
                $user_messages = User::where('id','!=', $request->user_id)->whereIn('id', $ids)->get();
                $property_ids = explode(',', $getIds->property_id);
                $property_name = Property::select('title')->whereIn('id', $property_ids)->get();
                foreach ($property_name as $index => $value) {
                    $user_messages[$index]->property_names = $value['title'];
                }
            }
        }
        if($user_messages){
            $notification='Data found Successfully';
            $notification=array('messege'=>$notification,'status'=>'success','data'=>$user_messages);
            return response()->json($notification);
        }{
            $notification='Data not found!';
            $notification=array('messege'=>$notification,'status'=>'error','data'=>[]);
            return response()->json($notification);
        }
   }
  
   public function getMessageId(Request $request)
   {
        $validator = Validator::make($request->all(), [
            
            'user_id'=>'required',
            'receiver_id'=>'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }

        $support = DB::table('messages')->where(['messages.sender_id'=>$request->user_id])->where('messages.receiver_id',$request->receiver_id)
        ->select('messages.id as message_id','messages.property_id as property_id')->first();
        if(empty($support)){
            $support = DB::table('messages')->where(['messages.receiver_id'=>$request->user_id])->where('messages.sender_id',$request->receiver_id)
            ->select('messages.id as message_id','messages.property_id as property_id')->first();
        }  
        
        if($support){
            $notification='Data found Successfully';
            $notification=array('messege'=>$notification,'status'=>'success','data'=>$support);
            return response()->json($notification);
        }else{
            $notification='Data not found!';
            $notification=array('messege'=>$notification,'status'=>'error','data'=>[]);
            return response()->json($notification);
        }
   }
   public function property_status(Request $request){
        $update = DB::table('properties')->where('id',$request->property_id)->update(array('status' => $request->status));
        if($update){
            $notification='Your Status Updated Successfully';
            return response()->json(['status'=>'success','message'=>$notification]);
        }else{
            $notification='Your Status Not Updated!';
            return response()->json(['status'=>'error','message'=>$notification]);
        }

    }
    
    public function agentprofile(Request $request)
    {
        $user = User::where('id',$request->agent_id)->first();
        $default_image=BannerImage::find(15);
        $agent_default_profile=BannerImage::find(18);
        $websiteLang=ManageText::all();
        $property = Property::where('user_id',$request->agent_id)->orwhere('agent_id',$request->agent_id)->count();
        $assignproperty = Property::where('agent_id',$request->agent_id)->count();
        $agentdata = ['user'=>$user,'property'=>$property ,'assignproperty'=>$assignproperty];
        
        if($agentdata){
            $notification='Data found successfully';
            return response()->json(['status'=>'success','message'=>$notification,'data'=>$agentdata]);
        }else{
            $notification='Data Not found!';
            return response()->json(['status'=>'error','message'=>$notification]);
        }

    }
    public function pricingPlan(){
        $packages=Package::where('status',1)->orderBy('package_order','asc')->get();
        if($packages){
            $notification='Data found successfully';
            return response()->json(['status'=>'success','message'=>$notification,'data'=>$packages]);
        }else{
            $notification='Data Not found!';
            return response()->json(['status'=>'error','message'=>$notification]);
        }
    }

    
    public function stripePayment(Request $request){

        $id = $request->package_id;
        $stripes=PaymentAccount::first();
        $currency=Setting::first();
        $package=Package::find($id);
        $user=User::find($request->user_id);

        if($package){
            try {

            $stripe = new \Stripe\StripeClient($stripes->stripe_secret);
            $token = $stripe->tokens->create([
            'card' => [
                'number' => $request->number,
                'exp_month' => $request->exp_month,
                'exp_year' => $request->exp_year,
                'cvc' => $request->cvc,
            ],
            ]);

            Stripe\Stripe::setApiKey($stripes->stripe_secret);

            $setting=Setting::first();
            $amount_usd= round($package->price * $stripes->stripe_currency_rate,2);
            $payableAmount = round($package->price * $stripes->stripe_currency_rate,2);
            $result=Stripe\Charge::create ([
                    "amount" =>$payableAmount * 100,
                    "currency" => $stripes->stripe_currency_code,
                    "source" => $token['id'],
                    "description" => env('APP_NAME')
            ]);

            $order=new Order();
            $order->user_id=$user->id;
            $order->order_id='#'.rand(22,44).date('Ydmis');
            $order->package_id=$package->id;
            $order->purchase_date=date('Y-m-d');
            $order->expired_day=$package->number_of_days;
            $order->expired_date=$package->number_of_days ==-1 ? null : date('Y-m-d', strtotime($package->number_of_days.' days'));
            $order->payment_method="Stripe";
            $order->transaction_id=$result->balance_transaction;
            $order->payment_status=1;
            $order->amount_usd=$amount_usd;
            $order->amount_real_currency=$package->price;
            $order->currency_type=$setting->currency_name;
            $order->currency_icon=$setting->currency_icon;
            $order->status=1;
            $order->save();

            // MailHelper::setMailConfig();

            // $order_details='Purchase Date: '.$order->purchase_date.'<br>';
            // $order_details .='Expired Date: '.$order->expired_date;

            // // send email
            // $template=EmailTemplate::where('id',6)->first();
            // $message=$template->description;
            // $subject=$template->subject;
            // $message=str_replace('{{user_name}}',$user->name,$message);
            // $message=str_replace('{{payment_method}}','Stripe',$message);
            // $total_amount=$currency->currency_icon. $package->price;
            // $message=str_replace('{{amount}}',$total_amount,$message);
            // $message=str_replace('{{order_details}}',$order_details,$message);
            // Mail::to($user->email)->send(new OrderConfirmation($message,$subject));

            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','order_success')->first()->custom_text;
            // $notification='Data found successfully';
            return response()->json(['status'=>'success','message'=>$notification]);
        
            } catch (Stripe\Exception\CardException $e) {
                return $e;
            }

        }else{
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','something')->first()->custom_text;
            return response()->json(['status'=>'error','message'=>$notification]);
        }
        
    }
    public function faq(){
        $faqs=Faq::where('status',1)->get();
        if($faqs){
            $notification='Data found successfully';
            return response()->json(['status'=>'success','message'=>$notification,'data'=>$faqs]);
        }else{
            $notification='Data Not found!';
            return response()->json(['status'=>'error','message'=>$notification]);
        }

    }
    public function vocabulary_category()
    {
        $categories=BlogCategory::all();
        if($categories){
            $notification='Data found successfully';
            return response()->json(['status'=>'success','message'=>$notification,'data'=>$categories]);
        }else{
            $notification='Data Not found!';
            return response()->json(['status'=>'error','message'=>$notification]);
        }
    }
    public function vocabulary()
    {
        $blogs=Blog::with('category')->get();
        if($blogs){
            $notification='Data found successfully';
            return response()->json(['status'=>'success','message'=>$notification,'data'=>$blogs]);
        }else{
            $notification='Data Not found!';
            return response()->json(['status'=>'error','message'=>$notification]);
        }
    }
    public function practiceDialogue()
    {
        $practices=Practice::all();
        if($practices){
            $notification='Data found successfully';
            return response()->json(['status'=>'success','message'=>$notification,'data'=>$practices]);
        }else{
            $notification='Data Not found!';
            return response()->json(['status'=>'error','message'=>$notification]);
        }
    }
    public function segments()
    {
        $segments=Segments::all();
        foreach ($segments as $key => $value) {
            $segments->practice  = $value->practice->title;
        }
        if($segments){
            $notification='Data found successfully';
            return response()->json(['status'=>'success','message'=>$notification,'data'=>$segments]);
        }else{
            $notification='Data Not found!';
            return response()->json(['status'=>'error','message'=>$notification]);
        }
    }
    public function pushNotification(Request $request)
    {

        $data=[];
        $data['message']= "Hello Rajkumar ji";

        $data['booking_id']="Hy";
        
        $tokens = [];
        $tokens[] = $request->tokens;
        $response = $this->sendFirebasePush($tokens,$data);

    }
    public function sendFirebasePush($tokens, $data)
    {

        $serverKey = 'AAAAuiun6Jw:APA91bGXTgUlIA11_MZ-F8KCHjd2UNBnXTB07Y9g_S-KBT_ELBzyIqig07J39Qs-kttD4X4HkjGd7lBk9dIdsOZO3y1NjAxWOE8Czv-lqRkUxPw-r-Z-fA1_bO_E1k1jxp2hrHnLNcbV';
        // prep the bundle
        $msg = array
        (
            'message'   => $data['message'],
            'booking_id' => $data['booking_id'],
        );

        $notifyData = [
                "body" => $data['message'],
                "title"=> "Port App"
        ];

        $registrationIds = $tokens;
        
        if(count($tokens) > 1){
            $fields = array
            (
                'registration_ids' => $registrationIds, //  for  multiple users
                'notification'  => $notifyData,
                'data'=> $msg,
                'priority'=> 'High'
            );
        }
        else{
            $fields = array
            (
                'to' => $registrationIds[0], //  for  only one users
                'notification'  => $notifyData,
                'data'=> $msg,
                'priority'=> 'High'
            );
        }
            
        $headers[] = 'Content-Type: application/json';
        $headers[] = 'Authorization: key='. $serverKey;

        $ch = curl_init();
        curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
        curl_setopt( $ch,CURLOPT_POST, true );
        curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
        curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
        // curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
        curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
        $result = curl_exec($ch );
        if ($result === FALSE) 
        {
            die('FCM Send Error: ' . curl_error($ch));
        }
        curl_close( $ch );
        echo $result;
        exit;
    }

}