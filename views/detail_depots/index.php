<?php
if (isset($_POST['ajax'])) {
  include('../../evr.php');
}
$detail_vente = new detail_vente();
$id = explode('?id=', $_SERVER["REQUEST_URI"])[1];
$data = $detail_vente->selectAllValide($id);
?>
<style type="text/css">
</style>
<div class="container-fluid disable-text-selection">
  <div class="row">
    <div class="col-12">
      <div class="mb-2">
        <h1>Detail opération N° : <?php echo $id ?></h1>
        <input type="hidden" id="id_vente" value="<?php echo $id  ?>" />
        <div class="float-sm-right text-zero">
          <button type="button" class="btn btn-success  url notlink" data-url="depots/index.php"> <i class="glyph-icon simple-icon-arrow-left"></i></button>
        </div>
        <!--
        <div class="float-sm-right text-zero">
          <button type="button" class="btn btn-primary btn-lg  mr-1 url notlink" data-url="detail_vente/add.php?id=<?php echo $id ?>" >AJOUTER</button>
        </div>
-->
      </div>
      <div class="separator mb-5"></div>
    </div>
  </div>
  <div class="row">
    <div class="col-xl-12 col-lg-12 mb-4">
      <div class="card h-100">
        <div class="card-body">
          <table class="table" cellpadding="0" cellspacing="0" id="datatables " id="box-table-a" summary="Employee Pay Sheet">
            <thead>
              <tr>
                <th scope="col">Produit</th>
                <th width="170" scope="col">Dépot Source</th>
                <th width="170" scope="col">Dépot Destination</th>
                <th width="129" scope="col">qte</th>
                <th width="129" scope="col">Action</th>
              </tr>
            </thead>
            <tbody id="detail_commande">
              <?php
              $depot_op = new depot_op();
              $data = $depot_op->get_details($id);
              foreach ($data as $ligne) {
              ?>
                <tr>
                  <td><?php echo $ligne->designation ?></td>
                  <td>
                    <label for="depot_source">
                    <?php echo $ligne->depot_src ?>
                    </label>  <?php
                      $depot = new depot();
                      $res_depot = $depot->selectAll();
                      ?>
                      <select class="form-control select2-single d-none" name="id_depot_src" id="id_depot_src">
                        <?php foreach ($res_depot as $d) : ?>
                          <option value="<?php echo $d->id ?>">
                            <?php echo $d->nom ?>
                          </option>
                        <?php endforeach; ?>
                      </select>
                  </td>
                  <td>
                    <label for="depot_dest">
                    <?php echo $ligne->depot_dest ?>
                    </label><?php
                      $depot = new depot();
                      $res_depot = $depot->selectAll();
                      ?>
                      <select class="form-control select2-single d-none" name="id_depot_src" id="id_depot_src">
                        <?php foreach ($res_depot as $d) : ?>
                          <option value="<?php echo $d->id ?>">
                            <?php echo $d->nom ?>
                          </option>
                        <?php endforeach; ?>
                      </select>
                  </td>
                  <td> <label for="qte_op"><?php echo $ligne->qte_op ?></label><input style="display:none" type="text" value="<?php echo $ligne->qte_op ?>"></td>
                  <td>
                    <!-- <a class="badge badge-danger mb-2 delete" data-id="<?php echo $ligne->id_detail; ?>" style="color: white;cursor: pointer;" title="Supprimer" href='javascript:void(0)' >
                    <i class="simple-icon-trash" style="font-size: 15px;"></i>
                </a> -->
                    <?php if ((auth::user()['privilege'] == 'Admin' || auth::user()['supprimer'] == 1)) { ?>
                      <a class="badge badge-danger mb-2 delete" data-id="<?php echo $ligne->id_detail; ?>" style="color: white;cursor: pointer;" title="Supprimer" href='javascript:void(0)'>
                        <i class="simple-icon-trash" style="font-size: 15px;"></i>
                      </a>
                    <?php } ?>
                    <?php //  if ((auth::user()['privilege'] == 'Admin' || auth::user()['modifier'] == 1)) { 
                    ?>
                        <!-- <a class="badge badge-warning mb-2  url notlink" 
                        data-url="detail_depots/update.php?id=<?php echo $ligne->id_detail; ?>" 
                        style="color: white;cursor: pointer;" title="Modifier" href="javascript:void(0)">
                          <i class="iconsmind-Pen-5" style="font-size: 15px;"> </i>
                        </a> -->
                    <?php // } 
                    ?>
                  </td>
                </tr>
              <?php
              }
              ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  $(document).ready(function() {
    $("input.datepicker").datepicker({
      format: 'yyyy-mm-dd',
      templates: {
        leftArrow: '<i class="simple-icon-arrow-left"></i>',
        rightArrow: '<i class="simple-icon-arrow-right"></i>'
      }
    });
    var table = $('#datatables').dataTable({
      order: [
        [0, "desc"]
      ],
      dom: 'Bfrtip',
      buttons: [{
          extend: 'excelHtml5',
          title: "liste des ventes N° <?php echo $id ?>",
          exportOptions: {
            columns: [0, 1, 2, 3, 4]
          }
        },
        {
          extend: 'pdfHtml5',
          title: "liste des ventes N° <?php echo $id ?>",
          exportOptions: {
            columns: [0, 1, 2, 3, 4, ]
          }
        },
        {
          extend: 'csvHtml5',
          title: "liste des ventes N° <?php echo $id ?>",
          exportOptions: {
            columns: [0, 1, 2, 3, 4, ]
          }
        }
      ],
      pageLength: 10,
      language: {
        paginate: {
          previous: "<i class='simple-icon-arrow-left'></i>",
          next: "<i class='simple-icon-arrow-right'></i>"
        }
      },
      drawCallback: function() {
        $($(".dataTables_wrapper .pagination li:first-of-type")).find("a").addClass("prev"),
          $($(".dataTables_wrapper .pagination li:last-of-type")).find("a").addClass("next"),
          $(".dataTables_wrapper .pagination").addClass("pagination-sm")
      }
    });
    $('body').on("click", ".delete", function(event) {
      event.preventDefault();
      var btn = $(this);
      swal({
        title: 'Êtes-vous sûr?',
        text: "Voulez vous vraiment Supprimer cet élément !",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Oui, Supprimer !'
      }).then((result) => {
        if (result.value) {
          $.ajax({
            type: "POST",
            url: "<?php echo BASE_URL . 'views/detail_depots/'; ?>controle.php",
            data: {
              act: "delete",
              id: btn.data('id')
            },
            success: function(data) {
              swal(
                'Supprimer',
                'élément a ete bien Supprimer',
                'success'
              ).then((result) => {
                btn.parents("td").parents("tr").remove();
                location.reload();
              });
            }
          });
        }
      });
    });
    $('body').on("click", ".archive", function(event) {
      event.preventDefault();
      var btn = $(this);
      swal({
        title: 'Êtes-vous sûr?',
        text: "Voulez vous vraiment Archiver ce vente !!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#145388',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Oui, Archiver!'
      }).then((result) => {
        if (result.value) {
          $.ajax({
            type: "POST",
            url: "<?php echo BASE_URL . 'views/detail_vente/'; ?>controle.php",
            data: {
              act: "archive",
              id: btn.data('id'),
              val: btn.data('arc')
            },
            success: function(data) {
              swal(
                "Archived",
                'Your Product has been archived.',
                'success'
              ).then((result) => {
                btn.parents("td").parents("tr").remove();
              });
            }
          });
        }
      });
    });
    $('body').on("click", ".static", function(event) {
      event.preventDefault();
      var btn = $(this);
      $.ajax({
        type: "POST",
        url: "<?php echo BASE_URL . 'views/detail_vente/'; ?>controle.php",
        data: {
          act: "getName",
          id: btn.data('id')
        },
        success: function(datas) {
          var data = datas.split(';;;');
          $('#exampleModalRight .modal-title').html("Etat vente " + data[1]);
          $('#idstatic').val(data[0]);
        }
      });
    });
    $("#Staticform").on("submit", function(event) {
      event.preventDefault();
      var form = $(this);
      $.ajax({
        type: "POST",
        url: "<?php echo BASE_URL . 'views/detail_vente/'; ?>controle.php",
        data: new FormData(this),
        dataType: 'text', // what to expect back from the PHP script, if anything
        cache: false,
        contentType: false,
        processData: false,
        success: function(data) {
          $('#etatstatic').html(data);
        }
      });
    });
    // $('.updatee').click(function() {
    //   value = $(this).data('id');
    //   $('#' + value).find("label").hide();
    //   $('#' + value).find("input[type='text']").show();
    //   $('#' + value).children("td:last").html("<input type='button' class='Applique'  value='Applique'data-id= '" + value + "' />");


    // })
  });
</script>