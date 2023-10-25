@extends('layouts.admin.layout')
@section('title')
<title>{{ $websiteLang->where('lang_key','blog_comment')->first()->custom_text }}</title>
@endsection
@section('admin-content')
    <!-- DataTales Example -->
    <div class="row">
        <div class="col-md-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Push Notification Serverkey</h6>
                </div>
                <div class="card-body">
                    <form action="{{ route('admin.update.serverkey.setting') }}" method="POST">
                        @csrf
                        <div class="form-group">
                            <label for="">Serverkey</label>
                            <textarea class="form-control" name="push_notification_serverkey" id="" cols="30" rows="4">{{ $setting->push_notification_serverkey }}</textarea>                           
                        </div>
                        @if ($setting->comment_type==0)
                            <div class="form-group" id="hiddenFacebookId">
                                <label for="facebook_comment_script">{{ $websiteLang->where('lang_key','fb_app_id')->first()->custom_text }}</label>
                                <input type="text" class="form-control" name="facebook_comment_script" id="facebook_comment_script" value="{{ $setting->facebook_comment_script }}">
                            </div>
                        @endif

                        @if ($setting->comment_type!=0)
                        <div class="form-group d-none" id="hiddenFacebookId">
                            <label for="facebook_comment_script">{{ $websiteLang->where('lang_key','fb_app_id')->first()->custom_text }}</label>
                            <input type="text" class="form-control" name="facebook_comment_script" id="facebook_comment_script" value="{{ $setting->facebook_comment_script }}">
                        </div>
                        @endif

                        <button type="submit" class="btn btn-success">{{ $websiteLang->where('lang_key','update')->first()->custom_text }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>


<script>
    (function($) {
    "use strict";
    $(document).ready(function () {
        $("#comment_type").on("change",function(e){
            var id=$(this).val()
            if(id==0){
                $("#hiddenFacebookId").removeClass('d-none');
            }else{
                $("#hiddenFacebookId").addClass('d-none');
            }
        })

    });

    })(jQuery);
</script>

@endsection
