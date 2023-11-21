<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\BannerImage;
use App\ManageText;
use App\Practice;
use App\Segments;
use App\NotificationText;
use Image;
use File;

class SegmentsController extends Controller
{
    
    public function __construct()
    {
        $this->middleware('auth:admin');
    }


    public function index()
    {
        $segments=Segments::all();
        $practices=Practice::all();
        $websiteLang=ManageText::all();
        $confirmNotify=$websiteLang->where('lang_key','are_you_sure')->first()->custom_text;
        return view('admin.segments.index',compact('segments','practices','websiteLang','confirmNotify'));
    }
    public function practice_filter($id)
    {
        $segments=Segments::where('practice_id',$id)->get();
        $practices=Practice::all();
        $websiteLang=ManageText::all();
        $confirmNotify=$websiteLang->where('lang_key','are_you_sure')->first()->custom_text;
        return view('admin.segments.index',compact('segments','practices','websiteLang','confirmNotify'));
    }


    public function store(Request $request)
    {
        $this->validate($request,[
            'question'=>'required',
            'answer'=>'required',
            'question_audio'=>'required',
            'answer_audio'=>'required',
            'practice_id'=>'required',
        ]);

        if(!empty($request->question_audio) && !empty($request->answer_audio)){

            $question_audio=$request->question_audio;
            $extention=$question_audio->getClientOriginalExtension();
            $question_audio_name= 'mp3-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $question_audio_path='uploads/segments-audio/'.$question_audio_name;
            $request->question_audio->move(public_path('uploads/segments-audio'), $question_audio_path);  
            $question_audio=$request->question_audio;
            
            $answer_audio=$request->answer_audio;
            $extention=$answer_audio->getClientOriginalExtension();
            $answer_audio_name= 'mp3-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $answer_audio_path='uploads/segments-audio/'.$answer_audio_name;
            $request->answer_audio->move(public_path('uploads/segments-audio'), $answer_audio_path);  
            $answer_audio=$request->answer_audio;
        }

        $segments=new Segments();
        $segments->practice_id=$request->practice_id;
        $segments->question=$request->question;
        $segments->gender=$request->gender;
        $segments->answer=$request->answer;
        // $segments->answer_audio=$answer_audio_path;
        // $segments->question_audio=$question_audio_path;
        $segments->status=$request->status;
        $segments->save();

        $notify_lang=NotificationText::all();
        $notification=$notify_lang->where('lang_key','create')->first()->custom_text;
        $notification=array('messege'=>$notification,'alert-type'=>'success');

        return redirect()->back()->with($notification);
    }
    public function update(Request $request, $id)
    {
        $this->validate($request,[
            'question'=>'required',
            'answer'=>'required',
            'practice_id'=>'required',
            'gender'=>'required',
        ]);
        
        $segments=Segments::find($id);

        $segments->practice_id=$request->practice_id;
        $segments->question=$request->question;
        $segments->answer=$request->answer;
        $segments->gender=$request->gender;

        $segments->status=$request->status;

        $old_answer_audio=$request->old_answer_audio;
        $old_question_audio=$request->old_question_audio;
        
        if(!empty($request->question_audio) && !empty($request->answer_audio)){

            $question_audio=$request->question_audio;
            $extention=$question_audio->getClientOriginalExtension();
            $question_audio_name= 'mp3-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $question_audio_path='uploads/segments-audio/'.$question_audio_name;
            $request->question_audio->move(public_path('uploads/segments-audio'), $question_audio_path);  
            $question_audio=$request->question_audio;
            $segments->question_audio=$question_audio_path;
            
            $answer_audio=$request->answer_audio;
            $extention=$answer_audio->getClientOriginalExtension();
            $answer_audio_name= 'mp3-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $answer_audio_path='uploads/segments-audio/'.$answer_audio_name;
            $request->answer_audio->move(public_path('uploads/segments-audio'), $answer_audio_path);  
            $answer_audio=$request->answer_audio;
            $segments->answer_audio=$answer_audio_path;
            if(!empty($old_question_audio) && !empty($old_answer_audio) ){

                if(File::exists(public_path().'/'.$old_answer_audio)) unlink(public_path().'/'.$old_answer_audio);
                if(File::exists(public_path().'/'.$old_question_audio)) unlink(public_path().'/'.$old_question_audio);
            }

        }

        $segments->save();
                        
        $notify_lang=NotificationText::all();
        $notification=$notify_lang->where('lang_key','update')->first()->custom_text;
        $notification=array('messege'=>$notification,'alert-type'=>'success');

        return redirect()->back()->with($notification);
    }

    public function destroy($id)
    {
        $segments=Segments::find($id);
        if(!empty($segments->question_audio) && !empty($segments->answer_audio) ){
            // print_r($segments->answer_audio);die;

            if(File::exists(public_path().'/'.$segments->answer_audio)) unlink(public_path().'/'.$segments->answer_audio);
            if(File::exists(public_path().'/'.$segments->question_audio)) unlink(public_path().'/'.$segments->question_audio);
        }
        $segments->delete();
        $notify_lang=NotificationText::all();
        $notification=$notify_lang->where('lang_key','delete')->first()->custom_text;
        $notification=array('messege'=>$notification,'alert-type'=>'success');

        return redirect()->back()->with($notification);
    }


    public function changeStatus($id){
        $segments=Segments::find($id);
        if($segments->status==1){
            $segments->status=0;
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','inactive')->first()->custom_text;
            $message=$notification;
        }else{
            $segments->status=1;
            $notify_lang=NotificationText::all();
            $notification=$notify_lang->where('lang_key','active')->first()->custom_text;
            $message=$notification;
        }
        $segments->save();
        return response()->json($message);

    }

}
