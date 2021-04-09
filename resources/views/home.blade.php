@extends('user')
@section('page-contents')
 <!-- slider Area Start -->
        
        <!-- slider Area End-->
 
        <!-- Latest Products Start -->
        <div class="page-heading header-text">
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <h1>PHONE STORE</h1>
                <span>Harga Terjangkau, Kualitas Terjamin</span>
              </div>
            </div>
          </div>
        </div>
        <div class="services">
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <div class="section-heading">
                  <h2>Our <em>Products</em></h2>
                </div>
             </div>
            <div class="col-md-10">
                        <div class="service-item">
                            {{-- <!--Nav Button  -->
                            <nav>                                                                                                
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">All</a>
                                </div>
                            </nav>
                            <!--End Nav Button  -->
                        </div>
                    </div>
                </div>
                <!-- Nav Card -->
                <div class="tab-content" id="nav-tabContent">
                    <!-- card one -->
                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                          --}}
                        <div class="row">
                             @foreach ($product as $item)  
                            <div class="col-xl-4 col-lg-4 col-md-6">
                                <div class="single-product mb-60">
                                    <div class="product-img">
                                        @php
                                            $image = DB::table('product_images')->where('product_id','=',$item->id)->get();
                                        @endphp
                                        <img src="{{asset('product_images/'.$image[0]->image_name)}}" alt="">
                                        
                                    </div>
                                    <div class="product-caption">
                                        <div class="product-ratting">
                                            @for ($i = 0; $i < 5; $i++)
                                                @if ($i<$item->product_rate)
                                                    
                                                     <i class="fa fa-star"></i>
                                                @else
                                                     <i class="fa fa-star low-star"></i>
                                                @endif
                                            @endfor
                                        </div>
                                      <h4><a href="{{route('detail_product',['id'=>$item->id])}}">{{$item->product_name}}</a></h4>
                                        <div class="price">
                                            <ul>
                                                <li>Rp. {{number_format($item->price)}}</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            @endforeach
                           {{$product->links()}}
                        </div>
                    </div>

                    
                </div>
                <!-- End Nav Card -->
            </div>
        </section>
        <!-- Latest Products End -->
       
        {{-- <!-- Shop Method Start-->
        <div class="shop-method-area section-padding30">
            <div class="container">
                <div class="row d-flex justify-content-between">
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="single-method mb-40">
                            <i class="ti-package"></i>
                            <h6>Free Shipping Method</h6>
                            <p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="single-method mb-40">
                            <i class="ti-unlock"></i>
                            <h6>Secure Payment System</h6>
                            <p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
                        </div>
                    </div> 
                    <div class="col-xl-3 col-lg-3 col-md-6">
                        <div class="single-method mb-40">
                            <i class="ti-reload"></i>
                            <h6>Secure Payment System</h6>
                            <p>aorem ixpsacdolor sit ameasecur adipisicing elitsf edasd.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Shop Method End--> --}}

@endsection