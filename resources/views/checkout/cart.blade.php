@extends('user')
@section('title', 'Cart')
@section('page-contents')

    <!-- Page Content -->
    <div class="page-heading header-text">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1>Keranjang Pesanan</h1>
            <span>Pilih Pesanan Anda</span>
          </div>
        </div>
      </div>
    </div>

    <div class="contact-information2">
      <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col"> </th>
                                <th scope="col" class="text-left">Product</th>
                                <th scope="col" class="text-center">Price</th>
                                <th scope="col" class="text-center">Quantity</th>
                                <th scope="col" class="text-center">Total Price</th>
                                <th> </th>
                            </tr>
                        </thead>
                        <tbody>
                          @if(empty($cart) || count($cart) == 0)
                            <tr>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                            </tr>
                          @else
                            @php $grandtotal = 0 @endphp
                            @foreach($cart as $item ) 
                              @php $subtotal = $item->product->price * $item->qty @endphp
                              <tr>
                                  <td><img src="https://dummyimage.com/50x50/55595c/fff" /> </td>
                                  <td>{{ $item->product->product_name }}</td>
                                  <td class="text-center">{{ "Rp" . number_format($item->product->price, 0, ",", ",") }}</td>
                                  <td class="text-center">{{ $item->qty }}</td>
                                  <td class="text-center">{{ "Rp" . number_format($subtotal, 0, ",", ",") }}</td>
                                  <td class="text-center"><button class="btn btn-sm btn-danger"><a style="text-decoration: none; color: inherit;" href="{{ url('/cart/hapus/'. $item->product_id) }}"><i class="fa fa-trash"></i> </a> </button> </td>
                              </tr>
                              <?= $grandtotal+=$subtotal ?>
                            @endforeach
                          @endif
                            <tr>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td></td>
                              <td><strong>Sub-Total</strong></td>
                              <td class="text-right"><strong>{{ "Rp" . number_format($grandtotal, 0, ",", ",") }}</strong></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col mb-2">
                <div class="row">
                    <div class="col-sm-12  col-md-6">
                        <button class="btn btn-block btn-light"><a style="text-decoration: none; color: inherit;" href="{{ url('home') }}">Continue Shopping</a></button>
                    </div>
                    <div class="col-sm-12 col-md-6 text-right">
                        <button class="btn btn-lg btn-block btn-success text-uppercase"><a style="text-decoration: none; color: inherit;" href="{{ url('checkout') }}">Checkout</a></button>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>

    <!-- Footer Starts Here -->
    @endsection