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
$charges = connexion::getConnexion()->query("select (sum(c.montant) * c.cout_device ) as total_charge  from charge c where id_achat = $id")->fetchAll(PDO::FETCH_OBJ)[0];
$total_prix_produit = connexion::getConnexion()->query("select (sum(da.prix_produit) * da.cout_device) as total_prix_produit from detail_achat da where id_achat  = $id  ")->fetchAll(PDO::FETCH_OBJ)[0];
$data = $detail_achat->selectAllValide($id);
$achat = $achat->selectById($id);
// debug($data[0]) ; 
?>
<div class="container-fluid disable-text-selection">
  <div class="row">
    <div class="col-12">
      <div class="mb-2">
        <h1>Detail achat N° :
          <?php echo $id ?>
        </h1>
        <input type="hidden" id="id_achat" value="<?php echo $id ?>" />
        <div class="float-sm-right text-zero mb-1">
          <button type="button" class="btn btn-primary  url notlink" data-url="achat/index.php"> <i
              class="glyph-icon simple-icon-arrow-left"></i></button>
        </div>
        <?php if (!$valide) { ?>
          <div class="float-sm-right text-zero">
            <button type="button" class="btn btn-primary btn-lg  mr-1 url notlink"
              data-url="detail_achat/add.php?id=<?php echo $id ?>">AJOUTER</button>
          </div>
        <?php } ?>
        <?php if ($valide && $achat->valide == 0) { ?>
          <a class="mb-2 valide_achat float-sm-right text-zero" style="color: white;cursor: pointer;"
            title="Valide la commande" type="button" id="btn_valide_<?php echo $id; ?>" data-id="<?php echo $id; ?>">
            <button type="button" class="btn btn-primary btn-lg mr-1 ">Valider Tout </button>
            <!-- <i class="simple-icon-check" style="font-size: 15px;"></i> -->
          </a>
        <?php } ?>
        <?php if ($valide && $achat->valide == 0) { ?>
          <div class="float-sm-right text-zero">
            <button type="button" class="btn btn-primary btn-lg  mr-1 url notlink"
              data-url="detail_achat/pointage.php?id=<?php echo $id ?>">Pointage</button>
          </div>
        <?php } ?>
      </div>
      <div class="separator mb-5"></div>
    </div>
  </div>
  <div class="row">
    <div class="col-xl-12 col-lg-12 mb-4">
      <div class="card h-100">
        <div class="card-body">
          <table class="table  responsive table-striped table-bordered table-hover" id="datatables_detail_achat">
            <thead>
              <tr>
                <th scope="col" width="1px">Id</th>
                <th scope="col">Produit</th>
                <th scope="col">Dépot</th>
                <th scope="col"> Prix</th>
                <th scope="col">Prix Revient </th>
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
                      <?php echo number_format($ligne->prix_produit, 2, '.', 3) . " " . $ligne->devise_produit; ?>
                    </label> <input type='text' value="<?php echo number_format($ligne->prix_produit, 2, '.', 3); ?>" />
                  </td>
                  <td style="text-align:right;">
                    <label>
                      <?php
                      // $pourcentage_prix_article = ($ligne->prix_produit * $ligne->montant_achat) / 100;
                      // // $montant = $total  
                      // $prix_revient = $ligne->prix_produit  + ($pourcentage_prix_article * ($ligne->charge_total * $ligne->cout_charge / $ligne->qte_total)) / 100;
                      $produit = new produit();
                      if ($charges->total_charge) {
                        $product_cost = $produit->calculateCostPricePercentage(
                          $ligne->prix_produit * $ligne->cout_device,
                          $charges->total_charge,
                          $total_prix_produit->total_prix_produit,
                          $ligne->qte_total
                        );
                      } else {
                        $product_cost = $ligne->prix_produit * $ligne->cout_device;
                      }
                      echo number_format($product_cost, 2, '.', 3); ?> DH
                    </label> <input type='text' class="product_cost"
                      value="<?php echo number_format($product_cost, 2, '.', 3); ?>" />
                  </td>
                  <td style="float:right"><label>
                      <?php echo $ligne->qte_achete; ?>
                    </label><input style='width:80px;' type='text' value="<?php echo $ligne->qte_achete; ?>" />
                  </td>
                  <td style="text-align:right;" width="90">
                    <?php echo number_format($ligne->qte_achete * $ligne->prix_produit, 2, '.', '') . " " . $ligne->devise_produit;
                    $total += $ligne->qte_achete * $ligne->prix_produit * $ligne->cout_device;
                    ?> &nbsp;&nbsp;
                  </td>
                  <?php if ($valide) { ?>
                    <td>
                      <?php
                      if ($ligne->valide) {
                        echo $ligne->date_validation;
                      }
                      ?>
                    </td>
                  <?php } ?>
                  <td>
                    <?php if ((auth::user()['privilege'] == 'Admin' || auth::user()['supprimer'] == 1 )  && !$valide) { ?>
                      <a id="<?php echo $ligne->id_produit ?>" class="badge badge-danger mb-2 delete"
                        data-id="<?php echo $ligne->id_detail; ?>" style="color: white;cursor: pointer;" title="Supprimer"
                        href='javascript:void(0)'>
                        <i class="simple-icon-trash" style="font-size: 15px;"></i>
                      </a>
                      <?php } ?>
                      <?php if ((auth::user()['privilege'] == 'Admin' || auth::user()['modifier'] == 1)  && !$valide) { ?>
                      <a class="badge badge-warning mb-2 updatee " data-id="<?php echo $ligne->id_detail; ?>"
                        style="color: white;cursor: pointer;" title="Modifier" href="javascript:void(0)">
                        <i class="iconsmind-Pen-5" style="font-size: 15px;"> </i>
                      </a>
                    <?php } ?>
                    <?php if ($valide): ?>
                      <a class="badge  mb-2   <?php echo !$ligne->valide ? 'badge-success valide_detail_achat ' : 'badge-secondary ' ?>"
                        title="<?php echo $ligne->valide ? 'commande validé ' : 'valider commande' ?>" type="button"
                        style="color: white;cursor: pointer;" id="btn_valide_<?php echo $ligne->detail; ?>"
                        data-id="<?php echo $ligne->id_detail; ?>">
                        <i class="simple-icon-check" style="font-size: 15px;"></i>
                      </a>
                    <?php endif; ?>
                    <?php if ($valide): ?>
                      <a class="badge  mb-2   <?php echo !$ligne->prix_revient ? 'badge-success cloturer' : 'badge-secondary ' ?>"
                        title="<?php echo $ligne->valide ? 'commande cloturé ' : 'cloturer commande' ?>" type="button"
                        style="color: white;cursor: pointer;" id="btn_valide_<?php echo $ligne->detail; ?>"
                        data-id="<?php echo $ligne->id_detail; ?>">
                        <!-- <i class="simple-icon-check" style="font-size: 15px;"></i> -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                          class="bi bi-bag-check-fill" viewBox="0 0 16 16">
                          <path fill-rule="evenodd"
                            d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0m-.646 5.354a.5.5 0 0 0-.708-.708L7.5 10.793 6.354 9.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z" />
                        </svg>
                      </a>
                    <?php endif; ?>
                  </td>
                </tr>
              <?php } ?>

            </tbody>
          </table>
          <br>
          <h1 id="total">Total Sans Charge :
            <?php echo number_format($total / $data[0]->cout_device, 2, '.', '') . " " . $data[0]->devise_produit ?>
          </h1>
          <br>
          <?php

          $id = explode('?id=', $_SERVER["REQUEST_URI"])[1];
          $charge = new charge();
          if ($id) {
            $data = [];
            $data = $charge->selectByIdAchat($id);
          } else {
            // $data = $charge->selectAll3(date('Y') . '-' . date('m'), 1);
          }
          ?>
          <div class="container-fluid disable-text-selection">
            <div class="row">
              <div class="col-12">
                <div class="mb-2">
                  <h1>Liste des charges d'achat : 
                  </h1>
                  <!-- <div class="float-sm-right text-zero">
          <button type="button" class="btn btn-primary btn-lg  mr-1 url notlink"
            data-url="charge_achat/add.php?id=<?php echo $id ?>">AJOUTER</button>
          <a target="_blank" class="btn btn-primary btn-lg  mr-1  "
            href="<?php echo BASE_URL . 'views/etat/etat_charge.php' ?>"> <i class="glyph-icon  iconsmind-Billing"></i>
            État charges </a>
          <div class="float-sm-right text-zero">
            <button type="button" class="btn btn-success  url notlink" data-url="achat/index.php"> <i
                class="glyph-icon simple-icon-arrow-left"></i></button>
          </div>
        </div> -->
                </div>
                <div class="separator mb-1"></div>
              </div>
            </div>
            <div class="row">
              <div class="col-xl-12 col-lg-12 mb-4">
                <div class="card h-100">
                  <div class="card-body">

                    <div id="results">
                      <table class="table  responsive table-striped table-bordered table-hover" id="datatables_charges_achat">
                        <thead>
                          <tr>
                            <th>NR°</th>
                            <th>Fournisseur</th>
                            <th>Num&egrave;ro</th>
                            <th>Designation</th>
                            <th>Date charge</th>
                            <th>Montant En Devise</th>
                            <th>Montant En Dh</th>
                            <th>Remarque</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          <?php
                          $total_montant = 0;
                          foreach ($data as $charge) {
                            // $sub_data = connexion::getConnexion()->query("select c.devise_produit , c.cout_device from charge c where c.id = $charge->id limit 1 ")->fetchAll(PDO::FETCH_OBJ);
                            ?>
                            <tr>
                              <td>
                                <?php echo $charge->id ?>
                              </td>
                              <td>
                                <?php
                                $c = new charge();
                                $fournisseur = $c->selectFournisseurbyIdCharge($charge->id_fournisseur);
                                if ($fournisseur)
                                  echo $fournisseur; ?>
                              </td>
                              <td>
                                <?php echo $charge->num_cheque ?>
                              </td>
                              <td>
                                <?php echo $charge->designation ?>
                              </td>
                              <td>
                                <?php echo $charge->date_charge ?>
                              </td>
                              <td>
                                <?php echo $charge->montant . " " . $charge->devise_produit; ?>
                              </td>
                              <td>
                                <?php echo $charge->montant * $charge->cout_device . " DH";
                                $total_montant += $charge->montant * $charge->cout_device; ?>
                              </td>
                              <td>
                                <?php echo $charge->remarque ?>
                              </td>
                              <td class="d-flex">
                                <?php if (auth::user()['privilege'] == 'Admin' ) { ?>
                                  <a class="badge badge-danger mb-2 mr-1 delete_charge" data-id="<?php echo $charge->id; ?>"
                                    style="color: white;cursor: pointer;" title="Supprimer" href='javascript:void(0)'>
                                    <i class="simple-icon-trash" style="font-size: 15px;"></i>
                                  </a>
                                <?php } ?>
                                <!-- <a class="badge badge-warning mb-2  url notlink"
                                  data-url="charge_achat/update.php?id=<?php echo $charge->id; ?>&id_achat=<?php echo $id; ?>&from_detail=true"
                                  style="color: white;cursor: pointer;" title="Modifier" href="javascript:void(0)">
                                  <i class="iconsmind-Pen-5" style="font-size: 15px;"> </i>
                                </a> -->
                                <?php if ($charge->image != '' || $charge->deux_image != '') {
                                  $img = $charge->image != '' ? $charge->image : $charge->deux_image; ?>
                                  <a class="badge badge-success " data-fancybox
                                    data-caption="<?php echo $charge->designation; ?> <br> Prix : <?php echo $charge->montant ?> DH"
                                    style="color: white;cursor: pointer;" title="<?php echo $charge->designation; ?>"
                                    href="<?php echo BASE_URL . 'upload/charge/' . $img; ?>">
                                    <i class="simple-icon-picture" style="font-size: 15px;"> </i>
                                  </a>
                                <?php } ?>
                              </td>
                            </tr>
                          <?php } ?>
                        </tbody>

                      </table>
                      <!-- <h1>Total  : <?php echo $total_montant; ?> DH</h1> -->
                    </div>

                  </div>
                </div>
              </div>
              <div>
              <h1 id="total">Total Charges :
                <?php
                if ($charges->total_charge) {
                  echo number_format($charges->total_charge, 2, '.', '');
                } else {
                  echo "0.00";
                } ?> DH
              </h1>
              <br>
              <h1 id="total">Total Avec Charge :
                <?php echo number_format($total + $charges->total_charge, 2, '.', '') ?> DH
              </h1>
              </div>
              

            </div>
          </div>
        </div>
      </div>
    </div>
    <script>
      $('body').on("click", ".valide_achat", function () {
        let id = $(this).attr('data-id');
        // document.getElementById('btn_valide_' + id).style.display = 'none';
        $.ajax({
          type: "POST",
          url: "<?php echo BASE_URL . 'views/achat/controle.php' ?>",
          data: {
            act: 'valide_achat',
            id: id
          },
          dataType: 'text',
          success: function (data) {
            swal(
              `${data} achat`,
              'l\'achat N°' + id + ' a ete bien validé',
              'success'
            ).then((result) => {
              location.reload();
            });
          }
        });
      });
      // /======================================================================================================= Valider Detail Achat ============================================================================================== 
      $('body').on("click", ".valide_detail_achat", function (e) {
        // e.preventDefault() ; 
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
              'Validation achat',
              'l\'achat N°' + id + ' a ete bien validé',
              'success'
            ).then((result) => {
              location.reload();
            });
          }
        });
      });

      //  cloturage detail achat

      $('body').on("click", ".cloturer", function (e) {
        // e.preventDefault() ; 
        let id = $(this).attr('data-id');
        let prix_revient = $('.product_cost').val();
        // document.getElementById('btn_valide_' + id).style.display = 'none';
        Swal.fire({
          title: 'Voulez vous vraiment cloturer le commande ?',
          text: 'cet action ne peut pas etre altéré',
          icon: 'warning',
          showCancelButton: true,
          confirmButtonText: 'Yes',
          cancelButtonText: 'No',
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33'
        }).then((result) => {

          if (result.value) {
            $.ajax({
              type: "POST",
              url: "<?php echo BASE_URL . 'views/detail_achat/controle.php' ?>",
              data: {
                act: 'cloturer',
                id: id,
                prix_revient: prix_revient
              },
              dataType: 'text',
              success: function (data) {
                swal(
                  `${data} achat`,
                  'l\'achat N°' + id + ' a ete bien validé',
                  'success'
                ).then((result) => {
                  location.reload();
                });
              }
            });
          }

        })


      });
    </script>
    <script type="text/javascript">



