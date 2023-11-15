<?php
if (isset($_POST['ajax'])) {
  include('../../evr.php');
}
$result = strpos($_SERVER["REQUEST_URI"], "&valide=true");
if ($result == false) {
  $id = explode('?id=', $_SERVER["REQUEST_URI"])[1];
} else {
  $exploded = explode('&', $_SERVER["REQUEST_URI"]);
  $id = explode('?id=', $exploded[0])[1];
  $valide = explode("valide=", $exploded[1])[1];
}
$detail_achat = new detail_achat();
$achat = new achat();
$data = $detail_achat->selectAllValide($id);
$achat = $achat->selectById($id);
?>
<div class="container-fluid disable-text-selection">
  <div class="row">
    <div class="col-12">
      <div class="mb-2">
        <h1>
          
        <?php   if($valide){?> 
          Valider Achat  N° : <?php echo $id ?>
          <?php   } else{?> 
            Detail achat N° : <?php echo $id ?>
            <?php   } ?> 
       
          
        </h1>
        <input type="hidden" id="id_achat" value="<?php echo $id ?>" />
        <div class="float-sm-right text-zero">
          <button type="button" class="btn btn-success  url notlink" data-url="achat/index.php"> <i
              class="glyph-icon simple-icon-arrow-left"></i></button>
        </div>
        <div class="float-sm-right text-zero">
          <button type="button" class="btn btn-primary btn-lg  mr-1 url notlink"
            data-url="detail_achat/add.php?id=<?php echo $id ?>">AJOUTER</button>
        </div>


        <?php if ($valide && $achat->valide == 0) { ?>
          <a class="mb-2 valide_achat float-sm-right text-zero" style="color: white;cursor: pointer;"
            title="Valide la commande" type="button" id="btn_valide_<?php echo $id; ?>" data-id="<?php echo $id; ?>">

            <button type="button" class="btn btn-primary btn-lg mr-1 " <?php echo  $achat['valide'] == 1 ? "disabled" : "" ?>>Valider Tout </button>
            <!-- <i class="simple-icon-check" style="font-size: 15px;"></i> -->
          </a>
        <?php } ?>



      </div>
      <div class="separator mb-5"></div>
    </div>
  </div>
  <div class="row">
    <div class="col-xl-12 col-lg-12 mb-4">
      <div class="card h-100">
        <div class="card-body">
          <table class="table  responsive table-striped table-bordered table-hover" id="datatables">
            <thead>
              <tr>
                <th scope="col" width="1px">Id</th>
                <th scope="col">Produit</th>
                <th scope="col">Dépot</th>
                <th> Prix</th>
                <th scope="col" style='width:170px;'> Qte</th>
                <th scope="col"> Qte*Prix</th>
                <?php if ($valide) { ?>
                  <th scope="col"> Date Validation</th>
                <?php } ?>
                <th scope="col"> Action</th>
              </tr>
            </thead>
            <tbody>
              <?php
              $total = 0;
              foreach ($data as $ligne) {
                ?>
                <tr id="<?php echo $ligne->id_detail; ?>">
                  <td>
                    <?php echo $ligne->id_detail; ?>
                  </td>
                  <td id="<?php echo $ligne->id_produit; ?>">
                    <?php echo $ligne->designation; ?>
                  </td>
                  <td>
                    <?php echo $ligne->depot ?>
                  </td>
                  <td style="text-align:right;">
                    <label>
                      <?php echo number_format($ligne->prix_produit, 2, '.', 3); ?>
                    </label> <input type='text' value="<?php echo number_format($ligne->prix_produit, 2, '.', 3); ?>" />
                  </td>
                  <td><label>
                      <?php echo $ligne->qte_achete; ?>
                    </label><input style='width:80px;' type='text' value="<?php echo $ligne->qte_achete; ?>" />
                  </td>
                  <td style="text-align:right;" width="90">
                    <?php echo number_format($ligne->qte_achete * $ligne->prix_produit, 2, '.', '');
                    $total += $ligne->qte_achete * $ligne->prix_produit;
                    ?> &nbsp;&nbsp;
                  </td>
                  <?php if ($valide) { ?>
                    <td class="date_validation">
                      <?php

                      // debug($ligne) ; 
                      if ($ligne->valide) {
                        echo $ligne->date_validation;
                      }
                      ?>
                    </td>
                  <?php } ?>
                  <td>
                    <?php if (auth::user()['privilege'] == 'Admin' && !$valide) { ?>
                      <a id="<?php echo $ligne->id_produit ?>" class="badge badge-danger mb-2 delete"
                        data-id="<?php echo $ligne->id_detail; ?>" style="color: white;cursor: pointer;" title="Supprimer"
                        href='javascript:void(0)'>
                        <i class="simple-icon-trash" style="font-size: 15px;"></i>
                      </a>
                      <a class="badge badge-warning mb-2 updatee " data-id="<?php echo $ligne->id_detail; ?>"
                        style="color: white;cursor: pointer;" title="Modifier" href="javascript:void(0)">
                        <i class="iconsmind-Pen-5" style="font-size: 15px;"> </i>
                      </a>
                    <?php } ?>
                    <?php if ($valide): ?>
                      <a class="badge  mb-2 <?php echo $ligne->valide  ? "badge-secondary" : "badge-success valide_detail_achat" ?>"

                        style="color: white;cursor: pointer;"
                        title="<?php echo $ligne->valide == 1 ? "commande validé" : "valider la commande" ?>"
                        type="button" 
                        id="btn_valide_<?php echo $ligne->id_detail; ?>" data-id="<?php echo $ligne->id_detail; ?>">
                        <i class="simple-icon-check" style="font-size: 15px;"></i>
                      </a>
                    <?php endif; ?>
                  </td>
                </tr>
              <?php } ?>
            </tbody>
          </table>
          <br>
          <h1 id="total">Total :
            <?php echo number_format($total, 2, '.', '') ?> DH
          </h1>
        </div>
      </div>
    </div>
  </div>
