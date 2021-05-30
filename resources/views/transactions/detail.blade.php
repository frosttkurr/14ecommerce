@extends('admin')
@section('css')
<style>
    .dataTables_filter {
        float: right !important;
    }

</style>
@endsection
@section('page-contents')
  <div class="panel">
    <div class="panel-heading">
        <h3 class="panel-title">Transactions Detail: {{ $id }}</h3>
    </div>
    <div class="panel-body">
        <div class="row">
            @foreach ($transactions as $order)
                <div class="container" style="display: inline-block;">
                    <div class="row justify-content-center align-self-center">
                        <div class="card bg-secondary pt-4 pb-4 pl-5 pr-5 rounded col-xs-12 col-sm-12 col-md-8">
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
                                        <em>Kurir : {{ $order->courier->courier }}</em>
                                    </p>
                                    @if (($order->status == 'unverified') && (is_null($order->proof_of_payment)))
                                        <p>
                                            <em>Transfer ke : {{ substr(str_shuffle("0123456789"), 0, 16) }}</em>
                                        </p>
                                        <p>
                                            <em>Batas Bayar : <em id="countdown"></em></em>
                                        </p>
                                    @endif
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
                                @if ($order->status == 'unverified')
                                    @if (is_null($order->proof_of_payment))
                                        <button type="button" class="btn btn-dark btn-lg btn-block">
                                            Belum Upload Bukti Pembayaran   <span class="glyphicon glyphicon-chevron-right"></span>
                                        </button>
                                        <form id="timeout" action="{{ url('expired/'. $order->id) }}" method="POST" hidden>
                                            {{ method_field('PUT') }}
                                            {{ csrf_field() }}
                                            <button type="submit" class="btn btn-danger btn-lg btn-block mt-2" hidden>
                                                Expired   <span class="glyphicon glyphicon-chevron-right" hidden></span>
                                            </button>
                                        </form>
                                    @else
                                        <button type="button" class="btn btn-warning btn-lg btn-block">
                                            Sedang Menunggu Verifikasi   <span class="glyphicon glyphicon-chevron-right"></span>
                                        </button>
                                    @endif
                                @elseif ($order->status == 'verified')
                                    <button type="button" class="btn btn-info btn-lg btn-block">
                                        Pesanan Verified - Segera Dikirim   <span class="glyphicon glyphicon-chevron-right"></span>
                                    </button>
                                @elseif ($order->status == 'delivered') 
                                    <button type="button" class="btn btn-primary btn-lg btn-block">
                                        Pesanan Sedang Dikirim   <span class="glyphicon glyphicon-chevron-right"></span>
                                    </button>
                                @elseif ($order->status == 'success')
                                    <button type="button" class="btn btn-success btn-lg btn-block">
                                        Pesanan Sudah Diterima   <span class="glyphicon glyphicon-chevron-right"></span>
                                    </button>
                                @elseif ($order->status == 'expired')
                                    <button type="button" class="btn btn-light btn-lg btn-block">
                                        Pesanan Expired   <span class="glyphicon glyphicon-chevron-right"></span>
                                    </button>
                                @elseif ($order->status == 'canceled')
                                    <button type="button" class="btn btn-danger btn-lg btn-block">
                                        Pesanan Dibatalkan   <span class="glyphicon glyphicon-chevron-right"></span>
                                    </button>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn-group">
                    {{-- TOMBOL APPROVE --}}
                    @if (($order->status == 'unverified') && (isset($order->proof_of_payment)))
                        <form action="{{ url('approve/'. $order->id) }}" method="POST">
                            {{  method_field('PUT') }}
                            {{ csrf_field() }}
                            <button type="submit" name="approve" class="btn btn-success">Approve
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
                                    <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"/>
                                </svg>
                            </button>
                        </form>
                    @endif
    
                    {{-- TOMBOL KIRIM --}}
                    @if ($order->status == 'verified')
                        <form action="{{ url('delivered/'. $order->id) }}" method="POST">
                            {{  method_field('PUT') }}
                            {{ csrf_field() }}
                            <button type="submit" name="delivered" class="btn btn-info">Kirim
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cloud-haze2-fill" viewBox="0 0 16 16">
                                    <path d="M8.5 2a5.001 5.001 0 0 1 4.905 4.027A3 3 0 0 1 13 12H3.5A3.5 3.5 0 0 1 .035 9H5.5a.5.5 0 0 0 0-1H.035a3.5 3.5 0 0 1 3.871-2.977A5.001 5.001 0 0 1 8.5 2zm-6 8a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1h-9zM0 13.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5z"/>
                                </svg>
                            </button>
                        </form>
                    @endif
    
                    {{-- TOMBOL CANCEL --}}
                    @if (($order->status == 'unverified' && $order->proof_of_payment == NULL) || (($order->status == 'unverified') && (isset($order->proof_of_payment))) || ($order->status == 'verified'))
                        <form action="{{ url('canceled/'. $order->id) }}" method="POST">
                            {{ method_field('PUT') }}
                            {{ csrf_field() }}
                            <button type="submit" name="canceled" class="btn btn-danger">Cancel
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash"
                                        fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                                        <path fill-rule="evenodd"
                                            d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                                </svg>
                            </button>
                        </form>
                    @endif

                    {{-- EXPIRED --}}
                    @if (($order->status == 'unverified' && $order->proof_of_payment == NULL))
                        <script>
                            CountDownTimer('{{$order->created_at}}', 'countdown', '{{$order->timeout}}')
                            function CountDownTimer(dt, id, timeout)
                            {
                                var end = new Date(timeout);
                                var _second = 1000;
                                var _minute = _second * 60;
                                var _hour = _minute * 60;
                                var _day = _hour * 24;
                                var timer;
                                function showRemaining() {
                                    var now = new Date();
                                    var distance = end - now;
                                    if (distance < 0) {
                                        clearInterval(timer);
                                        document.getElementById(id).innerHTML = 'Expired'
                                        document.getElementById("timeout").submit();
                                        return;
                                    }
                                    var days = Math.floor(distance / _day);
                                    var hours = Math.floor((distance % _day) / _hour);
                                    var minutes = Math.floor((distance % _hour) / _minute);
                                    var seconds = Math.floor((distance % _minute) / _second);
                        
                                    document.getElementById(id).innerHTML = days + ' days ';
                                    document.getElementById(id).innerHTML += hours + ' hrs ';
                                    document.getElementById(id).innerHTML += minutes + ' mins ';
                                    document.getElementById(id).innerHTML += seconds + ' secs';
                                }
                                timer = setInterval(showRemaining, 1000);
                            }
                        </script>
                    @endif
                </div>
            @endforeach
        </div>
    </div>
</body>
</html>
@endsection

{{-- javascript tambahan --}}
@section('javascript')
<!--Java Script untuk Data Table-->
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#example').DataTable();
    });

</script>
@endsection