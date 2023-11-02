  <?php
if (isset($_POST['ajax'])) {
include('../../evr.php');
}


 $id = explode('?id=',$_SERVER["REQUEST_URI"])[1];
?>

<div class="container-fluid disable-text-selection">
    <div class="row">
        <div class="col-12">
            <div class="mb-2">
                <h1>Detail detail_avoir N° : <?php echo $id ?> </h1>
            </div>
            
            <div class="separator mb-5"></div>
        </div>
    </div>
    <div class="row">
        <div class="col align-self-start">
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="mb-4">Ajouter Nouveau Produit </h5>
                    <form id="addform" method="post" name="form_produit" enctype="multipart/form-data">
                          <form id="addform" method="post" name="form_produit" enctype="multipart/form-data">
                        <input type="hidden" name="act" value="insert">
                        
                        <div class="form-row">
                            <div class="form-group col-md-5">
                                <label for="id_categorie"> Categorie :</label>
                                <select class="form-control select2-single" name="id_categorie" id="id_categorie" >
                                    
                                    <?php
                                    $categorie = new categorie();
                                    $categories = $categorie->selectAll();
                                    foreach ($categories as $row) {
                                    echo '<option value="'.$row->id_categorie.'">'.$row->nom.'</option>';
                                    }?>
                                    
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="id_produit"> Produit :</label>
                                <select class="form-control select2-single" name="id_produit" id="id_produit" >
                                    
                                    <?php
                                    $depot=new depot();
                                    $res_depot=$depot->selectAll();
                                    foreach($res_depot as $rep_depot){
                                    ?>
                                    <optgroup label="<?php echo $rep_depot->nom; ?> ">
                                        <?php
                                        $produits=$depot->selectQuery("SELECT  id_produit,designation  FROM produit where   id_categorie=".$categories[0]->id_categorie." and   emplacement='".$rep_depot->id."' order by designation asc");
                                        foreach ($produits as $row) {
                                        echo '<option value="'.$row->id_produit.'">'.$row->designation.'</option>';
                                        }?>
                                    </optgroup>
                                    <?php } ?>
                                    
                                </select>
                            </div>
                            <div class="form-group col-md-1">
                                <label for="reste_stock">Stock</label>
                                <span class="badge badge-danger mb-1" style=" display: block; margin-top: 10px;" id="reste_stock">0</span>
                                
                            </div>
                            <div class="form-group col-md-3">
                                <label for="prix_produit">P.U</label>
                                <input type="text" name="prix_produit" id="prix_produit" class="form-control" value="0">
                                
                            </div>
                            <div class="form-group col-md-3">
                                <label for="remise">remise</label>
                                <input type="text" name="remise" id="remise" class="form-control" value="0">
                                
                            </div>
                            <div class="form-group col-md-3">
                                <label for="qte_rendu">Qte</label>
                                <input type="text" name="qte_rendu" id="qte_rendu" class="form-control" value="0">
                                
                            </div>
                            <div class="form-group col-md-3">
                                <button id="addProduct" type="button" class="btn btn-success default btn-lg btn-block  mr-1 " style="margin-top: 25px;">Ajouter</button>
                            </div>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">


    $( document ).ready(function() {

        $(".select2-single").select2({
            theme: "bootstrap",
            placeholder: "",
            maximumSelectionSize: 6,
            containerCssClass: ":all:"
        });
        $("input.datepicker").datepicker({
                     format: 'yyyy-mm-dd',
                     templates: {
                     leftArrow: '<i class="simple-icon-arrow-left"></i>',
                     rightArrow: '<i class="simple-icon-arrow-right"></i>'
                    }
                });
            $("#id_categorie").change(function() {
   

            
            var id_categorie = $(this).val();
            $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL.'views/detail_avoir/' ;?>controle.php",
                data: {act:"getproduit",id_categorie: id_categorie},
                success: function (data) {
                  
                    $('#id_produit').html(data);
                }
            });
  
                });
              $("#id_produit").change(function() {
   

            
            var id_produit = $(this).val();
            $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL.'views/detail_avoir/' ;?>controle.php",
                data: {act:"getPrix",id_produit: id_produit},
                success: function (data) {
                   var tab=data.split('/');
                   $('#prix_produit').val(tab[0]);
                    $('#reste_stock').html(tab[1]);
                }
            });
  
            });

                 $("#addProduct").click(function() {
   


            var id_produit = $(this).val();
            $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL.'views/detail_avoir/' ;?>controle.php",
                data: {act:"insert",id_produit: $("#id_produit").val() ,prix_produit: $("#prix_produit").val(), qte_rendu: $("#qte_rendu").val(),id_avoir:<?php echo $id ?>,remise: $("#remise").val() ,},
                success: function (data) {
                   if (data=="success") {
               
                   swal(
                      'Ajouter',
                      'Produit a ete bien Ajouter',
                      'success'
                    ).then((result) => {
                    $.ajax({

                              method:'POST',
                              data: {ajax:true},
                              url: `<?php echo BASE_URL."views/detail_avoir/index.php?id=".$id;?>`,
                              context: document.body,
                              success: function(data) { 
                                      history.pushState({},"",`<?php echo BASE_URL."detail_avoir/index.php?id=".$id;?>` );
                                      $("#main").html( data );
                                }
                            });
                    });
                }
                else{

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

    
  
                


});
</script>
