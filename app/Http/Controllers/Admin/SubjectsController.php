<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Segments;
use Illuminate\Http\Request;
use App\BannerImage;
use App\ManageText;
use App\Subject;
use App\NotificationText;
use Image;
use File;

class SubjectsController extends Controller
{
    
    public function __construct()
    {
        $this->middleware('auth:admin');
        
    }


    public function index()
    {
        $subjects=Subject::all();
        $websiteLang=ManageText::all();
        $confirmNotify=$websiteLang->where('lang_key','are_you_sure')->first()->custom_text;
        return view('admin.subjects.index',compact('subjects','websiteLang','confirmNotify'));
    }


    public function store(Request $request)
    {
        
        $this->validate($request,[
            'title'=>'required',
            'description'=>'required',
            
        ]);
        $subject=new Subject();
        $subject->title=$request->title;       
        $subject->description=$request->description;
        $subject->status=$request->status;
        $subject->save();

        $notify_lang=NotificationText::all();
        $notification=$notify_lang->where('lang_key','create')->first()->custom_text;
        $notification=array('messege'=>$notification,'alert-type'=>'success');

        return redirect()->back()->with($notification);
    }


    public function update(Request $request, $id)
    {
        $this->validate($request,[
            'title'=>'required',
            'description'=>'required',
        ]);
        $subject=Subject::find($id);

        $subject->title=$request->title;
        $subject->description=$request->description;
        $subject->status=$request->status;
        $subject->save();
        $notify_lang=NotificationText::all();
        $notification=$notify_lang->where('lang_key','update')->first()->custom_text;
        $notification=array('messege'=>$notification,'alert-type'=>'success');

        return redirect()->back()->with($notification);
    }

    public function destroy($id)
    { 
        
        $subject=Subject::find($id);
        $subject->delete();

        $notify_lang=NotificationText::all();
        $notification=$notify_lang->where('lang_key','delete')->first()->custom_text;
        $notification=array('messege'=>$notification,'alert-type'=>'success');

        return redirect()->back()->with($notification);
    }
     
    

    public function changeStatus($id){
        $faq=Faq::find($id);
        if($faq->status==1){
            $faq->status=0;
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','inactive')->first()->custom_text;
            $message=$notification;
        }else{
            $faq->status=1;
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','active')->first()->custom_text;
            $message=$notification;
        }
        $faq->save();
        return response()->json($message);

    }


    public function faqImage(Request $request){


        

        $this->validate($request,[
            'image'=>'required'
        ]);

        $faq_image=BannerImage::find(20);

        $old_image=$faq_image->image;
        $image=$request->image;
        $extention=$image->getClientOriginalExtension();
        $name= 'faq-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
        $image_path='uploads/website-images/'.$name;
        Image::make($image)
            ->save(public_path().'/'.$image_path);

        $faq_image->image=$image_path;
        $faq_image->save();

        if(File::exists(public_path().'/'.$old_image))unlink(public_path().'/'.$old_image);

        $notify_lang=NotificationText::all();
        $notification=$notify_lang->where('lang_key','update')->first()->custom_text;
        $notification=array('messege'=>$notification,'alert-type'=>'success');

        return back()->with($notification);
    }
}
