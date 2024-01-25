<?php
if (isset($_POST['ajax'])) {
    include('../../evr.php');
}
$id = explode('?id=', $_SERVER["REQUEST_URI"])[1];
$vente =  new vente() ; 
$id_client = $vente->selectById($id)['id_client']  ; 
?>
<div class="container-fluid disable-text-selection">
    <div class="row">
        <div class="col-12">
            <div class="mb-2">
                <h1>Detail vente N° :
                    <?php echo $id ?>
                </h1>
                <div class="float-sm-right text-zero">
                    <button type="button" class="btn btn-success  url notlink"
                        data-url="detail_vente/index.php?id=<?php echo $id ?>"> <i
                            class="glyph-icon simple-icon-arrow-left"></i></button>
                </div>
            </div>
            <div class="separator mb-5"></div>
        </div>
    </div>
    <div class="row">
        <input type="hidden" id="id_client" name="id_client" value="<?php echo (int)$id_client ?>">
        <div class="col align-self-start">
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="mb-4">Ajouter Nouveau Produit </h5>
                    <form id="addform" method="post" name="form_produit" enctype="multipart/form-data">
                        <input type="hidden" name="act" value="insert">
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="rech"> Recherche Référence: </label>
                                <input type="text" class="form-control" style="border-color: red" id="rech">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="rech_designation"> Recherche Désignation: </label>
                                <input type="text" class="form-control" style="border-color: red" id="rech_designation">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-5">
                                <label for="id_categorie"> Categorie :</label>
                                <select class="form-control select2-single" name="id_categorie" id="id_categorie">
                                    <?php
                                    $categorie = new categorie();
                                    $categories = $categorie->selectAll();
                                    foreach ($categories as $row) {
                                        echo '<option value="' . $row->id_categorie . '">' . $row->nom . '</option>';
                                    } ?>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="id_produit"> Produit :</label>
                                <select class="form-control select2-single" name="id_produit" id="id_produit">
                                    <?php
                                    $depot = new depot();
                                    $res_depot = $depot->selectAll();
                                    foreach ($res_depot as $rep_depot) {
                                        ?>
                                        <optgroup label="<?php echo $rep_depot->nom; ?> ">
                                            <?php
                                            $produits = $depot->selectQuery("SELECT  id_produit,designation  FROM produit where   id_categorie=" . $categories[0]->id_categorie . " and   emplacement='" . $rep_depot->id . "' order by designation asc");
                                            foreach ($produits as $row) {
                                                echo '<option value="' . $row->id_produit . '">' . $row->designation . '</option>';
                                            } ?>
                                        </optgroup>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="form-group col-md-1">
                                <label for="reste_stock">Stock</label>
                                <span class="badge badge-danger mb-1" style=" display: block; margin-top: 10px;"
                                    id="reste_stock">0</span>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="id_depot"> Dépot :</label>
                                <?php
                                $depot = new depot();
                                $res_depot = $depot->selectAll();
                                ?>
                                <select class="form-control select2-single" name="id_depot" id="id_depot">
                                    <?php foreach ($res_depot as $d): ?>
                                        <option value="<?php echo $d->id ?>">
                                            <?php echo $d->nom ?>
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group col-md-3">
                                <label for="prix_produit">P.U</label>
                                <input type="text" name="prix_produit" id="prix_produit" class="form-control">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="remise">remise</label>
                                <input type="text" name="remise" id="remise" class="form-control" value="0">
                            </div>
                            <div class="form-group col-md-2">
                                <label for="qte_vendu">Qte</label>
                                <input type="text" name="qte_vendu" id="qte_vendu" class="form-control">
                            </div>
                            <div class="form-group col-md-2">
                                <label for="valunite">Unité</label>
                                <div class="d-flex flex-row">
                                    <input type="text" name="valunit" id="valunite" class="form-control " value="">
                                    <input type="text" name="unit" id="unite" class="form-control ml-3"
                                        placeholder="Kg ou M²...">
                                </div>
                            </div>
                            <div class="form-group col-md-3">
                                <button id="addProduct" type="button"
                                    class="btn btn-success default btn-lg btn-block  mr-1 "
                                    style="margin-top: 25px;">Ajouter</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $(".select2-single").select2({
            theme: "bootstrap",
            placeholder: "",
            maximumSelectionSize: 6,
            containerCssClass: ":all:"
        });
        $("#rech").keyup(function () {
            var id = $(this).val();
            $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL . 'views/detail_vente/'; ?>controle.php",
                data: {
                    act: "rech",
                    id: id
                },
                success: function (data) {
                    $('#id_produit').html(data);
                    $("#id_produit").change();
                }
            });
        });
        $("#rech_designation").keyup(function () {
            var designation = $(this).val();
            $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL . 'views/detail_vente/'; ?>controle.php",
                data: {
                    act: "rech_designation",
                    designation: designation
                },
                success: function (data) {
                    $('#id_produit').html(data);
                    $("#id_produit").change();
                }
            });
        });
        $("input.datepicker").datepicker({
            format: 'yyyy-mm-dd',
            templates: {
                leftArrow: '<i class="simple-icon-arrow-left"></i>',
                rightArrow: '<i class="simple-icon-arrow-right"></i>'
            }
        });
        // $("#id_categorie").change(function () {
        //     var id_categorie = $(this).val();
        //     $.ajax({
        //         type: "POST",
        //         url: "<?php echo BASE_URL . 'views/detail_vente/'; ?>controle.php",
        //         data: { act: "getproduit", id_categorie: id_categorie },
        //         success: function (data) {
        //             $('#id_produit').html(data);



        //             $('#id_produit').change();

                    

        //         }
        //     });
        // });
        // // getting product information after a change event 
        // $("#id_produit").change(function () {
        //     var id_produit = $(this).val();
        //     $.ajax({
        //         type: "POST",
        //         url: "<?php echo BASE_URL . 'views/detail_vente/'; ?>controle.php",
        //         data: { act: "getPrix", id_produit: id_produit },
        //         success: function (data) {
        //             var tab = data.split('/');
        //             $('#prix_produit').val(tab[0]);
        //             $('#reste_stock').html(tab[1]);
        //             let id_depot = $("#id_depot").val();

        //             if (id_depot != null) {
        //                 $.ajax({
        //                     type: "POST",
        //                     url: "<?php echo BASE_URL . 'views/vente/'; ?>controle.php",
        //                     dataType: 'json',
        //                     data: {
        //                         act: "getDepotQte",
        //                         id_produit: id_produit,
        //                         id_depot: id_depot
        //                     },
        //                     success: function (data) {
        //                         if (data) {
        //                             $('#reste_stock').html(data.qte);
        //                         } else {
        //                             $('#reste_stock').html('0.00');
        //                         }
        //                     }
        //                 });
        //             }
        //         }
        //     }
        //     );
        // });






        $("#id_categorie").change(function () {
      var id_categorie = $(this).val();
      $.ajax({
        type: "POST",
        url: "<?php echo BASE_URL . 'views/vente/'; ?>controle.php",
        data: {
          act: "getproduit",
          id_categorie: id_categorie,
        //   id_bon: $('#bon_commande').val()
        },
        success: function (data) {
          $('#id_produit').html(data);
          $('#id_produit option:eq(1)').prop('selected', true);
          let id_produit = $('#id_produit').val();
          console.log($("#id_client").val()) ; 
          if (id_produit != null) {
            $.ajax({
              type: "POST",
              url: "<?php echo BASE_URL . 'views/vente/'; ?>controle.php",
              dataType: 'json',
              data: {
                act: "getPrix",
                id_produit: id_produit,
                id_client: $("#id_client").val()
              },
              success: function (data) {
                
                var tab = data.val.split('/');
                $("#id_depot").html(data.depots);
                $('#prix_produit').val(tab[0]);
                $('#reste_stock').html(tab[1]);
                $('#unite2').val(tab[2]);
                $('#id_depot option:eq(0)').prop('selected', true);
                let id_depot = $("#id_depot").val();
                if (id_depot != null) {
                  $.ajax({
                    type: "POST",
                    url: "<?php echo BASE_URL . 'views/vente/'; ?>controle.php",
                    dataType: 'json',
                    data: {
                      act: "getDepotQte",
                      id_produit: id_produit,
                      id_depot: id_depot
                    },
                    success: function (data) {
                      if (data) {
                        $('#reste_stock').html(data.qte);
                      } else {
                        $('#reste_stock').html('0.00');
                      }
                    }
                  });
                }
              }
            });
          }
        }
      });
    });
    $("#id_produit").change(function () {
      var id_produit = $(this).val();
      $.ajax({
        type: "POST",
        url: "<?php echo BASE_URL . 'views/vente/'; ?>controle.php",
        dataType: 'json',
        data: {
          act: "getPrix",
          id_produit: id_produit,
          id_client: $("#id_client").val()
        },
        success: function (data) {
           
          var tab = data.val.split('/');
          $("#id_depot").html(data.depots);
          $('#prix_produit').val(tab[0]);
          $('#reste_stock').html(tab[1]);
          $('#unite2').val(tab[2]);
          $('#id_depot option:eq(0)').prop('selected', true);
          let id_depot = $("#id_depot").val();
          if (id_depot != null) {
            $.ajax({
              type: "POST",
              url: "<?php echo BASE_URL . 'views/vente/'; ?>controle.php",
              dataType: 'json',
              data: {
                act: "getDepotQte",
                id_produit: id_produit,
                id_depot: id_depot
              },
              success: function (data) {
                if (data) {
                  $('#reste_stock').html(data.qte);
                } else {
                  $('#reste_stock').html('0.00');
                }
              }
            });
          }
        }
      });
    });
















        $("#id_depot").change(function () {
            var id_depot = $(this).val();
            var id_produit = $('#id_produit').val();
            $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL . 'views/vente/'; ?>controle.php",
                dataType: 'json',
                data: {
                    act: "getDepotQte",
                    id_produit: id_produit,
                    id_depot: id_depot
                },
                success: function (data) {
                    if (data) {
                        $('#reste_stock').html(data.qte);
                    } else {
                        $('#reste_stock').html('0.00');
                    }
                }
            });
        });
        $("#addProduct").click(function () {
            var id_produit = $(this).val();
            $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL . 'views/detail_vente/'; ?>controle.php",
                data: {
                    act: "insert", id_produit: $("#id_produit").val(), prix_produit: $("#prix_produit").val(),
                    qte_vendu: $("#qte_vendu").val(), id: <?php echo $id ?>,
                    remise: $("#remise").val(),
                    unit: $("#unite").val(),
                    valunit: $("#valunite").val(),
                    id_depot: $("#id_depot").val()
                },
                success: function (data) {
                    if (data == "success") {
                        console.log(data);
                        swal(
                            'Ajouter',
                            'Produit a ete bien Ajouter',
                            'success'
                        ).then((result) => {
                            $.ajax({
                                method: 'POST',
                                data: { ajax: true },
                                url: `<?php echo BASE_URL . "views/detail_vente/index.php?id=" . $id; ?>`,
                                context: document.body,
                                success: function (data) {
                                    history.pushState({}, "", `<?php echo BASE_URL . "detail_vente/index.php?id=" . $id; ?>`);
                                    $("#main").html(data);
                                }
                            });
                        });
                    }
                    else {
                        $("#addProduct").append(` <div id="alert-danger" class="alert  alert-danger alert-dismissible fade show rounded mb-0" role="alert">
                                <strong>${data}</strong> 
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>`);
                    }
                }
            });
        });



        $("#qte_vendu").keyup(() => {
            $("#valunite").val($("#qte_vendu").val());
        })
    });
</script>