// Delete charge
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

//    La configuration du datatable plugin du table pour la Table detail achat  
      $(document).ready(function () {
        $("input.datepicker").datepicker({
          format: 'yyyy-mm-dd',
          templates: {
            leftArrow: '<i class="simple-icon-arrow-left"></i>',
            rightArrow: '<i class="simple-icon-arrow-right"></i>'
          }
        })
        $('#datatables_detail_achat').dataTable({
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
        
//       La configuration du datatable plugin du table pour la Table charges achat #


$('#datatables_charges_achat').dataTable({
          order: [
            [0, "desc"]
          ],
          dom: 'Bfrtip',
          buttons:[], 
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
        




        $('body').on("click", ".delete_charge", function (event) {
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
                url: "<?php echo BASE_URL . 'views/charge_achat/'; ?>controle.php",
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
                    location.reload();
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
        $('#datatables_detail_achat tbody').on('click', '.updatee', function () {
          var value = $(this).data('id');
          $('#' + value).find("label").hide();
          $('#' + value).find("input[type='text']:not('.product_cost')").show();
          $('#' + value).children("td:last").html("<input type='button' class='Applique'  value='Applique'data-id= '" + value + "' />");
        });
        $('#datatables_detail_achat tbody').on('click', '.Applique', function () {
          var value = $(this).data('id');
          var qte = $('#' + value).find("input[type='text']:eq(2)").val();
          var reste_stock = parseInt($('#qte' + value).html());
          //if (reste_stock >= qte) {
          var prix = $('#' + value).find("input[type='text']:eq(0)").val();
          alert("id_detail=" + value + "&id_achat=" + $('#id_achat').val() + "&prix_produit=" + prix + "&qte_achete=" + qte + "&id_produit=" + $('#' + value).children("td:eq(1)").attr('id') + "&qte_acheteh=" +
            $('#' + value).find("label:eq(1)").html())
          $.ajax({
            type: "POST",
            url: "<?php echo BASE_URL . 'views/detail_achat/'; ?>controle.php",
            data: "act=update_detail&id_detail=" + value + "&id_achat=" + $('#id_achat').val() +
              "&prix_produit=" + prix + "&qte_achete=" + qte + "&id_produit=" + $('#' + value).children("td:eq(1)").attr('id') + "&qte_acheteh=" + $('#' + value).find("label:eq(1)").html(),
            success: function (data) {
              $('#' + value).find("label:eq(0)").html($('#' + value).find("input[type='text']:eq(0)").val());
              $('#' + value).find("label:eq(2)").html($('#' + value).find("input[type='text']:eq(2)").val());
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
              $('#' + value).children("td:eq(6)").html(parseFloat(prix) * parseFloat(qte));
              $('#qte' + value).html("");
              $('#total').html("Total : " + data);
              location.reload();
            }
          });
        })
      });
    </script>