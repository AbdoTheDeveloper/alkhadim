<?php
if (isset($_POST['ajax'])) {
    include('../../evr.php');
}
$id = explode('?id=', $_SERVER["REQUEST_URI"])[1];
?>
<!-- <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'> -->
<div class="container-fluid disable-text-selection">
    <div class="row">
        <div class="col-12">
            <div class="mb-2">
                <h1>Pointage achat </h1>
                <div class="float-right text-zero">
                    <button type="button" class="btn btn-success  url notlink" data-url="detail_achat/index.php?id=<?php echo $id; ?>&valide=true"> <i class="glyph-icon simple-icon-arrow-left"></i></button>
                </div>
                <!-- <div class="float-sm-right text-zero">
            <button type="button" class="btn btn-success  url notlink" data-url="vente/index.php"> <i class="glyph-icon simple-icon-arrow-left"></i></button>
          </div> -->
            </div>
            <div class="separator mb-5"></div>
        </div>
    </div>
    <div class="row ">
        <div class="col align-self-start">
            <div class="card mb-4">
                <div class="card-body ">
                    <h5 class="mb-4">Valider l'achat</h5>
                    <form id="addform" method="post" name="form_produit" enctype="multipart/form-data">
                        <input type="hidden" name="act" value="editQuantity">
                        <input type="hidden" name="id_achat" id="id_achat" value=<?php echo $id ?>>
                        <input type="hidden" id="id_detail" value="" />
                        <div class="form-row">
                           

                            <div class="form-group col-md-3">
                                <label for="rech"> Recherche Référence: </label>
                                <input placeholder='Rechercher par référence' type="text" class="form-control" id="rech">
                            </div>
                           
                           
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <label for="id_produit"> Produit :</label>
                                <select class="form-control select2-single" name="id_produit" id="id_produit">
                                    <option value="produit recherché">produit recherché</option>
                                </select>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="qte_actuelle"> Quantité Achetée : </label>
                                <input placeholder="Quantité Achetée" read-only type="text" class="form-control" id="qte_actuelle">
                            </div>
                            <!-- <div class="form-group col-md-2">
                                <label for="nouvelle_quantité"> Nouvelle quantité : </label>
                                <input placeholder='Nouvelle quantté ' value= "1" id="new_quantity" name='new_quantity' type="text"
                                    class="form-control" id="new quantity">
                            </div> -->
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-1">
                                <button id="updateProductQuantity" type="button" class="btn btn-primary default d-flex justify-content-center align-items-center btn-lg default btn-block valider mr-1 " style="margin-top: 31px">Valider</button>
                            </div>
                        </div>
                </div>
                <input type="hidden" id="access_add" value="1">
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">
    $(document).ready(function() {



        // =========================================================================== Rehercher produit acheté par référence ===========================================================================



        $("#rech").keyup(function() {
            var id_achat = $('#id_achat').val();
            var id = $(this).val().trim();
            if (id == ""  ) {
                $('#id_produit').html(
                    "<option>produit recherché</option>"
                );
                $('#qte_actuelle').val('');
                $("#select2-id_produit-container").css('color', 'black')
            }
            if (id.trim() != "") {
                $.ajax({
                    type: "POST",
                    url: "<?php echo BASE_URL . 'views/achat/'; ?>controle.php",
                    data: {
                        act: "get_produit_achtee",
                        id: id,
                        id_achat: id_achat
                    },
                    success: function(data) {
                        if (data.trim() != "error") {
                            $('#id_produit').html(data);
                            $("#id_produit").change();
                        } else {
                            $('#id_produit').html(
                                "<option>Produit pas trouvé dans cet achat</option>"
                            );
                            $("#select2-id_produit-container").css('color', 'red')

                        }
                    },
                    error: function(data) {}
                });
            }
        });


        // ================================================================= Rehercher produit acheté par Désignation ===============================================================================================
        

        
        $("#id_produit").change(function() {
            var id_achat = $('#id_achat').val();
            var id_produit = $(this).val();
            $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL . 'views/achat/'; ?>controle.php", 
                dadaType : "JSON" ,
                data: {
                    act: "getAcheteQte",
                    id_produit: id_produit,
                    id_achat: id_achat
                },
                success: function(data) { 
                    data = JSON.parse(data) ; 
                    if (data) {
                        $('#qte_actuelle').val(data[0].qte);
                        $('#id_detail').val(data[0].id_detail);
                    } else {
                        $('#qte_actuelle').val('0');
                    }
                }
            });
        });
    });
    //  Attaching the update_quantity function to the keydown event triggered by the Enter key 
    
    $(window).keypress((e) => {
        if (e.key == 'Enter') {
            validate_achat_article();
        }
    });
    //  Attaching the update_quantity function to the mousedown event triggerd by the button element with classname  = valider 
    
    $('.valider').click(validate_achat_article);
    // update quantity function 


    function validate_achat_article() {
        // var id_achat = $('#id_achat').val();
        let id_produit = $('#id_produit').val();
        var id = $('#id_detail').val();
        var quantity_to_validate  =  $('#qte_actuelle').val();
        if (id_produit != 'produit recherché' && id && quantity_to_validate) {
            // swal({
            //     title: 'Enregistrer',
            //     text: 'voulez vous vraiment modifier la quantité ',
            //     type: 'warning',
            //     showCancelButton: true,
            //     confirmButtonText: 'Oui, Modifier !'
            // })
            $.ajax({
                type: 'POST',
                url: "<?php echo BASE_URL . 'views/detail_achat/'; ?>controle.php",
                data: {
                    act: 'valide_detail_achat',
                    id: id , 
                    qte_a_valider : quantity_to_validate
                },
                success: function(data) {
                    swal(
                        `${data} Atricle ` + id_produit,
                        'l\'achat N°' + id + ' a ete bien validé',
                        'success'
                    ).then((result) => {
                        location.reload();
                    });
                }
            })
        }
    }

</script>