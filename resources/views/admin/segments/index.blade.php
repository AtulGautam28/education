@extends('layouts.admin.layout')
@section('title')
<title>{{ $websiteLang->where('lang_key','practice')->first()->custom_text }}</title>
<meta name="csrf-token" content="{{ csrf_token() }}" />
@endsection
@section('admin-content')
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800"><a href="#" data-toggle="modal" data-target="#addTestimonial"
        class="btn btn-success"><i class="fas fa-plus" aria-hidden="true"></i> {{
        $websiteLang->where('lang_key','create')->first()->custom_text }}</a></h1>

<div class="card shadow mb-4">
    <div class="card-body">
        <div class="row" >
            <div class="col-lg-10 col-md-8 col-sm-12">
                <h6>Segments Table</h6>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-12">
                <div class="dropdown">
                    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Practice Dialogues
                        <span class="caret"></span></button>
                    <ul class="dropdown-menu">
                        @foreach ($practices as $practice)
                        <li><a href="{{ route('admin.practice.filter',$practice->id) }}">{{$practice->title}}</a></li>
                        @endforeach
                        <li><a href="{{ route('admin.segments') }}">See all</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <hr>
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th width="5%">{{ $websiteLang->where('lang_key','serial')->first()->custom_text }}</th>
                        <th width="25%">{{ $websiteLang->where('lang_key','qus')->first()->custom_text }}</th>
                        <th width="50%">{{ $websiteLang->where('lang_key','ans')->first()->custom_text }}</th>
                        {{-- <th width="50%">Question Audio</th>
                        <th width="50%">Answer Audio</th> --}}
                        <th width="50%">Practice Dialogues</th>
                        <th width="10%">{{ $websiteLang->where('lang_key','status')->first()->custom_text }}</th>
                        <th width="10%">{{ $websiteLang->where('lang_key','action')->first()->custom_text }}</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($segments as $index => $item)
                    <tr>
                        <td>{{ ++$index }}</td>
                        <td>{{ $item->question }}</td>
                        <td>{{ $item->answer }}</td>
                        {{-- <td><audio controls>
                                <source src="{{ $item->question_audio ? url($item->question_audio) : "" }}"
                                    type="audio/mpeg">
                            </audio>
                        </td>
                        <td><audio controls>
                                <source src="{{ $item->answer_audio ? url($item->answer_audio) : "" }}"
                                    type="audio/mpeg">
                            </audio>
                        </td> --}}
                        <td>{{ $item->practice->title }}</td>
                        <td>
                            @if ($item->status==1)
                            <a href="" onclick="testimonialStatus({{ $item->id }})"><input type="checkbox" checked
                                    data-toggle="toggle"
                                    data-on="{{ $websiteLang->where('lang_key','active')->first()->custom_text }}"
                                    data-off="{{ $websiteLang->where('lang_key','inactive')->first()->custom_text }}"
                                    data-onstyle="success" data-offstyle="danger"></a>
                            @else
                            <a href="" onclick="testimonialStatus({{ $item->id }})"><input type="checkbox"
                                    data-toggle="toggle"
                                    data-on="{{ $websiteLang->where('lang_key','active')->first()->custom_text }}"
                                    data-off="{{ $websiteLang->where('lang_key','inactive')->first()->custom_text }}"
                                    data-onstyle="success" data-offstyle="danger"></a>

                            @endif
                        </td>
                        <td>
                            <a href="#" data-toggle="modal" data-target="#updateSegments-{{ $item->id }}"
                                class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></a>
                            <a href="{{ route('admin.segments.delete',$item->id) }}"
                                onclick="return confirm('{{ $confirmNotify }}')" class="btn btn-danger btn-sm"><i
                                    class="fas fa-trash    "></i></a>


                        </td>
                    </tr>
                    @endforeach

                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- create new testimonial Modal -->
