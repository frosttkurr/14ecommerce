@extends('user')
@section('title', 'Pesanan Verified')
@section('page-contents')

    <!-- Page Content -->
    <div class="page-heading header-text">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1>Pesanan Saya</h1>
            <span>Daftar & Status Pesanan Verified</span>
          </div>
        </div>
      </div>
    </div>

    <!-- Product Information -->
    <div class="contact-information2">
        @if (count($errors) > 0)
          <div class="container alert alert-danger">
               <ul>
                    @foreach ($errors->all() as $error)
                         <li>{{ ucwords($error) }}</li>
                    @endforeach
               </ul>
          </div>
        @endif
     <div class="container">
       <div class="row">
           <div class="col-12">
               <div class="table-responsive">
                   <table class="table table-striped">
                       <thead>
                            <tr>
                                <th class="text-center px-4">
                                    <button type="button" class="btn {{ Request::url() == url('/order') ? 'btn-light' : 'btn-secondary' }}"><a style="text-decoration: none; color: inherit;" href="{{ url('order') }}">Semua</a></button>
                                    <button type="button" class="btn {{ Request::url() == url('/order/unpaid') ? 'btn-light' : 'btn-secondary' }}"><a style="text-decoration: none; color: inherit;" href="{{ url('order/unpaid') }}">Belum Dibayar</a></button>
                                    <button type="button" class="btn {{ Request::url() == url('/order/unverified') ? 'btn-light' : 'btn-secondary' }}"><a style="text-decoration: none; color: inherit;" href="{{ url('order/unverified') }}">Unverified</a></button>
                                    <button type="button" class="btn {{ Request::url() == url('/order/verified') ? 'btn-light' : 'btn-secondary' }}"><a style="text-decoration: none; color: inherit;" href="{{ url('order/verified') }}">Verified</a></button>
                                    <button type="button" class="btn {{ Request::url() == url('/order/delivered') ? 'btn-light' : 'btn-secondary' }}"><a style="text-decoration: none; color: inherit;" href="{{ url('order/delivered') }}">Dikirim</a></button>
                                    <button type="button" class="btn {{ Request::url() == url('/order/success') ? 'btn-light' : 'btn-secondary' }}"><a style="text-decoration: none; color: inherit;" href="{{ url('order/success') }}">Selesai</a></button>
                                    <button type="button" class="btn {{ Request::url() == url('/order/expired') ? 'btn-light' : 'btn-secondary' }}"><a style="text-decoration: none; color: inherit;" href="{{ url('order/expired') }}">Expired</a></button>
                                    <button type="button" class="btn {{ Request::url() == url('/order/canceled') ? 'btn-light' : 'btn-secondary' }}"><a style="text-decoration: none; color: inherit;" href="{{ url('order/canceled') }}">Dibatalkan</a></button>
                                </th>
                            </tr>
                       </thead>
                   </table>
               </div>
           </div>
       </div>
     </div>
   </div>

<form action="{{ route('order.payment') }}" method="POST" enctype="multipart/form-data">
     {{ csrf_field() }}
    <!-- Order Information -->
    <div class="callback-form contact-us" style="margin-top: 25px; padding-top: 45px; padding-bottom: 0;">
        @if (sizeOf($transaction) > 0)
            <div id="carouselExampleControls" class="carousel slide" data-interval="false">
                <div class="carousel-inner">
                    @foreach ($transaction as $order)
                        <div class="carousel-item @if ($loop->index == 0) active @endif">
                            <div class="container">
                                <div class="row justify-content-center align-self-center mb-5">
                                    <div class="well bg-white pt-4 pb-4 pl-5 pr-5 rounded col-xs-12 col-sm-12 col-md-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-5">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                <address>
                                                    <strong>Receipt: </strong>
                                                    <br>
                                                    {{ $order->user->name }}
                                                    <br>
                                                    {{ $order->address }}
                                                    <br>
                                                    {{ $order->regency .', '. $order->province }}
                                                </address>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                                <p>
                                                    <em>Tanggal : {{ \Carbon\Carbon::parse($order->created_at)->format('d/m/Y') }}</em>
                                                </p>
                                                <p>
                                                    <em>Status : {{ ucfirst($order->status) }}</em>
                                                </p>
                                                <p>
                                                    <em>Courier : {{ $order->courier->courier }}</em>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th class="text-left">Product</th>
                                                        <th class="text-center">Qty</th>
                                                        <th class="text-center">Price</th>
                                                        <th class="text-center">Discount</th>
                                                        <th class="text-center">Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @php $transaction_detail = \App\Transaction_Detail::with('product')->where('transaction_id', $order->id)->get(); @endphp
                                                    @foreach ($transaction_detail as $order_detail)
                                                        <tr>
                                                            <td class="col-md-9"><em>{{ $order_detail->product->product_name }}</em></h4></td>
                                                            <td class="col-md-1 text-center">{{ $order_detail->qty }}</td>
                                                            <td class="col-md-1 text-center">{{ "Rp" . number_format($order_detail->selling_price, 0, ",", ",") }}</td>
                                                            <td class="col-md-1 text-center">{{ $order_detail->discount }}%</td>
                                                            <td class="col-md-1 text-center">{{ "Rp" . number_format(($order_detail->selling_price - ($order_detail->selling_price * $order_detail->discount)/100)*$order_detail->qty, 0, ",", ",") }}</td>
                                                        </tr>
                                                    @endforeach
                                                    <tr>
                                                        <td>   </td>
                                                        <td>   </td>
                                                        <td>   </td>
                                                        <td class="text-left">
                                                            <p>
                                                                <strong>Subtotal: </strong>
                                                            </p>
                                                            <p>
                                                                <strong>Ongkir: </strong>
                                                            </p>
                                                        </td>
                                                        <td class="text-center">
                                                            <p>
                                                                <strong>{{ "Rp" . number_format($order->sub_total, 0, ",", ",") }}</strong>
                                                            </p>
                                                            <p>
                                                                <strong>{{ "Rp" . number_format($order->shipping_cost, 0, ",", ",") }}</strong>
                                                            </p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>   </td>
                                                        <td>   </td>
                                                        <td>   </td>
                                                        <td class="text-right"><h4><strong>Total: </strong></h4></td>
                                                        <td class="text-center text-danger"><h4><strong>{{ "Rp" . number_format($order->total, 0, ",", ",") }}</strong></h4></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <button type="button" class="btn btn-info btn-lg btn-block">
                                                Pesanan Verified - Segera Dikirim   <span class="glyphicon glyphicon-chevron-right"></span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
                </a>
            </div>
        @else
            <div class="w-md-80 w-lg-60 text-center mx-md-auto pb-3">
                <div class="mb-5">
                    <svg xmlns="http://www.w3.org/2000/svg" height="75" fill="currentColor" class="bi bi-cart-x" viewBox="0 0 16 16">
                        <path d="M7.354 5.646a.5.5 0 1 0-.708.708L7.793 7.5 6.646 8.646a.5.5 0 1 0 .708.708L8.5 8.207l1.146 1.147a.5.5 0 0 0 .708-.708L9.207 7.5l1.147-1.146a.5.5 0 0 0-.708-.708L8.5 6.793 7.354 5.646z"/>
                        <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                    </svg>
                    <h2 class="mt-3">Tidak ada pesanan</h2>
                </div>
            </div>
        @endif
    </div>
</form>

<!-- Footer Starts Here -->
@endsection