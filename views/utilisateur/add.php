  <?php
if (isset($_POST['ajax'])) {
include('../../evr.php');
}

?>

<div class="container-fluid disable-text-selection">
    <div class="row">
        <div class="col-12">
            <div class="mb-2">
                <h1>utilisateur </h1>
                
                
            </div>
            
            <div class="separator mb-5"></div>
        </div>
    </div>
    <div class="row">
        <div class="col align-self-start">
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="mb-4">Ajouter Nouveau utilisateur</h5>
                    <form id="addform" method="post" name="form_produit" enctype="multipart/form-data">
                        <input type="hidden" name="act" value="insert">

                        <div class="form-row">
                            <div class="form-group col-md-4 client">
                                <label for="nom"> Nom :</label>
                                <input type="text" class="form-control" id="nom" name="nom" >
                              </div>
                              <div class="form-group col-md-4 client">
                                <label for="nom"> Telephone :</label>
                                <input type="text" class="form-control" id="tele" name="tele" >
                              </div>
                              <div class="form-group col-md-4 client">
                                <label for="nom"> Email :</label>
                                <input type="text" class="form-control" id="email" name="email" >
                              </div>

                               </div>
                                <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="login"> Login :</label>
                                <input type="text" class="form-control" id="login" name="login" >
                            </div>
                            <div class="form-group col-md-4">
                                <label for="pwd">Password :</label>
                                <input type="text" class="form-control" id="pwd" name="pwd" >
                            </div>
                            <div class="form-group col-md-4">
                                <label for="nom_prenom_ar">Privilege :</label>
                                <select  class="form-control" name="privilege">
                                    <option value="Admin"> Admin</option>
                                    <option value="Vendeur">Vendeur</option>
                                    <option value="User+"> User+</option>
                                    <option value="User">  User</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">

                            <div class="form-group col-md-2">
                                <label for="remarque">Client :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="client1" value="1" checked="" name="client" class="custom-control-input">
                                        <label class="custom-control-label"  for="client1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                        <input type="radio" id="client2" value="0" name="client" class="custom-control-input">
                                        <label class="custom-control-label"  for="client2">Non</label>
                                        
                                    </div>
                                </div>
                            </div>
                             <div class="form-group col-md-2">
                                <label for="remarque">Fournisseur :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="fournisseur1" value="1" checked="" name="fournisseur" class="custom-control-input">
                                        <label class="custom-control-label"  for="fournisseur1">oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                        <input type="radio" id="fournisseur2" value="0" name="fournisseur" class="custom-control-input">
                                        <label class="custom-control-label"  for="fournisseur2">Non</label>
                                        
                                    </div>
                                </div>
                            </div>
                             <div class="form-group col-md-2">
                                <label for="remarque">Achat :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="achat1" value="1" checked="" name="achat" class="custom-control-input">
                                        <label class="custom-control-label"  for="achat1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                        <input type="radio" id="achat2" value="0" name="achat" class="custom-control-input">
                                        <label class="custom-control-label"  for="achat2">Non</label>
                                        
                                    </div>
                                </div>
                            </div>
                             <div class="form-group col-md-2">
                                <label for="remarque">Vente :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="vente1" value="1" checked="" name="vente" class="custom-control-input">
                                        <label class="custom-control-label"  for="vente1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                        <input type="radio" id="vente2" value="0" name="vente" class="custom-control-input">
                                        <label class="custom-control-label"  for="vente2">Non</label>
                                        
                                    </div>
                                </div>
                            </div>
                             <div class="form-group col-md-2">
                                <label for="remarque">Produit :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="produit1" value="1" checked="" name="produit" class="custom-control-input">
                                        <label class="custom-control-label"  for="produit1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                        <input type="radio" id="produit2" value="0" name="produit" class="custom-control-input">
                                        <label class="custom-control-label"  for="produit2">Non</label>
                                        
                                  
                                </div>
                                </div>
                            </div>
                             <div class="form-group col-md-2">
                                <label for="remarque">Avoir :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="avoir1" value="1" checked="" name="avoir" class="custom-control-input">
                                        <label class="custom-control-label"  for="avoir1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                        <input type="radio" id="avoir2" value="0" name="avoir" class="custom-control-input">
                                        <label class="custom-control-label"  for="avoir2">Non</label>
                                        
                                    </div>
                                </div>
                            </div>
                             <div class="form-group col-md-2">
                                <label for="remarque">Charge :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="charge1" value="1" checked="" name="charge" class="custom-control-input">
                                        <label class="custom-control-label"  for="charge1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                        <input type="radio" id="charge2" value="0" name="charge" class="custom-control-input">
                                        <label class="custom-control-label"  for="charge2">Non</label>
                                        
                                    </div>
                                </div>
                            </div>


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
    
    $("#addform" ).on( "submit", function( event ) {
             event.preventDefault();

             var form = $( this );
             $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL.'views/utilisateur/' ;?>controle.php",
                data: new FormData(this),
                dataType: 'text',  
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {

                if (data.indexOf("success")>=0) {
                   
                    swal(
                      'Ajouter',
                      'utilisateur a ete bien Ajouter',
                      'success'
                    ).then((result) => {
                    $.ajax({

                              method:'POST',
                              data: {ajax:true},
                              url: `<?php echo BASE_URL."views/utilisateur/index.php"?>`,
                              context: document.body,
                              success: function(data) { 
                                      history.pushState({},"",`<?php echo BASE_URL."utilisateur/index.php"?>` );
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
