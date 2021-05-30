@extends('layouts.pages')
@section('title', 'Checkout Page')

@section('content')
<!--Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="bread-inner">
                    <ul class="bread-list">
                        <li>
                            <a href="index1.html">Home<i class="ti-arrow-right"></i></a>
                        </li>
                        <li class="active">
                            <a href="blog-single.html">Payment</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End Breadcrumbs -->
<div class="container my-3">
    @if (session('status'))
    <div   class="col-lg-8   mx-auto   mt-3   alert   alert-{{ session('type') }} alert-dismissible fade show" role="alert">{{ session('status') }}
        <button type="button" class="close" data-dismiss="alert"aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif
    <div class="card col-lg-8 mx-auto text-center">
        <div class="card-body">
            <h5 class="card-title">Hallo, {{Auth::guard('user')->user()->name}} !</h5>
            <h6  class="card-subtitle  mb-2  text-muted">Terima kasih telah mempercayaikami.</h6>
            
            @if($transaction->proof_of_payment === NULL)
            <p   class="card-text">Silahkan   Upload   Bukti Pembayaran melalui form dibawah ini.</p>
            <div class="my-2" id="getting-started"></div>
            <form class="my-4" action="/insertpayment/{{$transaction->id}}" method="post" enctype="multipart/form-data">
                {{csrf_field()}}
                <input type="hidden" id="timeout" value="{{$transaction->timeout}}">
                <input type="file" name="proof" id="">
                <button type="submit" class="btn">Upload</button>
            </form>
            <a href="/cancel/transaction/{{$transaction->id}}" class="btn btn-link">Batal</a>
            @else
            <p class="card-text">Bukti Pembayaran Telah diterima, silahkan tunggu hingga admin memverifikasi pembayaran kamu!.</p>
            @endif
        </div>
    </div>
</div>
<script>
    countdown();
    
    function countdown(){
        var timecount = $('#timeout').val();
        $("#getting-started").countdown(timecount, function(event) {
            $(this).text(event.strftime('Batas Akhir Pembayaran : %H jam %M menit %S detik'));
        });
    }
</script>

@endsection