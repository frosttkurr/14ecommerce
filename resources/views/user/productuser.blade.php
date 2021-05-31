@extends('user')
@section('title', $product['product_name'])
@section('page-contents')
<div class="page-heading header-text">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="display-1">{{$product->product_name}}</h1>
        </div>
      </div>
    </div>
  </div>
  <br>
  <div class="services mt-5 mb-5">
    <div class="container">
      <div class="row">
        <div class="col-md-7">
            @foreach ($product_images as $image)
            
            <div class="col-md-7">
             <div>
                <img src="{{ url('storage/public_html/gambarproduct/'.$image->image_name) }}" alt class="img-fluid wc-image">
                <div class="single-gallery-image" style="background: url({{ url('storage/public_html/gambarproduct/'.$image->image_name) }});"></div>
              </div>
		    </div>
            @endforeach
            <br>
        </div>
        <div class="col-md-5 col-3">
          <div class="sidebar-item recent-posts">
          <h4 class="mb-2">{{$product->product_name}}</h4>
            <p>
                {{$product->description}}
            </p>
            <br>
            <form action="@if ($product->stock > 0) {{ url('cart') }} @endif" method="post">
                @csrf
                <div class="card_area">
                  <div class="product_count_area">
                    <div class="mb-3">
                      <h5>Quantity</h5><small>(Stock: {{ $product->stock }} pcs)</small>
                    </div>
                    <input type="text" name="user_id" value="{{$user->id}}" hidden />
                    <input type="text" name="product_id"  value="{{$product->id}}" hidden />
                    <div class="product_count d-inline-block">
                      <span class="product_count_item inumber-decrement"> <i class="ti-minus"></i></span>
                      <input class="product_count_item input-number form-control" name="qty" type="text" value="1" min="0" max="10">
                      <span class="product_count_item number-increment"> <i class="ti-plus"></i></span>
                    </div>
                  <div class="mt-3">
                    <h3>Rp. {{number_format($product->price)}}</h3>
                  </div>
                </div>
                  <br>
                <div class="form-group">
                    @if ($product->stock > 0)
                      <button type="submit" class="btn btn-lg btn-warning">Belanja Sekarang</button>
                    @else
                      <button type="button" disabled class="btn btn-lg btn-warning">Belanja Sekarang</button>
                    @endif
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
 	<div class="whole-wrap">
		<div class="container box_1170">
            <div class="section-top-border">
        <h3 class="">Review Customer</h3>
        <hr class="mb-30" style="width:22%;text-align:left;margin-left:0">
        <div class="row">
          @foreach ($transaction as $order)
            @php $transaction_detail = \App\Transaction_Detail::where('transaction_id', $order->id)->where('product_id', $product->id)->first(); @endphp
            @if ($transaction_detail != null)
              @if ($user_review==null)
                <div class="col-lg-12 col-md-12">
                  <form action="{{route('review_product',['id'=>$product->id])}}" method="POST">
                    @csrf
                    <input type="text" name="user_id" value="{{$user->id}}" hidden />
                    <input type="text" name="product_id"  value="{{$product->id}}" hidden />
                    <div class="input-group-icon mt-10">
                      <div class="icon"><i class="fa fa-star" aria-hidden="true"></i></div>
                      <div class="form-select" id="default-select">
                      <select name="rate" class="form-control col-sm-2">
                          <option disabled selected>Rating</option>
                          <option value="1">★</option>
                          <option value="2">★★</option>
                          <option value="3">★★★</option>
                          <option value="4">★★★★</option>
                          <option value="5">★★★★★</option>
                        </select>
                      </div>
                    </div>
                    <br>
                    <div class="mt-20">
                      <input type="text" class="form-control col-sm-4" name="content" placeholder="Tulis review..."
                        onfocus="this.placeholder = ''" onblur="this.placeholder = 'Content'" required
                        class="single-input">
                    </div>
                    <br>
                    <div class="button-group-area mt-10">
                      <input type="submit" class="btn genric-btn success radius" value="Submit" />
                    </div>  
                  </form>
              </div>
              @endif
            @endif
          @endforeach
        </div>
        	@foreach ($product_reviews as $item)
         <div class="row">
					<div class="d-inline-flex">
            <img src="{{asset('image_user/'.$item->user->profile_image)}}" style="width: 75px; height:75px;" alt="" class="img-fluid">
					</div>
					<div class="col-md-9 mt-sm-20">
            <p><b>{{$loop->iteration.'. '.$item->user->name}}</b></p>
            <p>
              @for ($i = 1; $i <= $item->rate; $i++)
                  ★
              @endfor
            </p>
            <p>{{$item->content}}</p>
					</div>
        </div>
          @php
              $responses = DB::table('response')->where('review_id','=',$item->id)->get();
          @endphp        
          @if (!$responses->isEmpty())
               @foreach ($responses as $respon)
                  <div class="row mt-3 mb-2">
                    <kbd>Response Admin</kbd>
                    <div class="col-lg-12 mt-2">
                      <blockquote class="generic-blockquote">
                         <small>{{$respon->content}}</small>
                      </blockquote>
                    </div>
                  </div>
                @endforeach
          @endif
        @endforeach
        
        
			</div>
			
        </div>
 	</div>   
  <!--================End Single Product Area =================-->
@endsection

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