<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Segments;
use Illuminate\Http\Request;
use App\BannerImage;
use App\ManageText;
use App\Practice;
use App\Subject;
use App\NotificationText;
use Image;
use File;

class PracticeController extends Controller
{
    
    public function __construct()
    {
        $this->middleware('auth:admin');
    }


    public function index()
    {
        $practices = Practice::select('practices.*', 'subjects.title as subject_name')
        ->join('subjects', 'subjects.id', '=', 'practices.subject_id')
        ->get();
    
        // $practices=Practice::all();
        $subjects=Subject::all();
        $websiteLang=ManageText::all();
        $confirmNotify=$websiteLang->where('lang_key','are_you_sure')->first()->custom_text;
        return view('admin.practice.index',compact('practices','subjects', 'websiteLang','confirmNotify'));
    }


    public function store(Request $request)
    {
        $this->validate($request,[
            'title'=>'required',
            'description'=>'required',
            'instructions'=>'required',
            'gender'=>'required',
            'subject_id'=>'required',
        ]);
        $practice=new Practice();
        $practice->title=$request->title;
        $practice->is_lastminutes=$request->is_lastminutes;
        $practice->description=$request->description;
        $practice->gender=$request->gender;
        $practice->instructions=$request->instructions;
        $practice->subject_id=$request->subject_id;
        $practice->status=$request->status;
        $practice->save();

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
            'instructions'=>'required',
            'gender'=>'required',
            'subject_id'=>'required',
        ]);
        $practice=Practice::find($id);

        $practice->title=$request->title;
        $practice->description=$request->description;
        $practice->instructions=$request->instructions;
        $practice->gender=$request->gender;
        $practice->subject_id=$request->subject_id;
        $practice->is_lastminutes=$request->is_lastminutes;
        $practice->status=$request->status;
        $practice->save();

        $notify_lang=NotificationText::all();
        $notification=$notify_lang->where('lang_key','update')->first()->custom_text;
        $notification=array('messege'=>$notification,'alert-type'=>'success');

        return redirect()->back()->with($notification);
    }

    public function destroy($id)
    {
        $segments = Segments::where('practice_id',$id)->get();
        foreach ($segments as $value) {
            if(File::exists(public_path().'/'.$value->question_audio)) unlink(public_path().'/'.$value->question_audio);
            if(File::exists(public_path().'/'.$value->answer_audio)) unlink(public_path().'/'.$value->answer_audio);
        }
        Segments::where('practice_id',$id)->delete();
        $practice=Practice::find($id);
        $practice->delete();

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
