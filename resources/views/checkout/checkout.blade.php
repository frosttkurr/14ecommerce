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

    <div class="contact-information2">
      <div class="container">
        <ul class="list-group list-group-flush">
          <li class="list-group-item">
            <div class="row">
                  <div class="col-6">
                       <em>Sub-total</em>
                  </div>
                  
                  <div class="col-6 text-right">
                       <strong>Rp. 0</strong>
                  </div>
             </div>
          </li>
          
          <li class="list-group-item">
               <div class="row">
                    <div class="col-6">
                         <em>Potongan</em>
                    </div>

                    <div class="col-6 text-right">
                         <strong>Rp. 0</strong>
                    </div>
               </div>
          </li>

          <li class="list-group-item">
               <div class="row">
                    <div class="col-6">
                         <em>Pajak</em>
                    </div>

                    <div class="col-6 text-right">
                         <strong>Rp. 0</strong>
                    </div>
               </div>
          </li>

          <li class="list-group-item">
               <div class="row">
                    <div class="col-6">
                         <em>Total</em>
                    </div>

                    <div class="col-6 text-right">
                         <strong>Rp. 0</strong>
                    </div>
               </div>
          </li>
         
        </ul>
      </div>
    </div>

    <div class="callback-form contact-us">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="contact-form">
              <form action="#" id="contact">
                 <div class="row">
                      <div class="col-sm-6 col-xs-12">
                           <div class="form-group">
                                <select class="form-control" data-msg-required="This field is required.">
                                     <option value="">-- Choose Title --</option>
                                     <option value="dr">Dr.</option>
                                     <option value="miss">Miss</option>
                                     <option value="mr">Mr.</option>
                                     <option value="mrs">Mrs.</option>
                                     <option value="ms">Ms.</option>
                                     <option value="other">Other</option>
                                     <option value="prof">Prof.</option>
                                     <option value="rev">Rev.</option>
                                </select>
                           </div>
                      </div>
                      <div class="col-sm-6 col-xs-12">
                           <div class="form-group">
                                <input type="text" class="form-control" placeholder="Name:">
                           </div>
                      </div>
                 </div>
                 <div class="row">
                      <div class="col-sm-6 col-xs-12">
                           <div class="form-group">
                                <input type="text" class="form-control" placeholder="Email:">
                           </div>
                      </div>
                      <div class="col-sm-6 col-xs-12">
                           <div class="form-group">
                                <input type="text" class="form-control" placeholder="Phone:">
                           </div>
                      </div>
                 </div>
                 <div class="row">
                      <div class="col-sm-6 col-xs-12">
                           <div class="form-group">
                                <input type="text" class="form-control" placeholder="Address 1:">
                           </div>
                      </div>
                      <div class="col-sm-6 col-xs-12">
                           <div class="form-group">
                                <input type="text" class="form-control" placeholder="Address 2:">
                           </div>
                      </div>
                 </div>
                 <div class="row">
                      <div class="col-sm-6 col-xs-12">
                           <div class="form-group">
                                <input type="text" class="form-control" placeholder="City:">
                           </div>
                      </div>
                      <div class="col-sm-6 col-xs-12">
                           <div class="form-group">
                                <input type="text" class="form-control" placeholder="State:">
                           </div>
                      </div>
                 </div>
                 <div class="row">
                      <div class="col-sm-6 col-xs-12">
                           <div class="form-group">
                                <input type="text" class="form-control" placeholder="Zip:">
                           </div>
                      </div>
                      <div class="col-sm-6 col-xs-12">
                           <div class="form-group">
                                <select class="form-control">
                                     <option value="">-- Choose Country --</option>
                                     <option value="">-- Choose --</option>
                                     <option value="">-- Choose --</option>
                                     <option value="">-- Choose --</option>
                                </select>
                           </div>
                      </div>
                 </div>

                 <div class="row">
                      <div class="col-sm-6 col-xs-12">
                           <div class="form-group">
                                <select class="form-control">
                                     <option value="">-- Choose Payment method --</option>
                                     <option value="bank">Bank account</option>
                                     <option value="cash">Cash</option>
                                     <option value="cOD">Cash On Delivery</option>
                                     <option value="paypal">PayPal</option>
                                </select>
                           </div>
                      </div>

                      <div class="col-sm-6 col-xs-12">
                           <div class="form-group">
                                <input type="text" class="form-control" placeholder="Captcha">
                           </div>
                      </div>
                 </div>

                 <div class="row">
                   <div class="col-lg-12">
                      <button type="submit" id="form-submit" class="filled-button">Finish</button>
                  </div>
                 </div>
              </form>

            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Footer Starts Here -->
    @endsection

    <!-- Bootstrap core JavaScript -->
    <script src="{{asset('styleuser/mobile/vendor/jquery/jquery.min.js')}}"></script>
    <script src="{{asset('styleuser/mobile/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>

    <!-- Additional Scripts -->
    <script src="{{asset('styleuser/mobile/assets/js/custom.js')}}"></script>
    <script src="{{asset('styleuser/mobile/assets/js/owl.js')}}"></script>
    <script src="{{asset('styleuser/mobile/assets/js/slick.js')}}"></script>
    <script src="{{asset('styleuser/mobile/assets/js/accordions.js')}}"></script>

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

