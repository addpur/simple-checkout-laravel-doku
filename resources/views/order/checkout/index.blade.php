@extends('layouts.master')
@section('title', 'Checkout')
@section('css')
    <link href="{{ asset('assets/plugins/bootstrap-table/bootstrap-table.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('assets/css/pages/wizard/wizard-4.css') }}" rel="stylesheet" type="text/css" />
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
                    <h5 class="text-dark font-weight-bold my-1 mr-5">Checkout</h5>
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

                <div class="card-body p-0">
                    <!--begin: Wizard-->
                    <div class="wizard wizard-4" id="kt_wizard" data-wizard-state="step-first"
                        data-wizard-clickable="false">
                        <!--begin: Wizard Nav-->
                        <div class="wizard-nav">
                            <div class="wizard-steps" data-total-steps="2">
                                <!--begin::Wizard Step 1 Nav-->
                                <div class="wizard-step" data-wizard-type="step" data-wizard-state="current">
                                    <div class="wizard-wrapper">
                                        <div class="wizard-number">1</div>
                                        <div class="wizard-label">
                                            <div class="wizard-title">Delivery Address</div>
                                            <div class="wizard-desc">Setup Your Address</div>
                                        </div>
                                    </div>
                                </div>
                                <!--end::Wizard Step 1 Nav-->
                                <!--begin::Wizard Step 2 Nav-->
                                <div class="wizard-step" data-wizard-type="step">
                                    <div class="wizard-wrapper">
                                        <div class="wizard-number">2</div>
                                        <div class="wizard-label">
                                            <div class="wizard-title">Purchase</div>
                                            <div class="wizard-desc">Review and Submit</div>
                                        </div>
                                    </div>
                                </div>
                                <!--end::Wizard Step 2 Nav-->
                            </div>
                        </div>
                        <!--end: Wizard Nav-->
                        <!--begin: Wizard Body-->
                        <div class="card card-custom card-shadowless rounded-top-0">
                            <div class="card-body p-0">
                                <div class="row justify-content-center py-8 px-8 py-lg-15 px-lg-10">
                                    <div class="col-xl-12 col-xxl-7">
                                        <!--begin: Wizard Form-->
                                        <input type="text" id="cart_id" hidden value="{{ $data->id }}" />
                                        <form class="form mt-0 mt-lg-10" id="kt_form" action="">
                                            <!--begin: Wizard Step 1-->
                                            <div class="pb-5" data-wizard-type="step-content" data-wizard-state="current">
                                                <h4 class="mb-10 font-weight-bold text-dark">Review Your Address</h4>

                                                <div class="row">
                                                    <div class="col-xl-6">
                                                        <!--begin::Input-->
                                                        <div class="form-group">
                                                            <label>Name</label>
                                                            <input type="name"
                                                                class="form-control form-control-solid form-control-lg"
                                                                name="name" id="name" placeholder="Your Name"
                                                                value="{{ $data->name }}" readonly />
                                                            <span class="form-text text-muted">Please enter your
                                                                name.</span>
                                                        </div>
                                                        <!--end::Input-->
                                                    </div>
                                                    <div class="col-xl-6">
                                                        <!--begin::Input-->
                                                        <div class="form-group">
                                                            <label>Email</label>
                                                            <input type="email"
                                                                class="form-control form-control-solid form-control-lg"
                                                                name="email" id="email" placeholder="Your Email"
                                                                value="{{ $data->email }}" readonly />
                                                            <span class="form-text text-muted">Please enter your
                                                                email.</span>
                                                        </div>
                                                        <!--end::Input-->
                                                    </div>
                                                </div>

                                                <!--begin::Input-->
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input type="address"
                                                        class="form-control form-control-solid form-control-lg"
                                                        name="address" id="address" placeholder="Your Address"
                                                        value="{{ $data->address }}" readonly />
                                                    <span class="form-text text-muted">Please enter your Address.</span>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xl-6">
                                                        <!--begin::Input-->
                                                        <div class="form-group">
                                                            <label>Phone Number</label>
                                                            <input type="phone"
                                                                class="form-control form-control-solid form-control-lg"
                                                                name="phone_number" id="phone_number"
                                                                value="{{ $data->phone_number }}"
                                                                placeholder="Your Phone Number" readonly />
                                                            <span class="form-text text-muted">Please enter your Phone
                                                                Number.</span>
                                                        </div>
                                                        <!--end::Input-->
                                                    </div>
                                                    <div class="col-xl-6">
                                                        <!--begin::Select-->
                                                        <div class="form-group">
                                                            <label>Country</label>
                                                            <select name="country" id="country"
                                                                class="form-control form-control-solid form-control-lg"
                                                                readonly>
                                                                <option value="">Select</option>
                                                                <option value="ID" selected="selected">Indonesia
                                                                </option>
                                                            </select>
                                                        </div>
                                                        <!--end::Select-->
                                                    </div>
                                                </div>
                                            </div>
                                            <!--end: Wizard Step 1-->

                                            <!--begin: Wizard Step 2-->
                                            <div class="pb-5" data-wizard-type="step-content">
                                                <!--begin::Section-->
                                                <h4 class="mb-10 font-weight-bold text-dark">Review Order Details:</h4>
                                                <div class="text-dark-50 line-height-lg">
                                                    <div class="table-responsive">
                                                        <!--begin: Datatable-->
                                                        <table
                                                            class="table table-separate table-head-custom table-checkable"
                                                            id="tb_detail_cart" data-toggle="table"
                                                            data-pagination="true" data-page-size="10">
                                                            <thead>
                                                                <tr>
                                                                    <th data-field="id" data-visible="false">Id</th>
                                                                    <th data-formatter="noFormatter" data-align="center">
                                                                        No</th>
                                                                    <th data-formatter="imagesFormater">Ordered Items</th>
                                                                    <th data-field="qty" data-align="center">QTY</th>
                                                                    <th data-formatter="moneyFormatter" data-field="price"
                                                                        data-align="right">Unit Price</th>
                                                                    <th data-formatter="moneyFormatter"
                                                                        data-field="total_price" data-align="right">Amount
                                                                    </th>
                                                                </tr>
                                                            </thead>
                                                        </table>
                                                        <!--end: Datatable-->
                                                        <table class="table">
                                                            <thead>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td colspan="2"></td>
                                                                    <td class="font-weight-bolder text-right">Subtotal</td>
                                                                    <td class="font-weight-bolder text-right pr-0">Rp
                                                                        {{ UangFormat::rupiah($data->total_price) }}</td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" class="border-0 pt-0"></td>
                                                                    <td
                                                                        class="border-0 pt-0 font-weight-bolder text-right">
                                                                        Delivery Fees</td>
                                                                    <td
                                                                        class="border-0 pt-0 font-weight-bolder text-right pr-0">
                                                                        Rp {{ UangFormat::rupiah($data->delivery_fee) }}
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" class="border-0 pt-0"></td>
                                                                    <td
                                                                        class="border-0 pt-0 font-weight-bolder font-size-h5 text-right">
                                                                        Grand Total</td>
                                                                    <td
                                                                        class="border-0 pt-0 font-weight-bolder font-size-h5 text-success text-right pr-0">
                                                                        Rp {{ UangFormat::rupiah($data->grand_total) }}
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div class="separator separator-dashed my-5"></div>
                                                <!--end::Section-->
                                            </div>
                                            <!--end: Wizard Step 2-->

                                            <!--begin: Wizard Actions-->
                                            <div class="d-flex justify-content-between border-top mt-5 pt-10">
                                                <div class="mr-2">
                                                    <button type="button"
                                                        class="btn btn-light-primary font-weight-bolder text-uppercase px-9 py-4"
                                                        data-wizard-type="action-prev">Previous</button>
                                                </div>
                                                <div>
                                                    <button type="button"
                                                        class="btn btn-success font-weight-bolder text-uppercase px-9 py-4"
                                                        data-wizard-type="action-submit"
                                                        onclick="checkout()">Submit</button>
                                                    <button type="button"
                                                        class="btn btn-primary font-weight-bolder text-uppercase px-9 py-4"
                                                        data-wizard-type="action-next">Next</button>
                                                </div>
                                            </div>
                                            <!--end: Wizard Actions-->
                                        </form>
                                        <!--end: Wizard Form-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--end: Wizard Bpdy-->
                    </div>
                    <!--end: Wizard-->
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
    <script src="{{ asset('assets/js/pages/custom/ecommerce/checkout.js') }}"></script>
    <script>
        $(document).ready(function() {
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

        function moneyFormatter(value, row, index) {
            var reverse = value.toString().split('').reverse().join(''),
                ribuan = reverse.match(/\d{1,3}/g);
            ribuan = ribuan.join('.').split('').reverse().join('');

            return `Rp ` + ribuan + ` `
        }

        function imagesFormater(value, row, index) {
            return `<div class="symbol symbol-40 flex-shrink-0 mr-4 bg-light">
                        <div class="symbol-label" style="background-image: url('` + row.image + `')"></div>
                    </div>` + row.product_name
        }

        function loadData() {
            var cartId = $('#cart_id').val();
            $.ajax({
                url: '{{ url('/cart-detail') }}',
                type: 'POST',
                dataType: "json",
                data: {
                    _token: "{{ csrf_token() }}",
                    cartId: cartId,
                },
                success: function(response) {
                    Swal.close();

                    console.log("data", response);
                    $('#tb_detail_cart').bootstrapTable('removeAll');
                    $('#tb_detail_cart').bootstrapTable('load', response);
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


        function checkout() {
            var cartId = $('#cart_id').val();
            console.log("data id", cartId);
            $.ajax({
                url: '{{ url('/checkout') }}',
                type: 'POST',
                dataType: "json",
                data: {
                    _token: "{{ csrf_token() }}",
                    cartId: cartId,
                },
                success: function(response) {
                    Swal.close();
                    window.location =  response.payment_url;
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
