<?php

namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use App\ManageText;
use App\NotificationText;
use Image;
use File;

use Illuminate\Http\Request;
use App\Dashboardslider;

class DashboardsliderController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }


    public function index()
    {
        $dashboardslider=Dashboardslider::all();
        $websiteLang=ManageText::all();
        $confirmNotify=$websiteLang->where('lang_key','are_you_sure')->first()->custom_text;
        return view('admin.dashboardslider.index',compact('dashboardslider','websiteLang','confirmNotify'));
    }


    public function store(Request $request)
    {
        

        $this->validate($request,[
            'title'=>'required',
            'image'=>'required',
        ]);
        $dashboardslider=new Dashboardslider();
        if($request->file('image')){
            $old_about_img=$dashboardslider->image;

            $about_imge=$request->image;
            $extention=$about_imge->getClientOriginalExtension();
            $about_imge= 'about-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $about_imge='uploads/website-images/'.$about_imge;

            Image::make($request->image)
                ->save(public_path().'/'.$about_imge);

                $dashboardslider->image=$about_imge;

                // if(File::exists(public_path().'/'.$old_about_img))unlink(public_path().'/'.$old_about_img);
        }
        $dashboardslider->title=$request->title;
        $dashboardslider->status=$request->status;
        $dashboardslider->image=$dashboardslider->image;
        $dashboardslider->save();

        $notify_lang=NotificationText::all();
        $notification=$notify_lang->where('lang_key','create')->first()->custom_text;
        $notification=array('messege'=>$notification,'alert-type'=>'success');

        return redirect()->back()->with($notification);
    }

    public function update(Request $request, $id)
    {
        $this->validate($request,[
            'title'=>'required',
            'image'=>'required',
        ]);
        
        $dashboardslider=Dashboardslider::find($id);

        $dashboardslider->title=$request->title;
        $dashboardslider->status=$request->status;
        
        if($request->file('image')){
            $old_about_img=$dashboardslider->image;

            $about_imge=$request->image;
            $extention=$about_imge->getClientOriginalExtension();
            $about_imge= 'about-'.date('Y-m-d-h-i-s-').rand(999,9999).'.'.$extention;
            $about_imge='uploads/website-images/'.$about_imge;

            Image::make($request->image)
                ->save(public_path().'/'.$about_imge);

                $dashboardslider->image=$about_imge;

                if(File::exists(public_path().'/'.$old_about_img))unlink(public_path().'/'.$old_about_img);
        }

        $dashboardslider->save();
                        
        $notify_lang=NotificationText::all();
        $notification=$notify_lang->where('lang_key','update')->first()->custom_text;
        $notification=array('messege'=>$notification,'alert-type'=>'success');

        return redirect()->back()->with($notification);
    }

    public function destroy($id)
    {
        $dashboardslider=Dashboardslider::find($id);
        if(!empty($dashboardslider->image) && !empty($dashboardslider->image) ){
            if(File::exists(public_path().'/'.$dashboardslider->image)) unlink(public_path().'/'.$dashboardslider->image);
        }
        $dashboardslider->delete();
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
