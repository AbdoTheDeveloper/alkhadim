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
                <div class="float-sm-right text-zero">
                    <button type="button" class="btn btn-success  url notlink" data-url="utilisateur/index.php"> <i class="glyph-icon simple-icon-arrow-left"></i></button>
                </div>

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
                                <input type="text" class="form-control" id="nom" name="nom">
                            </div>
                            <div class="form-group col-md-4 client">
                                <label for="nom"> Telephone :</label>
                                <input type="text" class="form-control" id="tele" name="tele">
                            </div>
                            <div class="form-group col-md-4 client">
                                <label for="nom"> Email :</label>
                                <input type="text" class="form-control" id="email" name="email">
                            </div>

                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="login"> Login :</label>
                                <input type="text" class="form-control" id="login" name="login">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="pwd">Password :</label>
                                <input type="text" class="form-control" id="pwd" name="pwd">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="nom_prenom_ar">Privilege :</label>
                                <select class="form-control" name="privilege">
                                    <?php if(auth::user()['privilege'] == "Admin"){ ?>
                                    <option value="Admin"> Admin</option>
                                    <option value="User+"> User+</option>
                                    <?php }?>
                                    <option value="Vendeur">Vendeur</option>
                                    <option value="User"> User</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="id_zone">Zone :</label>
                                <select class="form-control" name="id_zone">
                                    <?php
                                    $zone = new zone();
                                    $zones = $zone->selectChamps("*", '', '', 'libelle', 'asc');
                                    foreach ($zones as $row) {
                                        echo '<option value="' . $row->id_zone . '">' . $row->libelle . '</option>';
                                    } ?>
                                </select>
                            </div>
                        </div>
                        <br>
                        <?php if (auth::user()['privilege'] == "Admin" ) { ?>
                            <h1>Priviléges Opérations</h1>
                            <div class="form-row">
                                
                            <div class="form-group col-md-2">
                                    <label for="remarque">Utilisateur :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="utilisateur1" value="1" name="utilisateur" class="custom-control-input">
                                            <label class="custom-control-label" for="client1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="utilisateur2" value="0" checked="true" name="utilisateur" class="custom-control-input">
                                            <label class="custom-control-label" for="client2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Client :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="client1" value="1" name="client" class="custom-control-input">
                                            <label class="custom-control-label" for="client1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="client2" value="0" checked="true" name="client" class="custom-control-input">
                                            <label class="custom-control-label" for="client2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Fournisseur :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="fournisseur1" value="1" checked="" name="fournisseur" class="custom-control-input">
                                            <label class="custom-control-label" for="fournisseur1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="fournisseur2" value="0" checked="true" name="fournisseur" class="custom-control-input">
                                            <label class="custom-control-label" for="fournisseur2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Achat :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="achat1" value="1" checked="" name="achat" class="custom-control-input">
                                            <label class="custom-control-label" for="achat1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="achat2" value="0" checked="true" name="achat" class="custom-control-input">
                                            <label class="custom-control-label" for="achat2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Vente :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="vente1" value="1" checked="" name="vente" class="custom-control-input">
                                            <label class="custom-control-label" for="vente1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="vente2" value="0" checked="true" name="vente" class="custom-control-input">
                                            <label class="custom-control-label" for="vente2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Produit :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="produit1" value="1" checked="" name="produit" class="custom-control-input">
                                            <label class="custom-control-label" for="produit1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="produit2" value="0" checked="true" name="produit" class="custom-control-input">
                                            <label class="custom-control-label" for="produit2">Non</label>


                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Avoir :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="avoir1" value="1" checked="" name="avoir" class="custom-control-input">
                                            <label class="custom-control-label" for="avoir1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="avoir2" value="0" checked="true" name="avoir" class="custom-control-input">
                                            <label class="custom-control-label" for="avoir2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Charge :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="charge1" value="1" checked="" name="charge" class="custom-control-input">
                                            <label class="custom-control-label" for="charge1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="charge2" value="0" checked="true" name="charge" class="custom-control-input">
                                            <label class="custom-control-label" for="charge2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Depots :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="depot1" value="1" checked="" name="depot" class="custom-control-input">
                                            <label class="custom-control-label" for="depot1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="depot2" value="0" checked="true" name="depot" class="custom-control-input">
                                            <label class="custom-control-label" for="depot2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Ancienne Vente :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="ancienne_vente1" value="1" checked="" name="ancienne_vente" class="custom-control-input">
                                            <label class="custom-control-label" for="ancienne_vente1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="ancienne_vente2" value="0" checked="true" name="ancienne_vente" class="custom-control-input">
                                            <label class="custom-control-label" for="ancienne_vente2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Devis :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="devis1" value="1" checked="" name="devis" class="custom-control-input">
                                            <label class="custom-control-label" for="devis1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="devis2" value="0" checked="true" name="devis" class="custom-control-input">
                                            <label class="custom-control-label" for="devis2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Achat Vente :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="achat_vente1" value="1" checked="" name="achat_vente" class="custom-control-input">
                                            <label class="custom-control-label" for="achat_vente1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="achat_vente2" value="0" checked="true" name="achat_vente" class="custom-control-input">
                                            <label class="custom-control-label" for="achat_vente2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Bon Commande :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="bon_commande1" value="1" checked="" name="bon_commande" class="custom-control-input">
                                            <label class="custom-control-label" for="bon_commande1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="bon_commande2" value="0" checked="true" name="bon_commande" class="custom-control-input">
                                            <label class="custom-control-label" for="bon_commande2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Commande Vendeur :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="commande_vendeur1" value="1" checked="" name="commande_vendeur" class="custom-control-input">
                                            <label class="custom-control-label" for="commande_vendeur1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="commande_vendeur2" value="0" checked="true" name="commande_vendeur" class="custom-control-input">
                                            <label class="custom-control-label" for="commande_vendeur2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Bon Livraison :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="bon_livraison1" value="1" checked="" name="bon_livraison" class="custom-control-input">
                                            <label class="custom-control-label" for="bon_livraison1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="bon_livraison2" value="0" checked="true" name="bon_livraison" class="custom-control-input">
                                            <label class="custom-control-label" for="bon_livraison2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Réglement :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="reglement1" value="1" checked="" name="reglement" class="custom-control-input">
                                            <label class="custom-control-label" for="reglement2">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="reglement2" value="0" checked="true" name="reglement" class="custom-control-input">
                                            <label class="custom-control-label" for="reglement2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Facture :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="facture1" value="1" checked="" name="facture" class="custom-control-input">
                                            <label class="custom-control-label" for="facture1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="facture2" value="0" checked="true" name="facture" class="custom-control-input">
                                            <label class="custom-control-label" for="facture2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Caisse :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="caisse1" value="1" checked="" name="caisse" class="custom-control-input">
                                            <label class="custom-control-label" for="caisse1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="caisse2" value="0" checked="true" name="caisse" class="custom-control-input">
                                            <label class="custom-control-label" for="caisse2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Transfert caisse :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="transfert_caisse1" value="1" checked="" name="transfert_caisse" class="custom-control-input">
                                            <label class="custom-control-label" for="transfert_caisse1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="transfert_caisse2" value="0" checked="true" name="transfert_caisse" class="custom-control-input">
                                            <label class="custom-control-label" for="transfert_caisse2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Recettes Pointes De Vente :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="recette_point_vente1" value="1" checked="" name="recette_point_vente" class="custom-control-input">
                                            <label class="custom-control-label" for="recette_point_vente1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="recette_point_vente2" value="0" checked="true" name="recette_point_vente" class="custom-control-input">
                                            <label class="custom-control-label" for="recette_point_vente2">Non</label>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Annulations :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="annulation1" value="1" checked="" name="annulation" class="custom-control-input">
                                            <label class="custom-control-label" for="annulation1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="annulation2" value="0" checked="true" name="annulation" class="custom-control-input">
                                            <label class="custom-control-label" for="annulation2">Non</label>

                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-md-2">
                                    <label for="bloque1">bloqué :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="bloque1" value="1" checked="" name="bloque" class="custom-control-input">
                                            <label class="custom-control-label" for="bloque1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="bloque2" value="0" checked="true" name="bloque" class="custom-control-input">
                                            <label class="custom-control-label" for="bloque2">Non</label>

                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-md-2">
                                    <label for="bloque1">Etat :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="etat1" value="1" checked="" name="etat" class="custom-control-input">
                                            <label class="custom-control-label" for="etat1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input type="radio" id="etat2" value="0" checked="true" name="etat" class="custom-control-input">
                                            <label class="custom-control-label" for="etat2">Non</label>
                                        </div>
                                    </div>
                                </div>


                            </div>

                        <?php } ?>

                        <!-- <h1>Priviléges Etats</h1>

                        <div class="form-row">
                          
                          <div class="form-group col-md-2">
                              <label for="remarque">Mouvement Caisse  :</label>
                              <div class="mb-4">
                                  <div style="display: inline-block;" class="custom-control custom-radio">
                                      <input type="radio" id="mouvement_caisse1" value="1"  name="mouvement_caisse"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="mouvement_caisse1">Oui</label>
                                  </div>
                                  <div style="display: inline-block;margin-left: 20px"
                                      class="custom-control custom-radio">
                                      <input type="radio" id="mouvement_caisse2" value="0" checked="true" name="mouvement_caisse"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="mouvement_caisse2">Non</label>

                                  </div>
                              </div>
                          </div>
                          <div class="form-group col-md-2">
                              <label for="remarque">Etat vente :</label>
                              <div class="mb-4">
                                  <div style="display: inline-block;" class="custom-control custom-radio">
                                      <input type="radio" id="etat_vente1" value="1" checked="" name="etat_vente"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="etat_vente1">Oui</label>
                                  </div>
                                  <div style="display: inline-block;margin-left: 20px"
                                      class="custom-control custom-radio">
                                      <input type="radio" id="etat_vente2" value="0" checked="true" name="etat_vente"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="etat_vente2">Non</label>


                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group col-md-2">
                                <label for="remarque">Fournisseur :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="fournisseur1" value="1" checked="" name="fournisseur"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="fournisseur1">oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input type="radio" id="fournisseur2" value="0" name="fournisseur"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="fournisseur2">Non</label>

                                  </div>
                              </div>
                          </div>
                          <div class="form-group col-md-2">
                              <label for="remarque">Etat Commande Vendeur :</label>
                              <div class="mb-4">
                                  <div style="display: inline-block;" class="custom-control custom-radio">
                                      <input type="radio" id="etat_commande_vendeur1" value="1" checked="" name="etat_commande_vendeur"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="etat_commande_vendeur1">Oui</label>
                                  </div>
                                  <div style="display: inline-block;margin-left: 20px"
                                      class="custom-control custom-radio">
                                      <input type="radio" id="etat_commande_vendeur2" value="0"  checked="true" name="etat_commande_vendeur"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="etat_commande_vendeur2">Non</label>

                                  </div>
                              </div>
                          </div>
                          <div class="form-group col-md-2">
                              <label for="remarque">Etat Vente Impayées :</label>
                              <div class="mb-4">
                                  <div style="display: inline-block;" class="custom-control custom-radio">
                                      <input type="radio" id="etat_vente_impayes1" value="1" checked="" name="etat_vente_impayes"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="etat_vente_impayes1">Oui</label>
                                  </div>
                                  <div style="display: inline-block;margin-left: 20px"
                                      class="custom-control custom-radio">
                                      <input type="radio" id="etat_vente_impayes2" value="0"  checked="true" name="etat_vente_impayes"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="etat_vente_impayes2">Non</label>


                                  </div>
                              </div>
                          </div>
                          <div class="form-group col-md-2">
                              <label for="remarque">Etat Achat :</label>
                              <div class="mb-4">
                                  <div style="display: inline-block;" class="custom-control custom-radio">
                                      <input type="radio" id="etat_achat1" value="1" checked="" name="etat_achat"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="etat_achat1">Oui</label>
                                  </div>
                                  <div style="display: inline-block;margin-left: 20px"
                                      class="custom-control custom-radio">
                                      <input type="radio" id="etat_achat2" value="0"  checked="true" name="etat_achat"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="etat_achat2">Non</label>

                                  </div>
                              </div>
                          </div>
                          <div class="form-group col-md-2">
                              <label for="remarque">Etat_vente_achat :</label>
                              <div class="mb-4">
                                  <div style="display: inline-block;" class="custom-control custom-radio">
                                      <input type="radio" id="etat_vente_achat1" value="1" checked="" name="etat_vente_achat"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="etat_vente_achat1">Oui</label>
                                  </div>
                                  <div style="display: inline-block;margin-left: 20px"
                                      class="custom-control custom-radio">
                                      <input type="radio" id="etat_vente_achat2" value="0"  checked="true"name="etat_vente_achat"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="etat_vente_achat2">Non</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="remarque">Depots :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="depot1" value="1" checked="" name="depot"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="charge1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input type="radio" id="depot2" value="0" name="depot"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="depot2">Non</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="remarque">Ancienne Vente :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="ancienne_vente1" value="1" checked="" name="ancienne_vente"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="ancienne_vente1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input type="radio" id="ancienne_vente2" value="0" name="ancienne_vente"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="ancienne_vente2">Non</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="remarque">Devis :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="devis1" value="1" checked="" name="devis"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="devis1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input type="radio" id="devis2" value="0" name="devis"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="devis2">Non</label>

                                    </div>
                                </div>
                            </div>
                             <div class="form-group col-md-2">
                                <label for="remarque"> Achat Vente :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="achat_vente1" value="1" checked="" name="achat_vente"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="achat_vente1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input type="radio" id="achat_vente2" value="0" name="achat_vente"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="devis2">Non</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="remarque">Bon Commande :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="bon_commande1" value="1" checked="" name="bon_commande"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="bon_commande1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input type="radio" id="bon_commande2" value="0" name="bon_commande"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="bon_commande2">Non</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="remarque"> Commande Vendeur  :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="commande_vendeur1" value="1" checked="" name="commande_vendeur"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="commande_vendeur1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input type="radio" id="commande_vendeur2" value="0" name="commande_vendeur"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="commande_vendeur2">Non</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                            <label for="remarque"> Bon Livraison  :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="bon_livraison1" value="1" checked="" name="bon_livraison"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="bon_livraison1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input type="radio" id="bon_livraison2" value="0" name="bon_livraison"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="bon_livraison2">Non</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                            <label for="remarque"> Réglement  :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="reglement1" value="1" checked="" name="reglement"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="reglement1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input type="radio" id="reglement2" value="0" name="reglement"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="reglement2">Non</label>

                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-2">
                            <label for="remarque"> Facture  :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="facure1" value="1" checked="" name="facure"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="facure1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input type="radio" id="facure2" value="0" name="facure"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="facure2">Non</label>

                                    </div>
                                </div>
                            </div>

                            
                            <div class="form-group col-md-2">
                            <label for="remarque"> Caisse  :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="caisse1" value="1" checked="" name="caisse"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="caisse1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input type="radio" id="caisse2" value="0" name="caisse"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="caisse2">Non</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                            <label for="remarque"> Transfert Caisse   :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="transfert_caisse1" value="1" checked="" name="transfert_caisse"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="transfert_caisse1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input type="radio" id="transfert_caisse2" value="0" name="transfert_caisse"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="transfert_caisse2">Non</label>

                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-2">
                            <label for="remarque"> Recettes Points De Vente :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="recette_point_vente1" value="1" checked="" name="recette_point_vente"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="recette_point_vente1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input type="radio" id="recette_point_vente2" value="0" name="recette_point_vente"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="recette_point_vente2">Non</label>

                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group col-md-2">
                            <label for="remarque"> Annulation    :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="annulation" value="1" checked="" name="annulation"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="annulation1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input type="radio" id="annulation2" value="0" name="annulation"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="annulation2">Non</label>

                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-2">
                            <label for="remarque"> Etat :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input type="radio" id="etat" value="1" checked="" name="annulation"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="etat1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input  type="radio" id="etat2" value="0" name="annulation"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="etat2">Non</label>

                                    </div>
                                </div>
                            </div>
