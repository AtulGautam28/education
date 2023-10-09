<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Tutorial;
use App\ContactMessage;
use App\Setting;
use App\ManageText;
use App\ValidationText;
use App\Property;
use App\NotificationText;
use App\EmailTemplate;
use App\Package;
use App\Helpers\MailHelper;
use App\Mail\PaymentAccept;
use Mail;
use File;

class AdminToturialController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index(){
       
        $orders=Tutorial::orderBy('id','desc')->get();
        $websiteLang=ManageText::all();
        $currency=Setting::first();
        $confirmNotify=$websiteLang->where('lang_key','are_you_sure')->first()->custom_text;
        return view('admin.tutorial.index',compact('orders','websiteLang','currency','confirmNotify'));
    }
    public function create(){
             
      
        $websiteLang=ManageText::all();
        $currency=Setting::first();
        $confirmNotify=$websiteLang->where('lang_key','are_you_sure')->first()->custom_text;
        return view('admin.tutorial.create',compact('websiteLang','currency','confirmNotify'));
    }
    public function store(Request $request){      
  
        $rules = [
          
            'title'=>'required',
            'video'=>'required',
            'description'=>'required'
        ];
        $customMessages = [
            'title.required' => 'Title filed is required',
            'video.required' =>'Video filed is required',
            'description.required' => 'Description filed is required',
           
        ];
        $this->validate($request, $rules, $customMessages);
      
            if($request->video){              
                $video=$request->video;
                $extention=$video->getClientOriginalExtension();
                $name= 'tutorial-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
                $video_path='uploads/video/'.$name;
                $request->video->move(public_path('uploads/video'), $video_path);              
               $tutorial = new Tutorial;
                $tutorial->title=$request->title;
                $tutorial->discription=$request->description;
                $tutorial->video=$video_path;
                $tutorial->status=$request->status;
                $tutorial->save();
            }     

        $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','create')->first()->custom_text;
            $notification=array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->route('admin.toturial')->with($notification);
            // return view('admin.tutorial.index')->with('notification');
      
             
    }
    public function destroy($id)
    {
        $tutorial=Tutorial::find($id);
        if($tutorial){
            
            if(File::exists(public_path().'/'.$tutorial->video)) unlink(public_path().'/'.$tutorial->video);
            $tutorial->delete();
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','delete')->first()->custom_text;
            $notification=array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->route('admin.toturial')->with($notification);
        }else{
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','something')->first()->custom_text;
            $notification=array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->route('admin.toturial')->with($notification);
        }
    }

    public function edit($id)
    {
        $tutorial=Tutorial::find($id);        
        $websiteLang=ManageText::all();
        $currency=Setting::first();
        $confirmNotify=$websiteLang->where('lang_key','are_you_sure')->first()->custom_text;
        return view('admin.tutorial.edit',compact( 'tutorial','websiteLang','currency','confirmNotify'));
    }
    public function update(Request $request, $id)
    {
        $tutorial=Tutorial::find($id); 
        if($request->video){             
                      
            $video=$request->video;
            $old_video=$request->video;
            if($old_video){
             if(File::exists(public_path().'/'."uploads/custom-images/".$old_video)) unlink(public_path().'/'."uploads/custom-images/".$old_video);
            }
            $extention=$video->getClientOriginalExtension();
            $name= 'tutorial-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $video_path='uploads/video/'.$name;
            $request->video->move(public_path('uploads/video'), $video_path);

            $tutorial->title=$request->title;
            $tutorial->discription=$request->description;
            $tutorial->video=$video_path;
            $tutorial->status=$request->status;
            $tutorial->save();
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','update')->first()->custom_text;
            $notification=array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->route('admin.toturial')->with($notification);
        }else{
            $tutorial->title=$request->title;
            $tutorial->discription=$request->description;          
            $tutorial->status=$request->status;
            $tutorial->save();
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','update')->first()->custom_text;
            $notification=array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->route('admin.toturial')->with($notification);
        }     

    }
}
