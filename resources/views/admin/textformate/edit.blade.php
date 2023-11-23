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
         
            <form action="{{ route('admin.textformate-update',$textformate->id) }}" method="post"  enctype="multipart/form-data">
                @csrf

                <div class="form-group">
                    <label for="name">Title</label>
                    <input type="text" class="form-control" name="title" id="title" value="{{ $textformate->title }}">
                </div>

                <div class="form-group">
                    <label for="name">Image</label> 
                    <br>
                    <span> <img src="{{ url($textformate->image) }}"  alt=""></td>        </span>                  
                    <input type="file" class="form-control"  id="image" name="image"  >
                </div>
                <div class="form-group">
                    <label for="name">Description</label>
                    <textarea name="description" id="summernote" class=" summernote form-control"  cols="30"   rows="5">{{$textformate->discription}}</textarea>                   
                </div>
                <div class="form-group">
                    <label for="status">{{ $websiteLang->where('lang_key','status')->first()->custom_text }}</label>
                    <select name="status" id="status" class="form-control">
                        <option {{ $textformate->status == 1 ? 'selected' : '' }} value="1">{{ $websiteLang->where('lang_key', 'active')->first()->custom_text }}</option>
                        <option {{ $textformate->status == 0 ? 'selected' : '' }} value="0">Inactive</option>
                    </select>

                </div>

                <button type="submit" class="btn btn-success">{{ $websiteLang->where('lang_key','save')->first()->custom_text }}</button>
            </form>
        </div>
    </div>
@endsection
