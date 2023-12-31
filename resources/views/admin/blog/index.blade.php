@extends('layouts.admin.layout')
@section('title')
<title>{{ $websiteLang->where('lang_key','blog')->first()->custom_text }}</title>
@endsection
@section('admin-content')
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800"><a href="{{ route('admin.blog.create') }}" class="btn btn-primary"><i class="fas fa-plus" aria-hidden="true"></i> {{ $websiteLang->where('lang_key','create')->first()->custom_text }}
    </a></h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">{{ $websiteLang->where('lang_key','blog_table')->first()->custom_text }}
            </h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th width="5%">{{ $websiteLang->where('lang_key','serial')->first()->custom_text }}
                            </th>
                            <th width="30%">{{ $websiteLang->where('lang_key','title')->first()->custom_text }}
                            </th>
                            <th width="40%">Meaning</th>
                            <th width="15%">{{ $websiteLang->where('lang_key','cat')->first()->custom_text }}
                            </th>
                            <th width="10%">Audio
                            </th>
                            <th width="5%">{{ $websiteLang->where('lang_key','status')->first()->custom_text }}
                            </th>
                            <th width="15%">{{ $websiteLang->where('lang_key','action')->first()->custom_text }}
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($blogs as $index => $item)
                        <tr>
                            <td>{{ ++$index }}</td>
                            <td>{{ $item->title }}</td>
                            <td>{{ $item->seo_title }} ({{ $item->seo_description }})</td>
                            <td>{{ $item->category->name }}</td>
                            <td> 
                                <audio controls>
                                    <source src="{{ $item->image ? url($item->image) : "" }}" type="audio/mpeg">
                                </audio>
                            </td>
                            <td>
                                @if ($item->status==1)
                                <a href="" onclick="blogStatus({{ $item->id }})"><input type="checkbox" checked data-toggle="toggle"
                                     data-on="{{ $websiteLang->where('lang_key','active')->first()->custom_text }}" data-off="{{ $websiteLang->where('lang_key','inactive')->first()->custom_text }}" data-onstyle="success" data-offstyle="danger"></a>
                                @else
                                    <a href="" onclick="blogStatus({{ $item->id }})"><input type="checkbox" data-toggle="toggle" data-on="{{ $websiteLang->where('lang_key','active')->first()->custom_text }}" data-off="{{ $websiteLang->where('lang_key','inactive')->first()->custom_text }}" data-onstyle="success" data-offstyle="danger"></a>

                                @endif
                            </td>
                            <td>
                                <a href="{{ route('admin.blog.edit',$item->id) }}" class="btn btn-primary btn-sm"><i class="fas fa-edit    "></i></a>
                                {{-- <a target="_blank" href="{{ url('blog-details/'.$item->slug) }}" class="btn btn-success btn-sm"><i class="fas fa-eye"></i></a> --}}
                                <a data-toggle="modal" data-target="#deleteModal" href="javascript:;" onclick="deleteData({{ $item->id }})" class="btn btn-danger btn-sm"><i class="fas fa-trash    "></i></a>



                            </td>
                        </tr>
                        @endforeach

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        function deleteData(id){
            $("#deleteForm").attr("action",'{{ url("admin/blog/") }}'+"/"+id)
        }

        function blogStatus(id){
            // project demo mode check
            var isDemo="{{ env('PROJECT_MODE') }}"
            var demoNotify="{{ env('NOTIFY_TEXT') }}"
            if(isDemo==0){
                toastr.error(demoNotify);
                return;
            }
            // end

            $.ajax({
                type:"get",
                url:"{{url('/admin/blog-status/')}}"+"/"+id,
                success:function(response){
                   toastr.success(response)
                },
                error:function(err){
                    console.log(err);

                }
            })
        }
    </script>
@endsection
