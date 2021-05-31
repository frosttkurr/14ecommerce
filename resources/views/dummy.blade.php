<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta  name="viewport" content="width=device-width,  initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>@yield('title')</title>
    <!--Custom fonts for this template-->
    <link href="{{asset('akun/vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!--Custom styles for this template-->
    <link href="{{asset('akun/css/sb-admin-2.min.css')}}" rel="stylesheet">
</head>

<body id="page-top"><!--Page Wrapper -->
    <div id="wrapper">
        <!--Sidebar -->
        <ul  class="navbar-nav  bg-gradient-primary  sidebar  sidebar-dark accordion" id="accordionSidebar"><!--Sidebar -Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{ url('/') }}">
                <div class="sidebar-brand-text text-center">FreshShop</div>
            </a>
            <!--Divider -->
            <hr class="sidebar-divider my-0">
            <!--Nav Item -Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="{{ url('/profiluser') }}">
                    <i class="fas fa-users"></i>
                    <span>Profil User</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ url('/cartuser') }}">
                    <i class="fas fa-fw fa-folder">
                        </i>
                        <span>Cart</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ url('/pesananuser') }}">
                        <i class="fas fa-money-check-alt"></i>
                        <span>Pesanan Saya</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ url('/metodepembayaranuser') }}">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Metode Pembayaran</span>
                    </a>
                </li>
                <li class="nav-item"><a class="nav-link" href="{{ url('/gantipasswd') }}">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Ganti Password</span>
                </a>
            </li>
            <!--Divider -->
            <hr class="sidebar-divider d-none d-md-block">
            <!--Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
        <!--End of Sidebar -->
        <!--Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!--Main Content -->
            <div id="content">
                <!--Topbar -->
                <nav  class="navbar  navbar-expand  navbar-light  bg-white topbar mb-4 static-top shadow">
                    <!--Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button><!--Topbar Search -->
                    <!--Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!--Nav Item -Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a   class="nav-link   dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!--Dropdown -Messages -->
                            <div  class="dropdown-menu  dropdown-menu-right  p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                <form  class="form-inline  mr-auto  w-100  navbar-search">
                                    <div class="input-group">
                                        <input  type="text" class="form-control bg-light border-0 small" placeholder="Search   for..." aria-label="Search" aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>
                        <!--Nav Item -Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link   dropdown-toggle"   href="#" id="alertsDropdown"  role="button"  data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!--Counter -Alerts -->
                                @if(Auth::guard('user')->user()->unreadNotifications->count())
                                    <span class="badge badge-danger badge-counter" name="countNtf" id="countNtf">{{Auth::guard('user')->user()->unreadNotifications->count()}}</span>
                                @endif
                            </a>
                            <!--Dropdown -Alerts -->
                            <div  class="dropdown-list  dropdown-menu  dropdown-menu-right        shadow        animated--grow-in"        aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">Notification Center</h6>
                                <h6><a  href="/markRead"  class="dropdown-item  d-flex align-items-center">MarkAll as Read</a></h6>
                                @foreach(Auth::guard('user')->user()->unreadNotifications as $notif)
                                    <a   class="dropdown-item   d-flex   align-items-center btnunNotif" data-num="{{$loop->iteration}}" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-warning">
                                                <i class="fas fa-file-alt text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div  class="small  text-gray-500">{{$notif->created_at}}</div>
                                            <span class="font-weight-bold" style="color:lightgray" >{{$notif->data['content']}}</span>
                                            <input type="hidden"  id="untype_{{$loop->iteration}}" value="{{$notif->type}}">
                                            <input type="hidden"  id="unread_at_{{$loop->iteration}}" value="{{$notif->read_at}}">
                                            <input type="hidden"  id="id_unntf_{{$loop->iteration}}" value="{{$notif->id}}">
                                        </div>
                                    </a>
                                @endforeach 
                                @foreach(Auth::guard('user')->user()->readNotifications as $notif)
                                    <a   class="dropdown-item   d-flex   align-items-center btnNotif" data-num="{{$loop->iteration}}" href="#">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-primary">
                                                <i class="fas fa-file-alt text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div  class="small  text-gray-500">{{$notif->created_at}}</div>
                                            <span class="font-weight-bold" style="color:black">{{$notif->data['content']}}</span>
                                            <input    type="hidden"    id="type_{{$loop->iteration}}" value="{{$notif->type}}">
                                            <input   type="hidden"   id="read_at_{{$loop->iteration}}" value="{{$notif->read_at}}">
                                            <input   type="hidden"   id="id_ntf_{{$loop->iteration}}" value="{{$notif->id}}">
                                        </div>
                                    </a>
                                @endforeach
                            </div>
                        </li>
                    <div class="topbar-divider d-none d-sm-block"></div>
                    <!--Nav Item -User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a   class="nav-link   dropdown-toggle"   href="#" id="userDropdown"  role="button"  data-toggle="dropdown"  aria-haspopup="true" aria-expanded="false">
                            <span  class="mr-2  d-none  d-lg-inline  text-gray-600 small">{{Auth::guard('user')->user()->name}}</span>
                            <img      class="img-profile      rounded-circle" src="https://www.gstatic.com/images/branding/product/1x/admin_512dp.png">
                        </a>
                        <!--Dropdown -User Information -->
                        <div    class="dropdown-menu    dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i  class="fas  fa-user  fa-sm  fa-fw  mr-2  text-gray-400"></i>Profile
                            </a>
                            <a class="dropdown-item" href="#">
                                <i  class="fas  fa-cogs  fa-sm  fa-fw  mr-2  text-gray-400"></i>Settings
                            </a>
                            <a class="dropdown-item" href="#">
                                <i  class="fas  fa-list  fa-sm  fa-fw  mr-2  text-gray-400"></i>Activity Log
                            </a>
                            <div class="dropdown-divider"></div>
                            <a    class="dropdown-item"    href="#"    data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>Logout
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>
            <!--End of Topbar -->
            <!--Begin Page Content -->
            @yield('content')
            <!--/.container-fluid -->
        </div>
        <!--End of Main Content -->
        <!--Footer -->
        <footer class="sticky-footer bg-white">
            <div class="containermy-auto">
                <div class="copyright text-center my-auto">
                    <span>Copyright &copy; Your Website 2019</span>
                </div>
            </div>
        </footer>
        <!--End of Footer -->
    </div>
    <!--End of Content Wrapper -->
