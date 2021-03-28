
<?php $__env->startSection('css'); ?>
<style>
    .dataTables_filter {
        float: right !important;
    }

</style>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('page-contents'); ?>
  <div class="panel">
    <div class="panel-heading">
        <h3 class="panel-tittle">Product Categories</h3>
    </div>
    <div class="panel-body">
        
        <button type="button" class="btn btn-info " data-toggle="modal"
            data-target="#tambahdata">
            <i class="fa fa-plus-square"></i>
            Tambah Data
        </button>
        
        <?php if(Session::has('success')): ?>
        <div class="alert alert-success">
            <p><?php echo e(Session::get('success')); ?></p>
        </div>
        <button type="button" class="edit btn btn-outline-info " data-toggle="modal"
            data-target="#tambahdata">
            Tambah Data
        </button>
        <?php endif; ?>
        <br>
        <br>

  <table class="table table-striped">
    <thead>
      <tr>
        <th>No</th>
        <th>Category Name</th>
        <th class="text-center">Action</th>
      </tr>
    </thead>
    <tbody>
    <?php $__empty_1 = true; $__currentLoopData = $data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
      <tr>
        <td><?php echo e($loop->iteration); ?></td>
        <td><?php echo e($item->category_name); ?></td>
        <td class="text-center">
      
      <form action="/categories/<?php echo e($item->id); ?>" method="POST">
        <?php echo csrf_field(); ?>
        <?php echo e(method_field('DELETE')); ?>


        
        <a href="/categories/<?php echo e($item->id); ?>/edit" class="btn btn-primary">Edit
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil"
                fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
                    d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5L13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175l-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
            </svg>
        </a>

        
        <button type="submit" name="submit" class="btn btn-danger">Delete
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash"
                fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path
                    d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                <path fill-rule="evenodd"
                    d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
            </svg>
        </button>
    </form>
</td>
</tr>

<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
<tr>
<td class="text-center" colspan="3">
    <p>Tidak ada data</p>
</td>
</tr>
<?php endif; ?>
    </tbody>
  </table>
</div>

</body>
</html>

<!--------------------------------------- Modal Tambah data--------------------------------------------- -->
<div class="modal fade" id="tambahdata" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Menambahkan Data Baru</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/categories" method="POST" enctype="multipart/form-data">
                <?php echo csrf_field(); ?>
                <div class="modal-body">
                    
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Category</label>
                        <div class="col-sm-10">
                            <input name="category_name" type="text" class="form-control"
                                placeholder="Nama kategori yang ingin ditambahkan">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>


<?php $__env->startSection('javascript'); ?>
<!--Java Script untuk Data Table-->
<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#example').DataTable();
    });

</script>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xamp\htdocs\pratikumPrognet\resources\views/categories/categories.blade.php ENDPATH**/ ?>