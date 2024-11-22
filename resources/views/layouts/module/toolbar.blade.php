<!--begin::Toolbar-->
<div class="d-flex align-items-center">
    <a href="#" class="btn btn-sm btn-light font-weight-bold mr-2" data-toggle="tooltip"
        title="Hari Ini, {{ TanggalFormatIndo::getDate(date('Y-m-d')) }}" data-placement="left">
        <span class="text-muted font-size-base font-weight-bold mr-2">Hari ini, </span>
        <span class="text-primary font-size-base font-weight-bolder">{{ TanggalFormatIndo::getDate(date('Y-m-d')) }}</span>
    </a>
    <!--end::Daterange-->
</div>
<!--end::Toolbar-->