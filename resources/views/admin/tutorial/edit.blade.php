@extends('layouts.admin.layout')
@section('title')
<title>Tutorial</title>
@endsection
@section('admin-content')
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800"><a href="{{ route('admin.toturial') }}" class="btn btn-primary"><i class="fas fa-list" aria-hidden="true"></i> All Tutorial </a></h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Tutorial Form</h6>
        </div>
        <div class="card-body">
         
            <form action="{{ route('admin.toturial-update',$tutorial->id) }}" method="post"  enctype="multipart/form-data">
                @csrf

                <div class="form-group">
                    <label for="name">Title</label>
                    <input type="text" class="form-control" name="title" id="title" value="{{ $tutorial->title }}">
                </div>

                <div class="form-group">
                    <label for="name">Video Tutorial</label> 
                    <br>
                    <span><video width="320" height="240" controls>
                            <source src="{{ url($tutorial->video) }}" type="video/mp4">
                            </video></span>                  
                    <input type="file" class="form-control"  id="video" name="video"  accept="video/mp4, video/mov">
                </div>
                <div class="form-group">
                    <label for="name">Description</label>
                    <textarea name="description" id="" class="form-control"  cols="30"   rows="5">{{$tutorial->discription}}</textarea>                   
                </div>
                <div class="form-group">
                    <label for="status">{{ $websiteLang->where('lang_key','status')->first()->custom_text }}</label>
                    <select name="status" id="status" class="form-control">
                        <option {{ $tutorial->status == 1 ? 'selected' : '' }} value="1">{{ $websiteLang->where('lang_key', 'active')->first()->custom_text }}</option>
                        <option {{ $tutorial->status == 0 ? 'selected' : '' }} value="0">Inactive</option>
                    </select>

                </div>

                <button type="submit" class="btn btn-success">{{ $websiteLang->where('lang_key','save')->first()->custom_text }}</button>
            </form>
        </div>
    </div>
@endsection
