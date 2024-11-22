@extends('layouts.master')
@section('title', 'Data Transaksi')
@section('css')
    <link href="{{ asset('assets/plugins/bootstrap-table/bootstrap-table.min.css') }}" rel="stylesheet" type="text/css" />
@endsection
@section('content')
    <!--begin::Subheader-->
    <div class="subheader py-2 py-lg-6 subheader-solid" id="kt_subheader">
        <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
            <!--begin::Info-->
            <div class="d-flex align-items-center flex-wrap mr-1">
                <!--begin::Page Heading-->
                <div class="d-flex align-items-baseline flex-wrap mr-5">
                    <!--begin::Page Title-->
                    <h5 class="text-dark font-weight-bold my-1 mr-5">Data Transaksi</h5>
                    <!--end::Page Title-->

                </div>
                <!--end::Page Heading-->
            </div>
            <!--end::Info-->
            @include('layouts.module.toolbar')

        </div>
    </div>
    <!--end::Subheader-->
    <!--begin::Entry-->
    <div class="d-flex flex-column-fluid">
        <!--begin::Container-->
        <div class="container">
            <!--begin::Notice-->
            @if ($message = Session::get('success'))
                <!--begin::Notice-->
                <div class="alert alert-custom alert-white alert-shadow gutter-b" role="alert">
                    <div class="alert-icon">
                        <span class="svg-icon svg-icon-primary svg-icon-xl">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                    <rect x="0" y="0" width="24" height="24" />
                                    <circle fill="#000000" opacity="0.3" cx="12" cy="12" r="10" />
                                    <path
                                        d="M16.7689447,7.81768175 C17.1457787,7.41393107 17.7785676,7.39211077 18.1823183,7.76894473 C18.5860689,8.1457787 18.6078892,8.77856757 18.2310553,9.18231825 L11.2310553,16.6823183 C10.8654446,17.0740439 10.2560456,17.107974 9.84920863,16.7592566 L6.34920863,13.7592566 C5.92988278,13.3998345 5.88132125,12.7685345 6.2407434,12.3492086 C6.60016555,11.9298828 7.23146553,11.8813212 7.65079137,12.2407434 L10.4229928,14.616916 L16.7689447,7.81768175 Z"
                                        fill="#000000" fill-rule="nonzero" />
                                </g>
                            </svg>
                        </span>
                    </div>
                    <div class="alert-text">
                        {{ $message }}
                    </div>
                </div>
                <!--end::Notice-->
            @endif
            <!--end::Notice-->
            <!--begin::Card-->
            <div class="card card-custom">
                <div class="card-header flex-wrap py-5">
                    <div class="card-title">
                        <h3 class="card-label">Data Transaksi</h3>
                    </div>
                </div>
                <div class="card-body">
                    <div class="form-group row">

                        <div class="col-12 col-md-4">
                            <label class="col-6 col-md-4 col-form-label">Tanggal</label>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Tanggal" id="tanggal"
                                    name="tanggal" autocomplete="off" required />
                                <div class="input-group-append">
                                    <span class="input-group-text">
                                        <i class="la la-calendar-check-o"></i>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-4">
                            <label class="col-form-label">&ensp;</label><br>
                            <button type="button" class="btn btn-sm btn-primary" id="btn_search" onclick="loadData()"><i
                                    class=" flaticon2-search"></i> Cari</button>
                        </div>
                    </div>
                    <!--begin: Datatable-->
                    <table class="table table-separate table-head-custom table-checkable" id="tb_transaksi"
                        data-toggle="table" data-pagination="true" data-search="true" data-page-size="10">
                        <thead>
                            <tr>
                                <th data-field="id" data-visible="false">Id</th>
                                <th data-formatter="noFormatter" data-sortable="true" data-align="center">No</th>
                                <th data-field="trx_code" data-sortable="true">Code</th>
                                <th data-field="name" data-sortable="true">Name</th>
                                <th data-field="email">Email</th>
                                <th data-field="phone_number">Phone</th>
                                <th data-formatter="dateFormatter" data-field="created_at" data-align="right">Date Trx</th>
                                <th data-formatter="dateFormatter" data-field="updated_at" data-align="right">Last Update</th>
                                <th data-formatter="moneyFormatter" data-field="total_price" data-sortable="true" data-align="right">Total</th>
                                <th data-formatter="moneyFormatter" data-field="delivery_fee" data-sortable="true" data-align="right">Fee</th>
                                <th data-formatter="moneyFormatter" data-field="grand_total" data-sortable="true" data-align="right">Grand Total </th>
                                <th data-formatter="statusFormatter" data-sortable="true" data-align="center">Status</th>
                                <th data-formatter="urlFormatter">Payment Url </th>
                            </tr>
                        </thead>
                    </table>
                    <!--end: Datatable-->
                </div>
            </div>
            <!--end::Card-->
        </div>
        <!--end::Container-->
    </div>
    <!--end::Entry-->
