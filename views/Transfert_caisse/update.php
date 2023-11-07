  <?php
if (isset($_POST['ajax'])) {
include('../../evr.php');
}


$transfert_caisse=new transfert_caisse();
$id = explode('?id=',$_SERVER["REQUEST_URI"]);

$oldvalue=$transfert_caisse->selectById($id[1]);


?>

<div class="container-fluid disable-text-selection">
<div class="row">
        <div class="col-12">
            <div class="mb-2">
                <h1>Transfert caisse </h1>
                
                
            </div>
            
            <div class="separator mb-5"></div>
        </div>
    </div>

    <div class="row">
        <div class="col align-self-start">
  <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="mb-4">Modification transfertcaisse</h5>

                          <form id="addform" method="post" name="form_transfert_caisse" enctype="multipart/form-data">
                                    <input type="hidden" name="act" value="update">
                                     <input type="hidden" name="id" value="<?php echo $id[1] ;?>">
                                    <div class="form-row">
                         <div class="form-group col-md-4" >
                                                <label for="designation">Désignation</label>
                                                <input name="designation" type="text" class="form-control" id="designation"  placeholder="Désignation transfert_caisse" value="<?php echo $oldvalue['designation'] ?>">
                                            </div>
                                            
                                            <div class="form-group col-md-4">
                                                <label for="mode_reg">Mode de r&eacute;glement : </label>
                                                <select name="mode_reg" class="form-control" id="mode_reg">
                                                   
                                                    <option value=""> Choix</option>
                                                    <option value="débit" <?php echo $oldvalue['type_reg'] == 'effet' ? 'selected' : '' ?> > Effet</option>
                                                    <option value="crédit" <?php echo $oldvalue['type_reg'] == 'cheque' ? 'selected' : '' ?> > Chèque</option>                                               
                                                    <option value="crédit" <?php echo $oldvalue['type_reg'] == 'espece' ? 'selected' : '' ?> > Espèce</option>
                                                    </select> 
                                            </div>
                           
                                            <!-- <div class="form-group col-md-4">
                                                <label for="montant" class="col-form-label">Montant</label>
                                                <input type="text" class="form-control" id="montant" placeholder="Montant" name="montant" value="<?php echo $oldvalue['montant'] ?>">
                                            </div> -->

                                            <div class="form-group col-md-4">
                                                <label for="date_transfert_caisse">Date transfert_caisse</label>
                                                <input name="date_transfert_caisse" type="text"  class="form-control  datepicker" placeholder="2019-01-03" value="<?php echo $oldvalue['date_transfert_caisse'] ?>"/>
                                            </div>

                                            

                                            <div class="form-group mb-10 col-md-4">
                                                <label>Piéce jointe</label>
                                                <div class="input-group">
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input" id="image" name="image">
                                                        <label class="custom-file-label" for="inputGroupFile04">Choisir piéce jointe transfert caisse</label>
                                                    </div>
                                                </div>
                                            </div>

</div>
                                            
                                    <div class="form-group">
                                        <label for="remarque"> Remarque : </label>
                                        <textarea  class="form-control" name="remarque" id="remarque"
                                        ><?php echo $oldvalue['remarque'] ;?></textarea>
                                    </div>
                                    
                                    <div class="float-sm-right text-zero">
                                        <button type="submit" class="btn btn-primary btn-lg  mr-1 " >Enregistrer</button>
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






      


    $("#id_categorie").change(function() {
   

      
            var id_categorie = $(this).val();
            $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL.'views/transfert_caisse/' ;?>controle.php",
                data: {act:"getcat",id_categorie: id_categorie},
                success: function (data) {
                   
                    $('#code_bar').val(data);
                }
            });
  
});


    $("#addform" ).on( "submit", function( event ) {
             event.preventDefault();

             var form = $( this );
             $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL.'views/transfert_caisse/' ;?>controle.php",
                data: new FormData(this),
                dataType: 'text',  // what to expect back from the PHP script, if anything
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {

               if (data.indexOf("success")>=0) {
                   
                    swal(
                      'Modification',
                      'transfert_caisse a ete bien modifie',
                      'success'
                    ).then((result) => {
                    $.ajax({

                              method:'POST',
                              data: {ajax:true},
                              url: `<?php echo BASE_URL."views/transfert_caisse/index.php";?>`,
                              context: document.body,
                              success: function(data) { 
                                      history.pushState({},"",`<?php echo BASE_URL."transfert_caisse/index.php";?>` );
                                      $("#main").html( data );
                                }
                            });
                    });
                }
                else{

                     form.append(` <div id="alert-danger" class="alert  alert-danger alert-dismissible fade show rounded mb-0" role="alert">
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
