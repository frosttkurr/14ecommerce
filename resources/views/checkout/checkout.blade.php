@extends('user')
@section('title', 'Checkout')
@section('page-contents')

    <!-- Page Content -->
    <div class="page-heading header-text">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1>Checkout</h1>
            <span>Checkout Pesanan Anda</span>
          </div>
        </div>
      </div>
    </div>

    <!-- Product Information -->
<form action="{{ route('checkout.detail') }}" method="POST">
     {{ csrf_field() }}
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
                              <th></th>
                              <th scope="col" class="text-left">Product</th>
                              <th scope="col" class="text-center">Price</th>
                              <th scope="col" class="text-center">Quantity</th>
                              <th scope="col" class="text-center">Weight</th>
                              <th scope="col" class="text-center">Total Price</th>
                           </tr>
                       </thead>
                       <tbody>
                         @php $grandtotal = 0 @endphp
                         @php $weight = 0 @endphp
                         @php $ongkir = 0 @endphp
                         @php $totalDisc = 0 @endphp
                         @foreach ($cart as $item )
                              @foreach ($product as $id)
                                   @if ($item->product_id == $id)
                                        @php $subtotal = $item->product->price * $item->qty @endphp
                                        @php $image = DB::table('product_images')->where('product_id', '=' , $id)->get(); @endphp
                                        @php $discount = DB::table('discounts')->where('id_product', '=', $id)->whereDate('end', '>=', now())->get(); @endphp
                                        @foreach ($discount as $disc)
                                             @php $subDisc = $disc->percentage*$item->product->price/100 @endphp
                                             @php $totalDisc += $subDisc @endphp
                                        @endforeach
                                        <tr>
                                             <td class="text-center" hidden><input type="checkbox" checked name="product_id[]" value="{{ $item->product_id }}"></td>
                                             <td><img src="{{ asset('product_images/'.$image[0]->image_name) }}" height="45"/> </td>
                                             <td>{{ $item->product->product_name }}</td>
                                             <td class="text-center">{{ "Rp" . number_format($item->product->price, 0, ",", ",") }}</td>
                                             <td class="text-center">{{ $item->qty }}</td>
                                             <td class="text-center">{{ ($item->product->weight)/1000 }}kg</td>
                                             <td class="text-center">{{ "Rp" . number_format($subtotal, 0, ",", ",") }}</td>
                                        </tr>
                                        @php $grandtotal += $subtotal @endphp
                                        @php $weight += $item->product->weight @endphp
                                   @endif
                              @endforeach
                         @endforeach
                       </tbody>
                   </table>
               </div>
           </div>
       </div>
     </div>
   </div>

    <!-- Shipping Information -->
    <div class="callback-form contact-us" style="margin-top: 35px; padding-top: 55px; padding-bottom: 55px;">
     <div class="container">
       <div class="row">
         <div class="col-md-12">
           <div class="contact-form">
               <div class="row">
                    <div class="col-sm-6 col-xs-12">
                         <div class="form-group">
                              <input type="text" name="nama_lengkap" class="form-control" placeholder="Nama Lengkap" value="{{ old('nama_lengkap') }}">
                         </div>
                    </div>
                    <div class="col-sm-6 col-xs-12">
                         <div class="form-group">
                              <input type="text" name="no_hp" class="form-control" placeholder="Nomor Handphone" value="{{ old('no_hp') }}">
                         </div>
                    </div>
               </div>
               <div class="row">
                    <div class="col-sm-12 col-xs-12">
                         <div class="form-group">
                              <input type="text" name="alamat" class="form-control" placeholder="Nama Jalan/Gedung, No. Rumah, Kecamatan, Kelurahan, Kode Pos" value="{{ old('alamat') }}">
                         </div>
                    </div>
               </div>
               <div class="row">
                    <div class="col-sm-6 col-xs-12">
                         <div class="form-group">
                              <select name="province" class="form-control">
                                   <option value="0">-- Pilih Provinsi --</option>
                                   @foreach ($province as $provinsi => $value)
                                        <option value="{{ $provinsi }}">{{ $value }}</option>
                                   @endforeach
                              </select>
                         </div>
                    </div>
                    <div class="col-sm-6 col-xs-12">
                         <div class="form-group">
                              <select name="city" class="form-control">
                                   <option value="0">-- Pilih Kota/Kabupaten --</option>
                              </select>
                         </div>
                    </div>
               </div>
               <div class="row">
                    <div class="col-sm-6 col-xs-12">
                         <div class="form-group">
                              <select name="courier" class="form-control">
                                   <option value="0">-- Pilih Jasa Ekspedisi --</option>
                                   @foreach ($courier as $couriers => $value)
                                        <option value="{{ $couriers }}">{{ $value }}</option>
                                   @endforeach
                              </select>
                         </div>
                    </div>
                    <div class="col-sm-6 col-xs-12">
                         <div class="form-group">
                              <select name="payment" class="form-control">
                                   <option value="0">-- Choose Payment method --</option>
                                   <option value="bni">BNI Virtual Account</option>
                                   <option value="bca">BCA Virtual Account</option>
                                   <option value="bri">BRI Virtual Account</option>
                                   <option value="mandiri">MANDIRI Virtual Account</option>
                              </select>
                         </div>
                    </div>
               </div>
               <div class="row" hidden>
                    <div class="col-sm-6 col-xs-12" hidden>
                         <div class="form-group">
                              <input type="text" name="weight" hidden class="form-control" value="{{ $weight }}" placeholder="Berat">
                              <input type="text" name="discount" hidden class="form-control" value="{{ $totalDisc }}" placeholder="Potongan">
                              <input type="text" name="subtotal" hidden class="form-control" value="{{ $grandtotal - $totalDisc }}" placeholder="Sub Total">
                         </div>
                    </div>
               </div>
           </div>
         </div>
       </div>
     </div>
   </div>

    <!-- Total Information -->
    <div class="contact-information2">
      <div class="container">
        <ul class="list-group list-group-flush">
          <li class="list-group-item">
            <div class="row">
                  <div class="col-6">
                       <em>Sub-total untuk Produk</em>
                  </div>
                  
                  <div class="col-6 text-right">
                       <strong id="total-sub">{{ "Rp" . number_format($grandtotal, 0, ",", ",") }}</strong>
                  </div>
             </div>
          </li>
          
          <li class="list-group-item">
               <div class="row">
                    <div class="col-6">
                         <em>Discount</em>
                    </div>

                    <div class="col-6 text-right">
                         <strong id="total-potongan">-{{ "Rp" . number_format($totalDisc, 0, ",", ",") }}</strong>
                    </div>
               </div>
          </li>

          {{--<li class="list-group-item">
               <div class="row">
                    <div class="col-6">
                         <em>Total Ongkos Kirim</em>
                    </div>

                    <div class="col-6 text-right">
                         <strong id="total-ongkos">Rp. 0</strong>
                    </div>
               </div>
          </li>--}}

          <li class="list-group-item">
               <div class="row">
                    <div class="col-6">
                         <em>Total</em>
                    </div>

                    <div class="col-6 text-right">
                         <strong id="total-bayar">{{ "Rp" . number_format($grandtotal - $totalDisc, 0, ",", ",") }}</strong>
                    </div>
               </div>
          </li>
        </ul>
      </div>
      <div div class="col-sm-12 mt-4">
          <div class="d-flex justify-content-center">
               <button type="submit" id="form-submit" class="btn btn-warning">Buat Pesanan & Cek Ongkir</button>
          </div>
     </div>   
    </div>
</form>

    <!-- Footer Starts Here -->
    @endsection

    <!-- Bootstrap core JavaScript -->
     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
     <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

    <!-- Additional Scripts -->
    <script src="{{asset('styleuser/mobile/assets/js/custom.js')}}"></script>
    <script src="{{asset('styleuser/mobile/assets/js/owl.js')}}"></script>
    <script src="{{asset('styleuser/mobile/assets/js/slick.js')}}"></script>
    <script src="{{asset('styleuser/mobile/assets/js/accordions.js')}}"></script>

    <script>
          $(document).ready(function () {
               $('select[name="province"]').on('change', function() {
                    let provinceId = $(this).val();
                    if (provinceId) {
                         jQuery.ajax({
                              url: '/province/'+provinceId+'/cities',
                              type: 'GET',
                              dataType: 'json',
                              success:function(data) {
                                   $('select[name="city"]').empty();
                                   $.each(data, function(key, value) {
                                        $('select[name="city"]').append('<option value="'+key+'">'+value+'</option>');
                                   });
                              },
                         });
                    } else {
                         $('select[name="city"]').empty();
                         $('select[name="city"]').append('<option value="0">-- Pilih Kota/Kabupaten --</option>');
                    }
               });
          });
    </script>

    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>

