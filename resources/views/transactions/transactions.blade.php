@extends('admin')
@section('css')
<style>
    .dataTables_filter {
        float: right !important;
    }

</style>
@endsection
@section('page-contents')
@if(Session::has('success'))
<div class="alert alert-success">
    <div class="alert-body">
        <button class="close" data-dismiss="alert">
            <span>&times;</span>
        </button>
        Data Berhasil Dimasukan
    </div>
</div>
@endif

@if(Session::has('edits'))
<div class="alert alert-success">
    <div class="alert-body">
        <button class="close" data-dismiss="alert">
            <span>&times;</span>
        </button>
        Data Berhasil Dirubah
    </div>
</div>
@endif

@if(Session::has('delete'))
<div class="alert alert-danger">
    <div class="alert-body">
        <button class="close" data-dismiss="alert">
            <span>&times;</span>
        </button>
        Data Berhasil Dihapus
    </div>
</div>
@endif

  <div class="panel">
    <div class="panel-heading">
        <h3 class="panel-tittle">Transactions</h3>
    </div>
    <div class="panel-body">
    
  <table class="table table-striped">
    <thead>
		<tr>
			<th class="text-center">Order Id</th>
			<th class="text-left">Name</th>
			<th class="text-left">Amount</th>
			<th class="text-center">Tanggal Pesan</th>
            <th class="text-center">Bukti Pembayaran</th>
			<th class="text-center">Status</th>
            <th>     </th>
		</tr>
	</thead>
    <tbody>
    @forelse ($transactions as $item)
        <tr>
            <td class="text-center"><a style="text-decoration: none; color: inherit;" href="{{ route('transactions.detail', ['id' => $item->id]) }}">{{ $item->id }}</a></td>
            <td class="text-left">{{ $item->user->name }}</td>
            <td class="text-left">{{ "Rp" . number_format($item->total, 0, ",", ",") }}</td>
            <td class="text-center">{{ $item->created_at->format('d/m/Y H:m:s') }}</td>
            <td class="text-center">
                @if (isset($item->proof_of_payment))
                    <span class="label label-default"><a style="text-decoration: none; color: inherit;" href="{{url('storage/public_html/payment/'.$item->proof_of_payment)}}" target="_blank">Lihat Bukti</a></span>                    
                @else 
                    Tidak ada
                @endif
            </td>
            <td class="text-center">
                @if ($item->status == 'unverified' && $item->proof_of_payment == NULL)
                    <span class="label label-default">Belum Bayar</span>
                @elseif (($item->status == 'unverified') && (isset($item->proof_of_payment)))
                    <span class="label label-warning">Pending</span>
                @elseif ($item->status == 'verified')
                    <span class="label label-info">Segera Dikirim</span>
                @elseif ($item->status == 'delivered')
                    <span class="label label-primary">Dikirim</span>
                @elseif ($item->status == 'success')
                    <span class="label label-success">Diterima</span>
                @elseif ($item->status == 'expired')
                    <span class="label label-danger">Expired</span>
                @elseif ($item->status == 'canceled')
                    <span class="label label-danger">Canceled</span>
                @endif
            </td>
            <td class="text-center">

        {{-- TOMBOL-TOMBOL --}}
                <div class="form-group">
                    {{-- TOMBOL APPROVE --}}
                    @if (($item->status == 'unverified') && (isset($item->proof_of_payment)))
                        <form action="{{ url('approve/'. $item->id) }}" method="POST">
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
                    @if ($item->status == 'verified')
                        <form action="{{ url('delivered/'. $item->id) }}" method="POST">
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
                    @if (($item->status == 'unverified' && $item->proof_of_payment == NULL) || (($item->status == 'unverified') && (isset($item->proof_of_payment))) || ($item->status == 'verified'))
                        <form action="{{ url('canceled/'. $item->id) }}" method="POST">
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
                </div>
            </td>
        </tr>

@empty
<tr>
<td></td>
<td></td>
<td></td>
<td class="text-center" colspan="1">
    <p>Tidak ada data</p>
</td>
<td></td>
<td></td>
<td></td>
</tr>
@endforelse
    </tbody>
  </table>
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