@extends('layouts.admin.layout')
@section('title')
<title>Tutorial</title>
@endsection
@section('admin-content')
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800"><a href="{{ route('admin.textformate-create') }}" class="btn btn-primary"><i class="fas fa-list" aria-hidden="true"></i> All Test Formate </a></h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Test Form</h6>
        </div>
        <div class="card-body">
         
            <form action="{{ route('admin.language-update',$language->id) }}" method="post"  enctype="multipart/form-data">
                @csrf

                <div class="form-group">
                    <label for="name">Title</label>
                    <input type="text" class="form-control" name="title" id="title" value="{{ $language->title }}">
                </div>
                <div class="form-group">
                    <label for="language_code">Language  Code</label>
                    <input type="text" class="form-control" name="language_code" id="language_code" value="{{ $language->language_code }}">
                </div>               
                <div class="form-group">
                    <label for="seo_title">Seo Title </label>
                    <input type="text" class="form-control" name="seo_title" id="seo_title" value="{{ $language->seo_title }}">
                </div>  

                <div class="form-group">
                    <label for="status">{{ $websiteLang->where('lang_key','status')->first()->custom_text }}</label>
                    <select name="status" id="status" class="form-control">
                        <option {{ $language->status == 1 ? 'selected' : '' }} value="1">{{ $websiteLang->where('lang_key', 'active')->first()->custom_text }}</option>
                        <option {{ $language->status == 0 ? 'selected' : '' }} value="0">Inactive</option>
                    </select>

                </div>

                <button type="submit" class="btn btn-success">{{ $websiteLang->where('lang_key','save')->first()->custom_text }}</button>
            </form>
        </div>
    </div>
@endsection
