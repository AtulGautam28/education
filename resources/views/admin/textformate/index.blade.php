@extends('layouts.admin.layout')
@section('title')
<title>Tutorial</title>
@endsection
@section('admin-content')
<style>
.block-ellipsis {
    display: block;
    display: -webkit-box;
    max-width: 100%;
    height: 100px;
    margin: 0 auto;
    font-size: 14px;
    line-height: 1;
    -webkit-line-clamp: 8;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
}
</style>
    <!-- DataTales Example -->
    <div class="container-fluid">
        <h6 class="h3 mb-2 text-gray-800"><a href="{{ route('admin.textformate-create') }}" class="btn btn-primary"> New Test Formate </a></h6>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Test Formate Table</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

                        <thead>
                            <tr>
                                <th width="5%">{{ $websiteLang->where('lang_key','serial')->first()->custom_text }}</th>
                                <th width="10%">Title</th>
                                <th width="15%">Image </th>                           
                                <th width="15%">Discription</th>                           
                                <th width="10%">{{ $websiteLang->where('lang_key','action')->first()->custom_textt }}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($textformate as $index => $textformates)
                            <tr>
                                <td>{{ ++$index }}</td>
                                <td>{{ $textformates->title }}</td>
                                <td> 
                                    <img src="{{ url($textformates->image) }}"  alt=""></td>                           
                                    <td class="block-ellipsis">{!! $textformates->discription !!}</td>                       
                                <td>
                                    <a onclick="return confirm('{{ $confirmNotify }}')" href="{{ route('admin.textformate-delete',$textformates->id) }}" class="btn btn-danger btn-sm"><i class="fas fa-trash" aria-hidden="true"></i></a>
                                    <a href="{{ route('admin.textformate-edit',$textformates->id) }}" class="btn btn-info btn-sm"><i class="fas fa-edit" aria-hidden="true"></i></a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>


                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

