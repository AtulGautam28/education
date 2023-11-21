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
use App\Tutorial;
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
use App\Mail\ContactMessageInformation;
use App\ContactMessage;
use App\TextFormate;
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
             $res = Mail::to($user->email)->send(new ForgetPassword($user,$message,$subject));
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

        $serverKey = env("SSH_KEY");
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

    public function videoGallery(){
       
        $orders=Tutorial::orderBy('id','desc')->get();
        if($orders){
            $notification='Data found successfully';
            return response()->json(['status'=>'success','message'=>$notification,'data'=>$orders]);
        }else{
            $notification='Data Not found!';
            return response()->json(['status'=>'error','message'=>$notification]);
        }
    }
    public function sendMessage(Request $request){

        $validator = Validator::make($request->all(), [
            'name'=>'required',
            'email'=>'required|email',
            'subject'=>'required',
            'message'=>'required',
            'g-recaptcha-response'=>new Captcha()
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->messages()->first()]);
        }

        $contact=[
            'email'=>$request->email,
            'phone'=>$request->phone,
            'name'=>$request->name,
            'subject'=>$request->subject,
            'message'=>$request->message,
        ];

        $setting=Setting::first();
        $notify=NotificationText::first();
        if($setting->save_contact_message==1){
            $sendMessage = ContactMessage::create($contact);
        }

        if($sendMessage){
            MailHelper::setMailConfig();

            $template=EmailTemplate::where('id',2)->first();
            $message=$template->description;
            $subject=$template->subject;
            $message=str_replace('{{name}}',$contact['name'],$message);
            $message=str_replace('{{email}}',$contact['email'],$message);
            $message=str_replace('{{phone}}',$contact['phone'],$message);
            $message=str_replace('{{subject}}',$contact['subject'],$message);
            $message=str_replace('{{message}}',$contact['message'],$message);

            Mail::to($setting->email)->send(new ContactMessageInformation($message,$subject));

            $notification='Your request has been sent';
            return response()->json(['status'=>'success','message'=>$notification]);
        
        }else{
            $notification='Your request not sent please try again latter';
            return response()->json(['status'=>'error','message'=>$notification]);
                        
        }

    }
    public function testFomate(){
       
        $testformate=TextFormate::orderBy('id','asc')->get();
        if($testformate){
            $notification='Data found successfully';
            return response()->json(['status'=>'success','message'=>$notification,'data'=>$testformate]);
        }else{
            $notification='Data Not found!';
            return response()->json(['status'=>'error','message'=>$notification]);
        }
    }

}