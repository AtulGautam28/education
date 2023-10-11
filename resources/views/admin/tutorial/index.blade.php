@extends('layouts.admin.layout')
@section('title')
<title>Tutorial</title>
@endsection
@section('admin-content')
    <!-- DataTales Example -->
    <div class="container-fluid">
        <h6 class="h3 mb-2 text-gray-800"><a href="{{ route('admin.toturial-create') }}" class="btn btn-primary"> New Tutorial </a></h6>
        <div class="card shadow mb-4">
            <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Tutorial Table</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

                        <thead>
                            <tr>
                                <th width="5%">{{ $websiteLang->where('lang_key','serial')->first()->custom_text }}</th>
                                <th width="10%">Title</th>
                                <th width="15%">Video Tutorial</th>                           
                                <th width="15%">Discription</th>                           
                                <th width="10%">{{ $websiteLang->where('lang_key','action')->first()->custom_textt }}</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($orders as $index => $order)
                            <tr>
                                <td>{{ ++$index }}</td>
                                <td>{{ $order->title }}</td>
                                <td> <video width="220" height="100" controls>
                                <source src="{{ url($order->video) }}" type="video/mp4">
                                </video></td>                           
                                <td>{{ $order->discription }}</td>                          
                                <td>
                                    <a onclick="return confirm('{{ $confirmNotify }}')" href="{{ route('admin.tutorial-delete',$order->id) }}" class="btn btn-danger btn-sm"><i class="fas fa-trash" aria-hidden="true"></i></a>
                                    <a href="{{ route('admin.tutorial-edit',$order->id) }}" class="btn btn-info btn-sm"><i class="fas fa-edit" aria-hidden="true"></i></a>
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

