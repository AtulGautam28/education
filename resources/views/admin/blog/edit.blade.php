@extends('layouts.admin.layout')
@section('title')
<title>{{ $websiteLang->where('lang_key','blog')->first()->custom_text }}</title>
@endsection
@section('admin-content')
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800"><a href="{{ route('admin.blog.index') }}" class="btn btn-primary"><i class="fas fa-list" aria-hidden="true"></i> {{ $websiteLang->where('lang_key','all_blog')->first()->custom_text }} </a></h1>
    <!-- DataTales Example -->
    <div class="row">
        <div class="col-md-10">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">{{ $websiteLang->where('lang_key','blog_form')->first()->custom_text }}</h6>
                </div>
                <div class="card-body">

                   <form action="{{ route('admin.blog.update',$blog->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('patch')
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="title">{{ $websiteLang->where('lang_key','title')->first()->custom_text }}</label>
                                <input type="text" name="title" class="form-control" id="title" value="{{ $blog->title }}">
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="slug">{{ $websiteLang->where('lang_key','slug')->first()->custom_text }}</label>
                                <input type="text" name="slug" class="form-control" id="slug" value="{{ $blog->slug }}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="category">{{ $websiteLang->where('lang_key','cat')->first()->custom_text }}</label>
                                <select name="category" id="category" class="form-control select2">
                                    <option value="">{{ $websiteLang->where('lang_key','select_cat')->first()->custom_text }}</option>
                                    @foreach ($categories as $item)
                                    <option {{ $item->id==$blog->blog_category_id ? 'selected':'' }} value="{{ $item->id }}">{{ $item->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="seo_title">{{ $websiteLang->where('lang_key','seo_title')->first()->custom_text }}</label>
                                <input type="text" name="seo_title" class="form-control" id="seo_title" value="{{ $blog->seo_title }}">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="">Existing Audio</label>
                                <div>
                                <audio controls>
                                    <source src="{{ $blog->image ? url($blog->image) : "" }}" type="audio/mpeg">
                                    <input name="old_image" value="{{ $blog->image }}" type="hidden"/>
                                </audio></div>
                                {{-- <div><img src="{{ $blog->image ? url($blog->image) : '' }}" alt="old blog image" class="w_200"></div> --}}
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="image">Audio</label>
                                <div><input type="file" name="image" id="image"></div>
                            </div>
                        </div>

                    </div>
                    {{--
                    <div class="form-group">
                        <label for="short_description">{{ $websiteLang->where('lang_key','short_des')->first()->custom_text }}</label>
                        <textarea class="form-control" cols="30" rows="5" id="short_description" name="short_description">{{ $blog->short_description }}</textarea>
                    </div>

                    <div class="form-group">
                        <label for="description">{{ $websiteLang->where('lang_key','des')->first()->custom_text }}</label>
                        <textarea class="summernote" id="summernote" name="description">{{ $blog->description }}</textarea>
                    </div> --}}
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="status">{{ $websiteLang->where('lang_key','status')->first()->custom_text }}</label>
                                <select name="status" id="status" class="form-control">
                                    <option {{ $blog->status==1 ? 'selected' : ''}} value="1">{{ $websiteLang->where('lang_key','active')->first()->custom_text }}</option>
                                    <option {{ $blog->status==0 ? 'selected' : ''}} value="0">{{ $websiteLang->where('lang_key','inactive')->first()->custom_text }}</option>
                                </select>
                            </div>
                        </div>
                        {{-- <div class="col-md-6">
                            <div class="form-group">
                                <label for="show_homepage">{{ $websiteLang->where('lang_key','show_homepage')->first()->custom_text }}</label>
                                <select name="show_homepage" id="show_homepage" class="form-control">
                                    <option {{ $blog->show_homepage==0 ? 'selected' : ''}} value="0">{{ $websiteLang->where('lang_key','no')->first()->custom_text }}</option>
                                    <option {{ $blog->show_homepage==1 ? 'selected' : ''}} value="1">{{ $websiteLang->where('lang_key','yes')->first()->custom_text }}</option>
                                </select>
                            </div>
                        </div> --}}
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="seo_description">{{ $websiteLang->where('lang_key','seo_des')->first()->custom_text }}</label>
                                <textarea name="seo_description" id="seo_description" cols="30" rows="3" class="form-control" >{{ $blog->seo_description }}</textarea>
                            </div>
                        </div>
                    </div>

                    


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
            $("#title").on("focusout",function(e){
                $("#slug").val(convertToSlug($(this).val()));
            })

        });

        })(jQuery);

        function convertToSlug(Text)
            {
                return Text
                    .toLowerCase()
                    .replace(/[^\w ]+/g,'')
                    .replace(/ +/g,'-');
            }
    </script>


@endsection