<div class="modal fade" id="addTestimonial" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Segment Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">

                    <form action="{{ route('admin.store.segments') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Practice Dialogues</label>
                                    <select name="practice_id" class="form-control" id="">
                                        <option value="">Select Practice</option>
                                        @foreach ($practices as $item)
                                        <option {{ old('country')==$item->id ? 'selected' : '' }} value="{{ $item->id
                                            }}">{{ $item->title }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="question">{{ $websiteLang->where('lang_key','qus')->first()->custom_text
                                        }}</label>
                                    <input type="text" class="form-control" name="question" id="question"
                                        value="{{ old('question') }}">
                                </div>
                            </div>
                            {{-- <div class="col-md-12">
                                <div class="form-group">
                                    <label for="image">Question Audio</label>
                                    <div><input type="file" name="question_audio" id="image"></div>
                                </div>
                            </div> --}}

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="answer">{{ $websiteLang->where('lang_key','ans')->first()->custom_text
                                        }}</label>
                                    <textarea class="form-control" id="answer" name="answer" rows="5"
                                        cols="30">{{ old('answer') }}</textarea>
                                </div>
                            </div>
                            {{-- <div class="col-md-12">
                                <div class="form-group">
                                    <label for="image">Answer Audio</label>
                                    <div><input type="file" name="answer_audio" id="image"></div>
                                </div>
                            </div> --}}
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="status">Gender</label>
                                    <select name="gender" id="status" class="form-control">
                                        <option >Select Gender</option>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="status">{{
                                        $websiteLang->where('lang_key','status')->first()->custom_text }}</label>
                                    <select name="status" id="status" class="form-control">
                                        <option value="1">{{
                                            $websiteLang->where('lang_key','active')->first()->custom_text }}</option>
                                        <option value="0">{{
                                            $websiteLang->where('lang_key','inactive')->first()->custom_text }}</option>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <button type="button" class="btn btn-danger" data-dismiss="modal">{{
                            $websiteLang->where('lang_key','close')->first()->custom_text }}</button>
                        <button type="submit" class="btn btn-success">{{
                            $websiteLang->where('lang_key','save')->first()->custom_text }}</button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- update testimonial Modal -->
@foreach ($segments as $item)
<div class="modal fade" id="updateSegments-{{ $item->id }}" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{{ $websiteLang->where('lang_key','state_form')->first()->custom_text }}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">

                    <form action="{{ route('admin.segments.update',$item->id) }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Practice Dialogues</label>
                                    <select name="practice_id" class="form-control" id="custom-select2">
                                        <option value="">Select Practice</option>
                                        @foreach ($practices as $practice)
                                        <option {{ $item->practice_id==$practice->id ? 'selected' : '' }} value="{{
                                            $practice->id }}">{{ $practice->title }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="question">{{ $websiteLang->where('lang_key','qus')->first()->custom_text
                                        }}</label>
                                    <input type="text" class="form-control" name="question" id="question"
                                        value="{{ $item->question }}">
                                </div>
                            </div>
                            {{-- <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">Existing Question Audio</label>
                                    <div>
                                        <audio controls>
                                            <source src="{{ $item->question_audio ? url($item->question_audio) : "" }}"
                                                type="audio/mpeg">
                                            <input type="hidden" name="old_question_audio"
                                                value="{{$item->question_audio}}">
                                        </audio>
                                    </div>
                                </div>
                            </div> --}}
                            {{-- <div class="col-md-6">
                                <div class="form-group">
                                    <label for="image">Question Audio</label>
                                    <div><input type="file" name="question_audio" id="image"
                                            value="{{$item->question_audio ? $item->question_audio : ''}}"></div>
                                </div>
                            </div> --}}
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="answer">{{ $websiteLang->where('lang_key','ans')->first()->custom_text
                                        }}</label>
                                    <textarea class="form-control" id="answer" name="answer" rows="5"
                                        cols="30">{{ $item->answer }}</textarea>
                                </div>
                            </div>
                            {{-- <div class="col-md-6">
                                <div class="form-group">
                                    <label for="">Existing Answer Audio</label>
                                    <div>
                                        <audio controls>
                                            <source src="{{ $item->answer_audio ? url($item->answer_audio) : "" }}"
                                                type="audio/mpeg">
                                            <input type="hidden" name="old_answer_audio"
                                                value="{{$item->answer_audio}}">
                                        </audio>
                                    </div>
                                </div>
                            </div> --}}
                            {{-- <div class="col-md-6">
                                <div class="form-group">
                                    <label for="image">Answer Audio</label>
                                    <div><input type="file" name="answer_audio" id="image"></div>
                                </div>
                            </div> --}}
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="status">Gender</label>
                                    <select name="gender" id="status" class="form-control">
                                        <option >Select Gender</option>
                                        <option {{ $item->gender=='male' ? 'selected' : '' }} value="male">Male</option>
                                        <option {{ $item->gender=='female' ? 'selected' : '' }} value="female">Female</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="status">{{
                                        $websiteLang->where('lang_key','status')->first()->custom_text }}</label>
                                    <select name="status" id="status" class="form-control">
                                        <option {{ $item->status==1 ? 'selected' : '' }} value="1">{{
                                            $websiteLang->where('lang_key','active')->first()->custom_text }}</option>
                                        <option {{ $item->status==0 ? 'selected' : '' }} value="0">{{
                                            $websiteLang->where('lang_key','inactive')->first()->custom_text }}</option>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <button type="button" class="btn btn-danger" data-dismiss="modal">{{
                            $websiteLang->where('lang_key','close')->first()->custom_text }}</button>
                        <button type="submit" class="btn btn-success">{{
                            $websiteLang->where('lang_key','update')->first()->custom_text }}</button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>

