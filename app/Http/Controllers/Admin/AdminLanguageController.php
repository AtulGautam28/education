<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Language;
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

class AdminLanguageController extends Controller
{
    public function index(){
       
        $language=Language::orderBy('id','desc')->get();
        $websiteLang=ManageText::all();
        $currency=Setting::first();
        $confirmNotify=$websiteLang->where('lang_key','are_you_sure')->first()->custom_text;
       
        return view('admin.settings.language.index',compact('language','websiteLang','currency','confirmNotify'));
    }
    public function create(){
             
      
        $websiteLang=ManageText::all();
        $currency=Setting::first();
        $confirmNotify=$websiteLang->where('lang_key','are_you_sure')->first()->custom_text;
        return view('admin.settings.language.create',compact('websiteLang','currency','confirmNotify'));
    }
    public function store(Request $request){  
  
        $rules = [
          
            'title'=>'required',
            'language_code'=>'required',
            'seo_title'=>'required',
            'status'=>'required'
        ];
        $customMessages = [
            'title.required' => 'Title filed is required',
            'language_code.required' =>'Language code filed is required',
            'seo_title.required' => 'Seo Title filed is required',
            'status.required' => 'Status filed is required',
           
        ];
        $this->validate($request, $rules, $customMessages);
      
                     
                          
                $language = new Language;
                $language->title=$request->title;
                $language->language_code=$request->language_code;
                $language->seo_title=$request->seo_title;              
                $language->status=$request->status;
                $language->save();
               

        $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','create')->first()->custom_text;
            $notification=array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->route('admin.language.setting')->with($notification);
            // return view('admin.tutorial.index')->with('notification');
      
             
    }
    public function destroy($id)
    {
  
        $language=Language::find($id);
        if($language){
            
            $language->delete();
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','delete')->first()->custom_text;
            $notification=array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->route('admin.language.setting')->with($notification);
        }else{
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','something')->first()->custom_text;
            $notification=array('messege'=>$notification,'alert-type'=>'error');
            return redirect()->route('admin.language.setting')->with($notification);
        }
    }

    public function edit($id)
    {
      
        $language=Language::find($id);        
        $websiteLang=ManageText::all();
        $currency=Setting::first();
        $confirmNotify=$websiteLang->where('lang_key','are_you_sure')->first()->custom_text;
        return view('admin.settings.language.edit',compact( 'language','websiteLang','currency','confirmNotify'));
    }
    public function update(Request $request, $id)
    {
            $language=Language::find($id);         
            $language->title=$request->title;
            $language->language_code=$request->language_code;
            $language->seo_title=$request->seo_title;              
            $language->status=$request->status;
            $language->save();
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','update')->first()->custom_text;
            $notification=array('messege'=>$notification,'alert-type'=>'success');
            return redirect()->route('admin.language.setting')->with($notification);
         

    }

}
