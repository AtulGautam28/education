@extends('layouts.admin.layout')
@section('title')
<title>Tutorial</title>
@endsection
@section('admin-content')
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800"><a href="{{ route('admin.language.setting') }}" class="btn btn-primary"><i class="fas fa-list" aria-hidden="true"></i> All Language  </a></h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Language  Form</h6>
        </div>
        <div class="card-body">
            <form action="{{ route('admin.language-store') }}" method="post"  enctype="multipart/form-data">
                @csrf

                <div class="form-group">
                    <label for="name">Title</label>
                    <input type="text" class="form-control" name="title" id="title" value="{{ old('title') }}">
                </div>               
                <div class="form-group">
                    <label for="language_code">Language  Code</label>
                    <input type="text" class="form-control" name="language_code" id="language_code" value="{{ old('language_code') }}">
                </div>               
                <div class="form-group">
                    <label for="seo_title">Seo Title </label>
                    <input type="text" class="form-control" name="seo_title" id="seo_title" value="{{ old('seo_title') }}">
                </div>               
               
                <div class="form-group">
                    <label for="status">{{ $websiteLang->where('lang_key','status')->first()->custom_text }}</label>
                    <select name="status" id="status" class="form-control">
                        <option value="1">{{ $websiteLang->where('lang_key','active')->first()->custom_text }}</option>
                        <option value="0">Inactive</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-success">{{ $websiteLang->where('lang_key','save')->first()->custom_text }}</button>
            </form>
        </div>
    </div>
@endsection