</div>
<script>

// 
// -------------------------------------------------------------------------------------------------------- Valider achat ---------------------------------------------------------------------------------------------------------
  $('body').on("click", ".valide_achat", function () {

    let id = $(this).attr('data-id');

    // document.getElementById('btn_valide_' + id).style.display = 'none';
    $('.valide_achat button ').attr('disabled', 'true')
    // $('.valide_detail_achat').removeClass("badge-success url notlink").addClass("badge-secondary");


    // Initialize Datepicker
    $("#datepicker").datepicker();

    // Get the current date using jQuery UI Datepicker's formatDate
    var currentDate = new Date();

    // Format the date as a string (e.g., "YYYY-MM-DD")
    var formattedDate = currentDate.getFullYear() + '-' +
      ('0' + (currentDate.getMonth() + 1)).slice(-2) + '-' +
      ('0' + currentDate.getDate()).slice(-2);
      console.log(formattedDate) ;



    $.ajax({
      type: "POST",
      url: "<?php echo BASE_URL . 'views/achat/controle.php' ?>",
      data: {
        act: 'valide_achat',
        id: id
      },
      dataType: 'text',
      success: function (data) {
        console.log(data);
        swal(
          'Validation achat',
          'l\'achat N°' + id + ' a ete bien validé',
          'success'
        ).then((result) => {
          location.reload();
        });
      }
    });
  });

//
// ----------------------------------------------------------------------------- valider détail achat ------------------------------------------------------------------------------------- 
  $('body').on("click", ".valide_detail_achat", function () {
    let id = $(this).attr('data-id');
    // document.getElementById('btn_valide_' + id).style.display = 'none';
    $.ajax({
      type: "POST",
      url: "<?php echo BASE_URL . 'views/detail_achat/controle.php' ?>",
      data: {
        act: 'valide_detail_achat',
        id: id
      },
      dataType: 'text',
      success: function (data) {
        swal(
          'Validation detail achat',
          'Detail achat N°' + id + ' a ete bien validé',
          'success'
        ).then((result) => {
          location.reload();
        });
      }
    });
  });