</div>
<!--End of Page Wrapper -->
<!--Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a><!--Logout Modal-->
<div   class="modal   fade"   id="logoutModal"   tabindex="-1" role="dialog"      aria-labelledby="exampleModalLabel"      aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header"><h5class="modal-title"  id="exampleModalLabel">Ready to Leave?</h5>
                <button     class="close"     type="button"     data-dismiss="modal" aria-label="Close"><span aria-hidden="true">Ã—</span></button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button  class="btn  btn-secondary"  type="button"  data-dismiss="modal">Cancel</button>
                <a               class="btn               btn-primary" href="/userLogout">Logout</a>
            </div>
        </div>
    </div>
</div>

<script src="{{asset('akun/vendor/jquery/jquery.min.js')}}"></script>
<script src="{{asset('akun/vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
<script src="{{asset('akun/vendor/jquery-easing/jquery.easing.min.js')}}"></script>
<script src="{{asset('akun/js/sb-admin-2.min.js')}}"></script>
<script src="{{asset('akun/vendor/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('akun/vendor/datatables/dataTables.bootstrap4.min.js')}}"></script>

<!--Page level custom scripts -->
<script src="{{asset('akun/js/demo/datatables-demo.js')}}"></script>
<script src="https://js.pusher.com/6.0/pusher.min.js"></script>

<script type="text/javascript">
    $('.btnNotif').click(function(){
        var number = $(this).data("num");
        $.ajax({url: "{{url('/getNotif')}}",
        type: "POST",
        data:{
            _token: '{{csrf_token()}}',
            id_ntf: $('#id_ntf_'+number).val(),
            type: $('#type_'+number).val(),
            read_at: $('#read_at_'+number).val(),
        },
        success: function(data){
            //1 = respon, 2 = status
            if (data == 1) {
                alert("silahkan cek review anda");
                location.reload();
            }elseif(data == 2){
                window.location.href = "/pesananuser";
            }
            // window.location.href = "/";
        }
    });
});

$('.btnunNotif').click(function(){
    var number = $(this).data("num");
    $.ajax({
        url: "{{url('/getNotif')}}",
        type: "POST",
        data:{
            _token: '{{csrf_token()}}',
            id_ntf: $('#id_unntf_'+number).val(),
            type: $('#untype_'+number).val(),
            read_at: $('#unread_at_'+number).val(),
        },
        success: function(data){
            if (data == 1) {
                alert("silahkan cek review anda");
                location.reload();
            }else if(data == 2){
                window.location.href= "/pesananuser";
            }
        }
    });
});
</script>

<script type="text/javascript">
    $(document).ready(function() {
        $('select[name="province_to"]').on('change', function(){
            var cityId = $(this).val();
            if(cityId){
                $.ajax({
                    url: '/getCity/ajax/'+cityId,
                    type: "GET",
                    dataType: "json",
                    success: function(data){
                        $('select[name="destination"]').empty();
                        $.each(data, function(key, value){
                            $('select[name="destination"]').append('<option  value="'+key  + '">'+value+'</option>');
                        }); 
                    }
                });
            }else{
                $('select[name="destination"]').empty();
            }
        });    

        });$(".btnUpload").click(function(){
            $("#id_transaksi").val($(this).data("id"));
        });
    }
</script>

<script type="text/javascript">
    $(document).ready(function(){
        var sumRow =  $("#counter").val();
        var transId = $("#trans_id").val();
        var interval = setInterval(function(){
            for(var i=1; i <= Number(sumRow); i++){
                var expired  =  new Date($("#timeout_"+(i)).val()).getTime();
                var time = new Date().getTime();
                var end = expired -time;
                var hour = Math.floor((end%(1000 * 60 * 60 * 24))/(1000 * 60 * 60));
                var minute = Math.floor((end % (1000 * 60 * 60)) / (1000 * 60));
                var second = Math.floor((end % (1000 * 60)) / 1000);
                
                if(end<=0  ||  minute==NaN  ||hour==NaN  || second==NaN){
                    $.get('/pesananuser/expired/'+transId);
                    //alert(transId);
                    // $.ajax({
                        // url : '/pesananuser/expired/'+transId, 
                        // give complete url here
                        //     type : 'post',
                        //     data : {id:transId},
                        //     success : function(data){
                            //         alert('success');
                            // }
                        // });
                    var statusExp = $("#kondon_"+i).html("EXPIRED");}else{$("#kondon_"+i).html(hour+" : "+minute+" : "+second);}}},1000);
                        $(".btnUpload").click(function(){
                            $("#id_transaksi").val(
                                $(this).data("id"));
                            });                
                        });
                    </script>
                </body>
            </html>