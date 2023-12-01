@extends('layouts.admin.layout')
@section('title')
<title>{{ $websiteLang->where('lang_key','practice')->first()->custom_text }}</title>
<meta name="csrf-token" content="{{ csrf_token() }}" />
@endsection
@section('admin-content')
<!-- Page Heading -->
<style>
    .order-container {
    overflow: scroll;
    max-height: 500px;
}
.move {
    cursor: move;
}
.list-group {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    padding-left: 0;
    margin-bottom: 0;
}
</style>
<h1 class="h3 mb-2 text-gray-800"><a href="#" data-toggle="modal" data-target="#addTestimonial"
        class="btn btn-success"><i class="fas fa-plus" aria-hidden="true"></i> {{
        $websiteLang->where('lang_key','create')->first()->custom_text }}</a></h1>
        <h1 class="h3 mb-2 text-gray-800"><a href="#" data-toggle="modal" data-target="#addTestimonial1"
            class="btn btn-success">Segment Order</a></h1>

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
                        {{-- <th width="50%">Question Audio</th>--}}
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
                                        @foreach ($practices as $items)
                                        <option value="{{ $items->id
                                            }}">{{ $items->title }}</option>
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
<div class="modal fade" id="addTestimonial1" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Segments Order</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 main-content">
                    <div class="card content-area p-4">
                        <div class="card-header border-0">
                        </div>
                        <div class="card-innr">
                            <div class="card-head ">
                                <h4 class="card-title float-none mb-2">Filter By Segments Category</h4>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class=" col-md-4">
                                        <label for="subcategory_id" class="col-form-label">Category</label>
                                        <select name="category_parent" id="category_parent" class="form-control col-12">
                                            <option value="0">--Select Category--</option>
                                            <?php
                                                foreach ($practices as $row) {?>
                                                    <option value="{{$row->id}}" selected="">{{$row->title}}</option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                    <div class="col-md-4 d-flex align-items-center pt-4">
                                        <button type="button" class="btn btn-outline-primary btn-sm" id="row_order_search" onclick="search_category_wise_products()">Search</button>
                                    </div>
                                </div>
                            </div>
                        </div><!-- .card-innr -->
                    </div><!-- .card -->
                </div>

                <div class="col-md-12 main-content">
                    <div class="card content-area p-4">
                        <div class="card-header border-0">
                        </div>
                        <div class="card-innr">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="subcategory_id" class="col-form-label">Segments List</label>
                                        <div class="row font-weight-bold">
                                            <div class="col-2">No.</div>
                                            <div class="col-2">Row Order Id</div>
                                            <div class="col-8">Title</div>
                                        </div>
                                        <ul class="list-group bg-grey move order-container" id="sortable">
                                            <?php
                                            $i = 0;
                                            foreach ($segments as $item) {
                                            ?>
                                                <li class="list-group-item d-flex bg-gray-light align-items-center h-25" id="product_id-<?= $item->id ?>">
                                                    <div class="col-md-2"><span> <?= $i ?> </span></div>
                                                    <div class="col-md-2"><span> <?= $item->row_order ?> </span></div>
                                                    <div class="col-md-6"><span><?= $item->question ?></span></div>
                                                </li>
                                            <?php
                                                $i++;
                                            }
                                            ?>
                                        </ul>
                                        <button type="button" class="btn btn-block btn-success btn-lg mt-3" id="save_product_order">Save</button>
                                    </div>
                                </div>
                            </div><!-- .card-innr -->
                        </div><!-- .card -->
                    </div>

                    <button type="button" class="btn btn-danger" data-dismiss="modal">{{
                        $websiteLang->where('lang_key','close')->first()->custom_text }}</button>
                    <button type="submit" class="btn btn-success">{{
                        $websiteLang->where('lang_key','save')->first()->custom_text }}</button>
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
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="answer">{{ $websiteLang->where('lang_key','ans')->first()->custom_text
                                        }}</label>
                                    <textarea class="form-control" id="answer" name="answer" rows="5"
                                        cols="30">{{ $item->answer }}</textarea>
                                </div>
                            </div>
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
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

<script>
$('#sortable').sortable({
    axis: 'y',
    opacity: 0.6,
    cursor: 'grab'
});

// $('#sortable').sortableJS({
//     axis: 'y',
//     opacity: 0.6,
//     cursor: 'grab'
// });
</script>
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

            }
        });
    });


    function search_category_wise_products() {
    var category_id = $('#category_parent').val();
    if (category_id != '') {
        $.ajax({
            data: {
                'cat_id': category_id,
            },
            type: 'GET',
            url: "{{url('/admin/segments-order/')}}",
            dataType: 'json',
            success: function (result) {
                console.log(result);
                var html = "";
                var i = 0;
                if (!$.isEmptyObject(result)) {
                    $.each(result, function (index, value) {
                        html += '<li class="list-group-item d-flex bg-gray-light align-items-center h-25 ui-sortable-handle" id="product_id-' + value['id'] + '">';
                        html += '<div class="col-md-1"><span> ' + i + ' </span></div>';
                        html += '<div class="col-md-3"><span> ' + value['row_order'] + ' </span></div>';
                        html += '<div class="col-md-4"><span>' + value['question'] + '</span></div>';
                        i++;
                    });
                    $('#sortable').html(html);
                } else {

                    iziToast.error({
                        message: 'No Products Are Available',
                    });

                    html += '<li class="list-group-item d-flex justify-content-center bg-gray-light align-items-center h-25 ui-sortable-handle" id="product_id-3"><div class="col-md-12 d-flex justify-content-center"><span>No Products  Are  Available</span></div></li>';
                    $('#sortable').html(html);
                }
            }
        });
    } else {
        iziToast.error({
            message: 'Category Field Should Be Selected',
        });
    }
}

$(document).on('click', '#save_product_order', function () {
    var data = $('#sortable').sortable('serialize');
    console.log('here');
    $.ajax({
        data: data,
        type: 'GET',
        url: "{{url('/admin/update-product-order/')}}",
        dataType: 'json',
        success: function (response) {
                toastr.success(response)
                location.reload();
            },
            error: function (err) {
                console.log(err);
                location.reload();
            }
    });
});
</script>
@endsection