@endforeach



<script>
    function deleteData(id) {
        $("#deleteForm").attr("action", '{{ url("/admin/practice/") }}' + "/" + id)
    }

    function testimonialStatus(id) {
        // project demo mode check
        var isDemo = "{{ env('PROJECT_MODE') }}"
        var demoNotify = "{{ env('NOTIFY_TEXT') }}"
        if (isDemo == 0) {
            toastr.error(demoNotify);
            return;
        }
        $.ajax({
            type: "get",
            url: "{{url('/admin/segments-status/')}}" + "/" + id,
            success: function (response) {
                toastr.success(response)
            },
            error: function (err) {
                console.log(err);

            }
        })
    }

    $("#practice_id").change(function () {

        var selectedValue = this.value;

        $.ajax({
            type: 'get',
            url: "{{url('/admin/practice-filter/')}}" + "/" + selectedValue,
            success: function (response) {
                // console.log(data.answer);
                // $.each(response, function(key, value) {
                //     //For example
                //     console.log(value.status.title)
                //         $('#dataTable tbody').prepend( "<tr class='data" + value.id + "'>" +
                //         "<td>" + value.id + "</td>" +
                //         "<td>" + value.question + "</td>" +
                //         "<td>" + value.answer+ "</td>" +
                //         "<td>" + value.practice.title+ "</td>" +
                //         "<td>" + if (value.status==1) +
                //                 '<a href="" onclick="testimonialStatus({{ '+value.id+' }})"><input type="checkbox" checked data-toggle="toggle" data-on="{{ $websiteLang->where('lang_key','active')->first()->custom_text }}" data-off="{{ $websiteLang->where('lang_key','inactive')->first()->custom_text }}" data-onstyle="success" data-offstyle="danger"></a>'+
                //                 else+ '<a href="" onclick="testimonialStatus({{  '+value.id+'  }})"><input type="checkbox" data-toggle="toggle" data-on="{{ $websiteLang->where('lang_key','active')->first()->custom_text }}" data-off="{{ $websiteLang->where('lang_key','inactive')->first()->custom_text }}" data-onstyle="success" data-offstyle="danger"></a>'+ endif + "</td>"
                //         "<td>" + value.answer+ "</td>" +
                //         "<td>" + value.answer+ "</td>" +
                //          "</tr>" ); 
                // })

            }
        });
    });
</script>
@endsection