@endsection

@section('js')
    <script src="{{ asset('assets/plugins/bootstrap-table/bootstrap-table.min.js') }}"></script>
    <script type="text/javascript" src="jquery.js"></script>
    <script type="text/javascript" src="moment.js"></script>
    <script type="text/javascript" src="daterangepicker.js"></script>
    <link rel="stylesheet" type="text/css" href="bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="daterangepicker-bs3.css" />

    <script>
        $(document).ready(function() {
            $('#tanggal').daterangepicker();
            // Swal.fire({
            //     title: 'Mengambil Data',
            //     text: 'Mohon Tunggu...',
            //     allowOutsideClick: false,
            //     didOpen: () => {
            //         Swal.showLoading()
            //     }
            // })
            loadData();
        });

        function noFormatter(value, row, index) {
            return index + 1;
        }

        function statusFormatter(value, row, index) {
            if (row.status == 'Pending') {
                return '<span class="label label-info label-inline font-weight-lighter mr-2">Pending</span>';
            } else if (row.status == 'Expired') {
                return '<span class="label label-danger label-inline font-weight-lighter mr-2">Expired</span>';
            } else if (row.status == 'Berhasil') {
                return '<span class="label label-success label-inline font-weight-lighter mr-2">Berhasil</span>';
            }
        }

        function moneyFormatter(value, row, index) {
            var reverse = value.toString().split('').reverse().join(''),
                ribuan = reverse.match(/\d{1,3}/g);
            ribuan = ribuan.join('.').split('').reverse().join('');

            return `Rp ` + ribuan + ``
        }

        function dateFormatter(value, row, index) {
            if (value) {
                return moment(value).format('DD-MM-YYYY H:mm:ss');
            } else {
                return '-';
            }
        }

        function urlFormatter(value, row, index) {
            if (row.payment_url){
                return [
                    `<div class="card-toolbar">
                        <!--begin::Button-->
                        <a class="btn btn-icon btn-xs btn-success" href="`+row.payment_url+`" target="_blank" title="Views"><i class="fas fa-external-link-alt"></i></a>
                    </div>`
                ].join('')
            }else{
                return '-';
            }
        }


        function statusData(value, row, index) {
            if (row.status == '0') {
                return '<span class="label label-danger label-inline font-weight-lighter mr-2">Deleted</span>';
            } else if (row.status == '1') {
                return '<span class="label label-success label-inline font-weight-lighter mr-2">Active</span>';
            } else {
                return '<span class="label label-success label-inline font-weight-lighter mr-2">Verified</span>';
            }
        }

        function loadData() {
            var tanggal = $('#tanggal').val();
            var [tanggalAwal, tanggalAkhir] = tanggal.split(" - ");
            var startDate = moment(tanggalAwal).startOf("day").format("DD-MM-YYYY");
            var endDate = moment(tanggalAkhir).endOf("day").format("DD-MM-YYYY");
            $.ajax({
                url: '{{ url('/get-data') }}',
                type: 'POST',
                dataType: "json",
                data: {
                    _token: "{{ csrf_token() }}",
                    startDate: startDate,
                    endDate: endDate,
                },
                success: function(response) {
                    Swal.close();
                    $('#tb_transaksi').bootstrapTable('removeAll');
                    $('#tb_transaksi').bootstrapTable('load', response);
                },
                error: function(response) {
                    res = $.parseJSON(response.responseText);
                    Swal.fire({
                        icon: 'error',
                        title: 'ERROR',
                        text: res.message
                    })
                }
            });
        }
    </script>
@endsection
