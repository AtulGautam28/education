@extends('layouts.admin.layout')
@section('title')
<title>{{ $websiteLang->where('lang_key','practice')->first()->custom_text }}</title>
@endsection
@section('admin-content')
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800"><a href="#" data-toggle="modal" data-target="#addTestimonial" class="btn btn-success"><i class="fas fa-plus" aria-hidden="true"></i> {{ $websiteLang->where('lang_key','create')->first()->custom_text }}</a></h1>

    <div class="card shadow mb-4">
        <div class="card-body">
            <h6>{{ $websiteLang->where('lang_key','practice_table')->first()->custom_text }}</h6>
            <hr>
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th width="5%">{{ $websiteLang->where('lang_key','serial')->first()->custom_text }}</th>
                            <th width="25%">{{ $websiteLang->where('lang_key','title')->first()->custom_text }}</th>
                            <th width="50%">{{ $websiteLang->where('lang_key','des')->first()->custom_text }}</th>
                            <th width="50%">{{ $websiteLang->where('lang_key','practice_instruction')->first()->custom_text }}</th>
                            <th width="10%">{{ $websiteLang->where('lang_key','status')->first()->custom_text }}</th>
                            <th width="10%">{{ $websiteLang->where('lang_key','action')->first()->custom_text }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($practices as $index => $item)
                        <tr>
                            <td>{{ ++$index }}</td>
                            <td>{{ $item->title }}</td>
                            <td>{{ $item->description }}</td>
                            <td>{{ $item->instructions }}</td>
                            <td>
                                @if ($item->status==1)
                                    <a href="" onclick="testimonialStatus({{ $item->id }})"><input type="checkbox" checked data-toggle="toggle" data-on="{{ $websiteLang->where('lang_key','active')->first()->custom_text }}" data-off="{{ $websiteLang->where('lang_key','inactive')->first()->custom_text }}" data-onstyle="success" data-offstyle="danger"></a>
                                @else
                                    <a href="" onclick="testimonialStatus({{ $item->id }})"><input type="checkbox" data-toggle="toggle" data-on="{{ $websiteLang->where('lang_key','active')->first()->custom_text }}" data-off="{{ $websiteLang->where('lang_key','inactive')->first()->custom_text }}" data-onstyle="success" data-offstyle="danger"></a>

                                @endif
                            </td>
                            <td>
                                <a href="#" data-toggle="modal" data-target="#updatePractice-{{ $item->id }}" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></a>
                                <a href="{{ route('admin.practice.delete',$item->id) }}" onclick="return confirm('{{ $confirmNotify }}')"class="btn btn-danger btn-sm"><i class="fas fa-trash    "></i></a>


                            </td>
                        </tr>
                        @endforeach

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- create new testimonial Modal -->
    <div class="modal fade" id="addTestimonial" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                    <div class="modal-header">
                            <h5 class="modal-title">{{ $websiteLang->where('lang_key','practice_form')->first()->custom_text }}</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                        </div>
                <div class="modal-body">
                    <div class="container-fluid">

                    <form action="{{ route('admin.store.practice') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="question">{{ $websiteLang->where('lang_key','title')->first()->custom_text }}</label>
                                    <input type="text" class="form-control" name="title" id="question" value="{{ old('title') }}">
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="answer">{{ $websiteLang->where('lang_key','des')->first()->custom_text }}</label>
                                    <textarea class="form-control" id="answer" name="description" rows="5" cols="30">{{ old('description') }}</textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="answer">{{ $websiteLang->where('lang_key','practice_instruction')->first()->custom_text }}</label>
                                    <textarea class="form-control" id="answer" name="instructions" rows="5" cols="30">{{ old('instructions') }}</textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="status">{{ $websiteLang->where('lang_key','status')->first()->custom_text }}</label>
                                    <select name="status" id="status" class="form-control">
                                        <option value="1">{{ $websiteLang->where('lang_key','active')->first()->custom_text }}</option>
                                        <option value="0">{{ $websiteLang->where('lang_key','inactive')->first()->custom_text }}</option>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <button type="button" class="btn btn-danger" data-dismiss="modal">{{ $websiteLang->where('lang_key','close')->first()->custom_text }}</button>
                        <button type="submit" class="btn btn-success">{{ $websiteLang->where('lang_key','save')->first()->custom_text }}</button>
                    </form>
                    </div>
                </div>

            </div>
        </div>
    </div>

     <!-- update testimonial Modal -->
     @foreach ($practices as $item)
    <div class="modal fade" id="updatePractice-{{ $item->id }}" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                    <div class="modal-header">
                            <h5 class="modal-title">{{ $websiteLang->where('lang_key','practice_form')->first()->custom_text }}</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                        </div>
                <div class="modal-body">
                    <div class="container-fluid">

                        <form action="{{ route('admin.practice.update',$item->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="question">{{ $websiteLang->where('lang_key','title')->first()->custom_text }}</label>
                                        <input type="text" class="form-control" name="title" id="question" value="{{ $item->title }}">
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="answer">{{ $websiteLang->where('lang_key','des')->first()->custom_text }}</label>
                                        <textarea class="form-control" id="answer" name="description" rows="5" cols="30">{{ $item->description }}</textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="answer">{{ $websiteLang->where('lang_key','practice_instruction')->first()->custom_text }}</label>
                                        <textarea class="form-control" id="answer" name="instructions" rows="5" cols="30">{{ $item->instructions }}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="status">{{ $websiteLang->where('lang_key','status')->first()->custom_text }}</label>
                                        <select name="status" id="status" class="form-control">
                                            <option {{ $item->status==1 ? 'selected' : '' }} value="1">{{ $websiteLang->where('lang_key','active')->first()->custom_text }}</option>
                                            <option {{ $item->status==0 ? 'selected' : '' }} value="0">{{ $websiteLang->where('lang_key','inactive')->first()->custom_text }}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>


                            <button type="button" class="btn btn-danger" data-dismiss="modal">{{ $websiteLang->where('lang_key','close')->first()->custom_text }}</button>
                            <button type="submit" class="btn btn-success">{{ $websiteLang->where('lang_key','update')->first()->custom_text }}</button>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>

    @endforeach



    <script>
        function deleteData(id){
            $("#deleteForm").attr("action",'{{ url("/admin/practice/") }}'+"/"+id)
        }

        function testimonialStatus(id){
            // project demo mode check
            var isDemo="{{ env('PROJECT_MODE') }}"
            var demoNotify="{{ env('NOTIFY_TEXT') }}"
            if(isDemo==0){
                toastr.error(demoNotify);
                return;
            }
            $.ajax({
                type:"get",
                url:"{{url('/admin/faq-status/')}}"+"/"+id,
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