</script>
<script type="text/javascript">
  $(document).ready(function () {
    $("input.datepicker").datepicker({
      format: 'yyyy-mm-dd',
      templates: {
        leftArrow: '<i class="simple-icon-arrow-left"></i>',
        rightArrow: '<i class="simple-icon-arrow-right"></i>'
      }
    })
    $('#datatables').dataTable({
      order: [
        [0, "desc"]
      ],
      dom: 'Bfrtip',
      buttons: [{
        extend: 'excelHtml5',
        title: "liste des achats N° <?php echo $id ?>",
        exportOptions: {
          columns: [0, 1, 2, 3, 4]
        }
      },
      {
        extend: 'pdfHtml5',
        title: "liste des achats N° <?php echo $id ?>",
        exportOptions: {
          columns: [0, 1, 2, 3, 4,]
        }
      },
      {
        extend: 'csvHtml5',
        title: "liste des achats N° <?php echo $id ?>",
        exportOptions: {
          columns: [0, 1, 2, 3, 4,]
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
      drawCallback: function () {
        $($(".dataTables_wrapper .pagination li:first-of-type")).find("a").addClass("prev"),
          $($(".dataTables_wrapper .pagination li:last-of-type")).find("a").addClass("next"),
          $(".dataTables_wrapper .pagination").addClass("pagination-sm")
      }
    });
    $('body').on("click", ".delete", function (event) {
      event.preventDefault();
      var btn = $(this);
      swal({
        title: 'Êtes-vous sûr?',
        text: "Voulez vous vraiment Supprimer ce achat !",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Oui, Supprimer !'
      }).then((result) => {
        if (result.value) {
          $.ajax({
            type: "POST",
            url: "<?php echo BASE_URL . 'views/detail_achat/'; ?>controle.php",
            data: {
              act: "delete",
              id: btn.data('id'),
              id_produit: btn.attr('id')
            },
            success: function (data) {
              swal(
                'Supprimer',
                'achat a ete bien Supprimer',
                'success'
              ).then((result) => {
                btn.parents("td").parents("tr").remove();
              });
            }
          });
        }
      });
    });
    $('body').on("click", ".archive", function (event) {
      event.preventDefault();
      var btn = $(this);
      swal({
        title: 'Êtes-vous sûr?',
        text: "Voulez vous vraiment Archiver ce achat !!",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#145388',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Oui, Archiver!'
      }).then((result) => {
        if (result.value) {
          $.ajax({
            type: "POST",
            url: "<?php echo BASE_URL . 'views/detail_achat/'; ?>controle.php",
            data: {
              act: "archive",
              id: btn.data('id'),
              val: btn.data('arc')
            },
            success: function (data) {
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
    $('body').on("click", ".static", function (event) {
      event.preventDefault();
      var btn = $(this);
      $.ajax({
        type: "POST",
        url: "<?php echo BASE_URL . 'views/detail_achat/'; ?>controle.php",
        data: {
          act: "getName",
          id: btn.data('id')
        },
        success: function (datas) {
          var data = datas.split(';;;');
          $('#exampleModalRight .modal-title').html("Etat achat " + data[1]);
          $('#idstatic').val(data[0]);
        }
      });
    });
    $("#Staticform").on("submit", function (event) {
      event.preventDefault();
      var form = $(this);
      $.ajax({
        type: "POST",
        url: "<?php echo BASE_URL . 'views/detail_achat/'; ?>controle.php",
        data: new FormData(this),
        dataType: 'text', // what to expect back from the PHP script, if anything
        cache: false,
        contentType: false,
        processData: false,
        success: function (data) {
          $('#etatstatic').html(data);
        }
      });
    });
    $('#datatables tbody').on('click', '.updatee', function () {
      var value = $(this).data('id');
      $('#' + value).find("label").hide();
      $('#' + value).find("input[type='text']").show();
      $('#' + value).children("td:last").html("<input type='button' class='Applique'  value='Applique'data-id= '" + value + "' />");
    });
    $('#datatables tbody').on('click', '.Applique', function () {
      var value = $(this).data('id');
      var qte = $('#' + value).find("input[type='text']:eq(1)").val();
      var reste_stock = parseInt($('#qte' + value).html());
      //if (reste_stock >= qte) {
      var prix = $('#' + value).find("input[type='text']:eq(0)").val();
      alert("id_detail=" + value + "&id_achat=" + $('#id_achat').val() + "&prix_produit=" + prix + "&qte_achete=" + qte + "&id_produit=" + $('#' + value).children("td:eq(1)").attr('id') + "&qte_acheteh=" + $('#' + value).find("label:eq(1)").html())
      $.ajax({
        type: "POST",
        url: "<?php echo BASE_URL . 'views/detail_achat/'; ?>controle.php",
        data: "act=update_detail&id_detail=" + value + "&id_achat=" + $('#id_achat').val() + "&prix_produit=" + prix + "&qte_achete=" + qte + "&id_produit=" + $('#' + value).children("td:eq(1)").attr('id') + "&qte_acheteh=" + $('#' + value).find("label:eq(1)").html(),
        success: function (data) {
          $('#' + value).find("label:eq(0)").html($('#' + value).find("input[type='text']:eq(0)").val());
          $('#' + value).find("label:eq(1)").html($('#' + value).find("input[type='text']:eq(1)").val());
          $('#' + value).find("label:eq(1)").html($('#' + value).find("input[type='text']:eq(1)").val());
          $('#' + value).find("label").show();
          $('#' + value).find("input[type='text']").hide();
          $('#' + value).children("td:last").html(`<a class="badge badge-danger mb-2 delete" data-id="<?php echo $ligne->id_detail; ?>" style="color: white;cursor: pointer;" title="Supprimer" href='javascript:void(0)' >
                      <i class="simple-icon-trash" style="font-size: 15px;"></i>
                    </a>
                    <a class="badge badge-warning mb-2 updatee " data-id="<?php echo $ligne->id_detail; ?>" style="color: white;cursor: pointer;" title="Modifier"
                      href="javascript:void(0)">
                      <i class="iconsmind-Pen-5" style="font-size: 15px;"> </i>
                    </a>`);
          $('#' + value).children("td:eq(4)").html(parseFloat(prix) * parseFloat(qte));
          $('#qte' + value).html("");
          $('#total').html("Total : " + data + " DH");
        }
      });
    })
  });
</script>