>>>>>>> 3c7ed44faf704e1b70bf848f58b64bc1a178983a

                                  </div>
                              </div>
                          </div>
                          <div class="form-group col-md-2">
                              <label for="remarque">Etat Vente Par Employé :</label>
                              <div class="mb-4">
                                  <div style="display: inline-block;" class="custom-control custom-radio">
                                      <input type="radio" id="vente_par_employe1" value="1" checked="" name="vente_par_employe"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="vente_par_employe1">Oui</label>
                                  </div>
                                  <div style="display: inline-block;margin-left: 20px"
                                      class="custom-control custom-radio">
                                      <input type="radio" id="vente_par_employe2" value="0"  checked="true"name="vente_par_employe"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="vente_par_employe2">Non</label>

                                  </div>
                              </div>
                          </div>
                          <div class="form-group col-md-2">
                              <label for="remarque">Etat Vente / Achat Par Employé:</label>
                              <div class="mb-4">
                                  <div style="display: inline-block;" class="custom-control custom-radio">
                                      <input type="radio" id="vente_achat_par_employe1" value="1" checked="" name="vente_achat_par_employe"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="vente_achat_par_employe1">Oui</label>
                                  </div>
                                  <div style="display: inline-block;margin-left: 20px"
                                      class="custom-control custom-radio">
                                      <input type="radio" id="vente_achat_par_employe2" value="0"  checked="true"name="vente_achat_par_employe"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="vente_achat_par_employe2">Non</label>

                                  </div>
                              </div>
                          </div>
                         
                          <div class="form-group col-md-2">
                              <label for="remarque">Etat Vente Par Categorie :</label>
                              <div class="mb-4">
                                  <div style="display: inline-block;" class="custom-control custom-radio">
                                      <input type="radio" id="vente_par_categorie1" value="1" checked="" name="vente_par_categorie"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="vente_par_categorie1">Oui</label>
                                  </div>
                                  <div style="display: inline-block;margin-left: 20px"
                                      class="custom-control custom-radio">
                                      <input type="radio" id="vente_par_categorie2" value="0"  checked="true" name="vente_par_categorie"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="vente_par_categorie2">Non</label>
                                  </div>
                              </div>
                          </div>
                          <div class="form-group col-md-2">
                              <label for="remarque">Etat Stock Par Categorie :</label>
                              <div class="mb-4">
                                  <div style="display: inline-block;" class="custom-control custom-radio">
                                      <input type="radio" id="stock_par_categorie1" value="1" checked="" name="stock_par_categori"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="vente_par_categorie1">Oui</label>
                                  </div>
                                  <div style="display: inline-block;margin-left: 20px"
                                      class="custom-control custom-radio">
                                      <input type="radio" id="stock_par_categorie2" value="0"  checked="true" name="stock_par_categorie"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="stock_par_categori2">Non</label>
                                  </div>
                              </div>
                          </div>
                          <div class="form-group col-md-2">
                              <label for="remarque">Etat Inventaire Stock  :</label>
                              <div class="mb-4">
                                  <div style="display: inline-block;" class="custom-control custom-radio">
                                      <input type="radio" id="inventaire_stock1" value="1" checked="" name="inventaire_stock"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="inventaire_stock1">Oui</label>
                                  </div>
                                  <div style="display: inline-block;margin-left: 20px"
                                      class="custom-control custom-radio">
                                      <input type="radio" id="inventaire_stock2" value="0"  checked="true"name="inventaire_stock"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="inventaire_stock2">Non</label>
                                  </div>
                              </div>
                          </div>
                          <div class="form-group col-md-2">
                              <label for="remarque">Etat Inventaire Depot  :</label>
                              <div class="mb-4">
                                  <div style="display: inline-block;" class="custom-control custom-radio">
                                      <input type="radio" id="inventaire_depot1" value="1" checked="" name="inventaire_depot"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="inventaire_depot1">Oui</label>
                                  </div>
                                  <div style="display: inline-block;margin-left: 20px"
                                      class="custom-control custom-radio">
                                      <input type="radio" id="inventaire_depot2" value="0"  checked="true"name="inventaire_depot"
                                          class="custom-control-input">
                                      <label class="custom-control-label" for="inventaire_depot2">Non</label>

                                  </div>
                              </div>
                          </div>
                         
                                </div> -->

                        <div class="float-sm-right text-zero">
                            <button type="submit" class="btn btn-primary btn-lg  mr-1 ">Enregistrer</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {

        $("#addform").on("submit", function(event) {
            event.preventDefault();

            var form = $(this);
            $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL . 'views/utilisateur/'; ?>controle.php",
                data: new FormData(this),
                dataType: 'text',
                cache: false,
                contentType: false,
                processData: false,
                success: function(data) {

                    if (data.indexOf("success") >= 0) {

                        swal(
                            'Ajouter',
                            'utilisateur a ete bien Ajouter',
                            'success'
                        ).then((result) => {
                            $.ajax({

                                method: 'POST',
                                data: {
                                    ajax: true
                                },
                                url: `<?php echo BASE_URL . "views/utilisateur/index.php" ?>`,
                                context: document.body,
                                success: function(data) {
                                    history.pushState({}, "", `<?php echo BASE_URL . "utilisateur/index.php" ?>`);
                                    $("#main").html(data);
                                }
                            });
                        });
                    } else {

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