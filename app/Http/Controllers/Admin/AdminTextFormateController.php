<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\TextFormate;
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

class AdminTextFormateController extends Controller
{
    public function index(){
       
        $textformate=TextFormate::orderBy('id','desc')->get();
        $websiteLang=ManageText::all();
        $currency=Setting::first();
        $confirmNotify=$websiteLang->where('lang_key','are_you_sure')->first()->custom_text;
        return view('admin.textformate.index',compact('textformate','websiteLang','currency','confirmNotify'));
    }
    public function create(){
             
      
        $websiteLang=ManageText::all();
        $currency=Setting::first();
        $confirmNotify=$websiteLang->where('lang_key','are_you_sure')->first()->custom_text;
        return view('admin.textformate.create',compact('websiteLang','currency','confirmNotify'));
    }
    public function store(Request $request){    
          
  
        $rules = [
          
            'title'=>'required',
            'image'=>'required',
            'description'=>'required'
        ];
        $customMessages = [
            'title.required' => 'Title filed is required',
            'image.required' =>'Image filed is required',
            'description.required' => 'Description filed is required',
           
        ];
        $this->validate($request, $rules, $customMessages);
      
            if($request->image){              
                $image=$request->image;
                $extention=$image->getClientOriginalExtension();
                $name= 'tutorial-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
                $image_path='uploads/custom-images/'.$name;
                $request->image->move(public_path('uploads/custom-images'), $image_path);              
                $textformate = new TextFormate;
                $textformate->title=$request->title;
                $textformate->discription=$request->description;
                $textformate->image=$image_path;
                $textformate->status=$request->status;
                $textformate->save();
            }     

        $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','create')->first()->custom_text;
            $notification=array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->route('admin.textformate')->with($notification);
            // return view('admin.tutorial.index')->with('notification');
      
             
    }
    public function destroy($id)
    {
        $textformate=TextFormate::find($id);
        if($textformate){
            
            if(File::exists(public_path().'/'.$textformate->image)) unlink(public_path().'/'.$textformate->image);
            $textformate->delete();
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','delete')->first()->custom_text;
            $notification=array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->route('admin.textformate')->with($notification);
        }else{
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','something')->first()->custom_text;
            $notification=array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->route('admin.textformate')->with($notification);
        }
    }

    public function edit($id)
    {
        $textformate=TextFormate::find($id);        
        $websiteLang=ManageText::all();
        $currency=Setting::first();
        $confirmNotify=$websiteLang->where('lang_key','are_you_sure')->first()->custom_text;
        return view('admin.textformate.edit',compact( 'textformate','websiteLang','currency','confirmNotify'));
    }
    public function update(Request $request, $id)
    {
        $tutorial=TextFormate::find($id); 
        if($request->image){             
                      
            $image=$request->image;
            $old_image=$request->image;
            if($old_image){
             if(File::exists(public_path().'/'."uploads/custom-images/".$old_image)) unlink(public_path().'/'."uploads/custom-images/".$old_image);
            }
            $extention=$image->getClientOriginalExtension();
            $name= 'textformate-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $image_path='uploads/custom-images/'.$name;
            $request->image->move(public_path('uploads/custom-images'), $image_path);

            $tutorial->title=$request->title;
            $tutorial->discription=$request->description;
            $tutorial->image=$image_path;
            $tutorial->status=$request->status;
            $tutorial->save();
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','update')->first()->custom_text;
            $notification=array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->route('admin.textformate')->with($notification);
        }else{
            $tutorial->title=$request->title;
            $tutorial->discription=$request->description;          
            $tutorial->status=$request->status;
            $tutorial->save();
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','update')->first()->custom_text;
            $notification=array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->route('admin.textformate')->with($notification);
        }     

    }
}
