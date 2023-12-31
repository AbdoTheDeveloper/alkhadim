<?php
if (isset($_POST['ajax'])) {
    include('../../evr.php');
}
$utilisateur = new utilisateur();
$id = explode('?id=', $_SERVER["REQUEST_URI"]);
$oldvalue = $utilisateur->selectById($id[1]);
// debug($oldvalue['supprimer'])  ; 
// debug($oldvalue['depot']) ; 
?>
<div class="container-fluid disable-text-selection">
    <div class="row">
        <div class="col-12">
            <div class="mb-2">
                <h1>utilisateurs </h1>
                <div class="float-sm-right text-zero">
                    <button type="button" class="btn btn-success  url notlink" data-url="utilisateur/index.php"> <i
                            class="glyph-icon simple-icon-arrow-left"></i></button>
                </div>
            </div>
            <div class="separator mb-5"></div>
        </div>
    </div>
    <div class="row">
        <div class="col align-self-start">
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="mb-4">Modification utilisateur</h5>
                    <form id="addform" method="post" name="form_utilisateur" enctype="multipart/form-data">
                        <input type="hidden" name="act" value="update">
                        <input type="hidden" name="id" value="<?php echo $id[1]; ?>">
                        <div class="form-row">
                            <div class="form-group col-md-4 client">
                                <label for="nom"> Nom :</label>
                                <input type="text" class="form-control" id="nom" name="nom"
                                    value="<?php echo $oldvalue['nom']; ?>">
                            </div>
                            <div class="form-group col-md-4 client">
                                <label for="nom"> Telephone :</label>
                                <input type="text" class="form-control" id="tele" name="tele"
                                    value="<?php echo $oldvalue['tele']; ?>">
                            </div>
                            <div class="form-group col-md-4 client">
                                <label for="nom"> Email :</label>
                                <input type="text" class="form-control" id="email" name="email"
                                    value="<?php echo $oldvalue['email']; ?>">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="login"> Login :</label>
                                <input type="text" class="form-control" id="login" name="login"
                                    value="<?php echo $oldvalue['login']; ?>">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="pwd">Password :</label>
                                <input type="text" class="form-control" id="pwd" name="pwd"
                                    value="<?php echo $oldvalue['pwd']; ?>">
                            </div>
                            <div class="form-group col-md-4">
                                <label for="nom_prenom_ar">Privilege :</label>
                                <select <?php auth::user()['privilege'] !== "Admin" ? print 'disabled' : '' ?>
                                    class="form-control" name="privilege">
                                    <option <?php $oldvalue['privilege'] == "Admin" ? print 'selected' : '' ?>
                                        value="Admin"> Admin</option>
                                    <option <?php $oldvalue['privilege'] == "Vendeur" ? print 'selected' : '' ?>
                                        value="Vendeur">Vendeur</option>
                                    <option <?php $oldvalue['privilege'] == "User+" ? print 'selected' : '' ?>
                                        value="User+"> User+</option>
                                    <option <?php $oldvalue['privilege'] == "User" ? print 'selected' : '' ?>
                                        value="User"> User</option>
                                </select>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="nom_prenom_ar">Zone :</label>
                                <select class="form-control" name="id_zone">
                                    <?php
                                    $zone = new zone();
                                    $zones = $zone->selectChamps("*", '', '', 'libelle', 'asc');
                                    foreach ($zones as $row) {
                                        if ($row->id_zone == $oldvalue['id_zone']) {
                                            echo '<option value="' . $row->id_zone . '" selected="selected">' . $row->libelle . '</option>';
                                        } else {
                                            echo '<option value="' . $row->id_zone . '">' . $row->libelle . '</option>';
                                        }
                                    } ?>
                                </select>
                            </div>
                        </div>
                        <br>
                        <?php if (auth::user()['privilege'] == "Admin") {
                            ?>
                            <h1>Priviléges Opérations</h1>
                            <div class="form-row">

                            <div class="form-group col-md-2">
                                    <label for="remarque">Utilisateur :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="utilisateur1" value="1" <?php $oldvalue['utilisateur'] == 1 ? print 'checked' : '' ?> name="utilisateur" class="custom-control-input">
                                            <label class="custom-control-label" for="utilisateur1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['utilisateur'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="utilisateur2" value="0" name="utilisateur" class="custom-control-input">
                                            <label class="custom-control-label" for="utilisateur2">Non</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group col-md-2">
                                    <label for="remarque">Fournisseur  :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="fournisseur1" value="1" <?php $oldvalue['fournisseur'] == 1 ? print 'checked' : '' ?> name="fournisseur" class="custom-control-input">
                                            <label class="custom-control-label" for="fournisseur1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['fournisseur'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="fournisseur2" value="0" name="fournisseur" class="custom-control-input">
                                            <label class="custom-control-label" for="fournisseur2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Client :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="client1" value="1" <?php $oldvalue['client'] == 1 ? print 'checked' : '' ?> name="client" class="custom-control-input">
                                            <label class="custom-control-label" for="client1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['client'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="client2" value="0" name="client" class="custom-control-input">
                                            <label class="custom-control-label" for="client2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Achat :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['achat'] == 1 ? print 'checked' : '' ?> type="radio"
                                                id="achat1" value="1" name="achat" class="custom-control-input">
                                            <label class="custom-control-label" for="achat1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['achat'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="achat2" value="0" name="achat" class="custom-control-input">
                                            <label class="custom-control-label" for="achat2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Vente :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input type="radio" id="vente1" value="1" <?php $oldvalue['vente'] == 1 ? print 'checked' : '' ?> name="vente" class="custom-control-input">
                                            <label class="custom-control-label" for="vente1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['vente'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="vente2" value="0" name="vente" class="custom-control-input">
                                            <label class="custom-control-label" for="vente2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Produit :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['produit'] == 1 ? print 'checked' : '' ?> type="radio"
                                                id="produit1" value="1" name="produit" class="custom-control-input">
                                            <label class="custom-control-label" for="produit1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['produit'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="produit2" value="0" name="produit" class="custom-control-input">
                                            <label class="custom-control-label" for="produit2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Avoir :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['avoir'] == 1 ? print 'checked' : '' ?> type="radio"
                                                id="avoir1" value="1" checked="" name="avoir" class="custom-control-input">
                                            <label class="custom-control-label" for="avoir1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['avoir'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="avoir2" value="0" name="avoir" class="custom-control-input">
                                            <label class="custom-control-label" for="avoir2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Charge :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['charge'] == 1 ? print 'checked' : '' ?> type="radio"
                                                id="charge1" value="1" checked="" name="charge"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="charge1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['charge'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="charge2" value="0" name="charge" class="custom-control-input">
                                            <label class="custom-control-label" for="charge2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Depots :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['depot'] == 1 ? print 'checked' : '' ?> type="radio"
                                                id="depot1" value="1" checked="" name="depot" class="custom-control-input">
                                            <label class="custom-control-label" for="depot1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['depot'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="depot2" value="0" name="depot" class="custom-control-input">
                                            <label class="custom-control-label" for="depot2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Ancienne Vente :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['ancienne_vente'] == 1 ? print 'checked' : '' ?>
                                                type="radio" id="ancienne_vente1" value="1" checked="" name="ancienne_vente"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="ancienne_vente1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['ancienne_vente'] == 0 ? print 'checked' : '' ?>
                                                type="radio" id="ancienne_vente2" value="0" name="ancienne_vente"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="ancienne_vente2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Devis :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['devis'] == 1 ? print 'checked' : '' ?> type="radio"
                                                id="devis1" value="1" checked="" name="devis" class="custom-control-input">
                                            <label class="custom-control-label" for="devis1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['devis'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="devis2" value="0" name="devis" class="custom-control-input">
                                            <label class="custom-control-label" for="devis2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Achat Vente :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['achat_vente'] == 1 ? print 'checked' : '' ?> type="radio"
                                                id="achat_vente1" value="1" checked="" name="achat_vente"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="achat_vente1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['achat_vente'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="achat_vente2" value="0" name="achat_vente" class="custom-control-input">
                                            <label class="custom-control-label" for="achat_vente2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Bon Commande :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['bon_commande'] == 1 ? print 'checked' : '' ?> type="radio"
                                                id="bon_commande1" value="1" checked="" name="bon_commande"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="bon_commande1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['bon_commande'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="bon_commande2" value="0" name="bon_commande"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="bon_commande2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Commande Vendeur :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['commande_vendeur'] == 1 ? print 'checked' : '' ?>
                                                type="radio" id="commande_vendeur1" value="1" checked=""
                                                name="commande_vendeur" class="custom-control-input">
                                            <label class="custom-control-label" for="commande_vendeur1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['commande_vendeur'] == 0 ? print 'checked' : '' ?>
                                                type="radio" id="commande_vendeur2" value="0" name="commande_vendeur"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="commande_vendeur2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Bon Livraison :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['bon_livraison'] == 1 ? print 'checked' : '' ?>
                                                type="radio" id="bon_livraison1" value="1" checked="" name="bon_livraison"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="bon_livraison1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['bon_livraison'] == 0 ? print 'checked' : '' ?>
                                                type="radio" id="bon_livraison2" value="0" name="bon_livraison"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="bon_livraison2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Réglement :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['reglement'] == 1 ? print 'checked' : '' ?> type="radio"
                                                id="reglement1" value="1" checked="" name="reglement"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="reglement1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['reglement'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="reglement2" value="0" name="reglement" class="custom-control-input">
                                            <label class="custom-control-label" for="reglement2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Facture :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['facture'] == 1 ? print 'checked' : '' ?> type="radio"
                                                id="facture1" value="1" checked="" name="facture"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="facture1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['facture'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="facture2" value="0" name="facture" class="custom-control-input">
                                            <label class="custom-control-label" for="facture2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Caisse :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['caisse'] == 1 ? print 'checked' : '' ?> type="radio"
                                                id="caisse1" value="1" checked="" name="caisse"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="caisse1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['caisse'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="caisse2" value="0" name="caisse" class="custom-control-input">
                                            <label class="custom-control-label" for="caisse2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Transfert caisse :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['transfert_caisse'] == 1 ? print 'checked' : '' ?>
                                                type="radio" id="transfert_caisse1" value="1" checked=""
                                                name="transfert_caisse" class="custom-control-input">
                                            <label class="custom-control-label" for="transfert_caisse1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['transfert_caisse'] == 0 ? print 'checked' : '' ?>
                                                type="radio" id="transfert_caisse2" value="0" name="transfert_caisse"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="transfert_caisse2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Recettes Pointes De Vente :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['recette_point_vente'] == 1 ? print 'checked' : '' ?>
                                                type="radio" id="recette_point_vente1" value="1" checked=""
                                                name="recette_point_vente" class="custom-control-input">
                                            <label class="custom-control-label" for="recette_point_vente1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['recette_point_vente'] == 0 ? print 'checked' : '' ?>
                                                type="radio" id="recette_point_vente2" value="0" name="recette_point_vente"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="recette_point_vente2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="remarque">Annulations :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['annulation'] == 1 ? print 'checked' : '' ?> type="radio"
                                                id="annulation1" value="1" checked="" name="annulation"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="annulation1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['annulation'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="annulation2" value="0" name="annulation" class="custom-control-input">
                                            <label class="custom-control-label" for="annulation2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="bloque1">bloqué :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['bloque'] == 1 ? print 'checked' : '' ?> type="radio"
                                                id="bloque1" value="1" checked="" name="bloque"
                                                class="custom-control-input">
                                            <label class="custom-control-label" for="bloque1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['bloque'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="bloque2" value="0" name="bloque" class="custom-control-input">
                                            <label class="custom-control-label" for="bloque2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="bloque1">Etat :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input <?php $oldvalue['etat'] == 1 ? print 'checked' : '' ?> type="radio"
                                                id="etat1" value="1" checked="" name="etat" class="custom-control-input">
                                            <label class="custom-control-label" for="etat1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px"
                                            class="custom-control custom-radio">
                                            <input <?php $oldvalue['etat'] == 0 ? print 'checked' : '' ?> type="radio"
                                                id="etat2" value="0" name="etat" class="custom-control-input">
                                            <label class="custom-control-label" for="etat2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="bloque1">Supprimer :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input  <?php $oldvalue['supprimer'] =="1" ? print 'checked' : '' ?> type="radio" id="supprimer1" value="1" checked="" name="supprimer" class="custom-control-input">
                                            <label class="custom-control-label" for="supprimer1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input  <?php $oldvalue['supprimer'] == 0 ? print 'checked' : '' ?> type="radio" id="supprimer2" value="0" name="supprimer" class="custom-control-input">
                                            <label class="custom-control-label" for="supprimer2">Non</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="bloque1">Modifier :</label>
                                    <div class="mb-4">
                                        <div style="display: inline-block;" class="custom-control custom-radio">
                                            <input  <?php $oldvalue['modifier'] == 1 ? print 'checked' : '' ?> type="radio" id="modifier1" value="1" checked="" name="modifier" class="custom-control-input">
                                            <label class="custom-control-label" for="modifier1">Oui</label>
                                        </div>
                                        <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                            <input  <?php $oldvalue['modifier'] == 0 ? print 'checked' : '' ?> type="radio" id="modifier2" value="0"  name="modifier" class="custom-control-input">
                                            <label class="custom-control-label" for="modifier2">Non</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php
                        }
                        ?>
                        <!-- <h1>Priviléges Etats</h1>
                          <div class="form-row">
                              <div class="form-group col-md-2">
                                  <label for="remarque">Mouvement Caisse :</label>
                                  <div class="mb-4">
                                      <div style="display: inline-block;" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['mouvement_caisse'] == 1 ? print 'checked' : '' ?> type="radio" id="mouvement_caisse1" value="1" name="mouvement_caisse" class="custom-control-input">
                                          <label class="custom-control-label" for="mouvement_caisse1">Oui</label>
                                      </div>
                                      <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['mouvement_caisse'] == 0 ? print 'checked' : '' ?> type="radio" id="mouvement_caisse2" value="0"  name="mouvement_caisse" class="custom-control-input">
                                          <label class="custom-control-label" for="mouvement_caisse2">Non</label>
                                      </div>
                                  </div>
                              </div>
                              <div class="form-group col-md-2">
                                  <label for="remarque">Etat vente :</label>
                                  <div class="mb-4">
                                      <div style="display: inline-block;" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['etat_vente'] == 1 ? print 'checked' : '' ?> type="radio" id="etat_vente1" value="1" checked="" name="etat_vente" class="custom-control-input">
                                          <label class="custom-control-label" for="etat_vente1">Oui</label>
                                      </div>
                                      <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['etat_vente'] == 0 ? print 'checked' : '' ?> type="radio" id="etat_vente2" value="0"  name="etat_vente" class="custom-control-input">
                                          <label class="custom-control-label" for="etat_vente2">Non</label>
                                      </div>
                                  </div>
                              </div>
                              <div class="form-group col-md-2">
                                  <label for="remarque">Etat Bon Livraison :</label>
                                  <div class="mb-4">
                                      <div style="display: inline-block;" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['etat_bon_livraison'] == 1 ? print 'checked' : '' ?> type="radio" id="etat_bon_livraison1" value="1" checked="" name="etat_bon_livraison" class="custom-control-input">
                                          <label class="custom-control-label" for="achat1">Oui</label>
                                      </div>
                                      <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['etat_bon_livraison'] == 0 ? print 'checked' : '' ?> type="radio" id="etat_bon_livraison2" value="0"  name="etat_bon_livraison" class="custom-control-input">
                                          <label class="custom-control-label" for="etat_bon_livraison2">Non</label>
                                      </div>
                                  </div>
                              </div>
                              <div class="form-group col-md-2">
                                  <label for="remarque">Etat Commande Vendeur :</label>
                                  <div class="mb-4">
                                      <div style="display: inline-block;" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['etat_commande_vendeur'] == 1 ? print 'checked' : '' ?> type="radio" id="etat_commande_vendeur1" value="1" checked="" name="etat_commande_vendeur" class="custom-control-input">
                                          <label class="custom-control-label" for="etat_commande_vendeur1">Oui</label>
                                      </div>
                                      <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['etat_commande_vendeur'] == 0 ? print 'checked' : '' ?> type="radio" id="etat_commande_vendeur2" value="0"  name="etat_commande_vendeur" class="custom-control-input">
                                          <label class="custom-control-label" for="etat_commande_vendeur2">Non</label>
                                      </div>
                                  </div>
                              </div>
                              <div class="form-group col-md-2">
                                  <label for="remarque">Etat Vente Impayées :</label>
                                  <div class="mb-4">
                                      <div style="display: inline-block;" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['etat_vente_impayes'] == 1 ? print 'checked' : '' ?> type="radio" id="etat_vente_impayes1" value="1" checked="" name="etat_vente_impayes" class="custom-control-input">
                                          <label class="custom-control-label" for="etat_vente_impayes1">Oui</label>
                                      </div>
                                      <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['etat_vente_impayes'] == 0 ? print 'checked' : '' ?> type="radio" id="etat_vente_impayes2" value="0"  name="etat_vente_impayes" class="custom-control-input">
                                          <label class="custom-control-label" for="etat_vente_impayes2">Non</label>
                                      </div>
                                  </div>
                              </div>
                              <div class="form-group col-md-2">
                                  <label for="remarque">Etat Achat :</label>
                                  <div class="mb-4">
                                      <div style="display: inline-block;" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['etat_achat'] == 1 ? print 'checked' : '' ?> type="radio" id="etat_achat1" value="1" checked="" name="etat_achat" class="custom-control-input">
                                          <label class="custom-control-label" for="etat_achat1">Oui</label>
                                      </div>
                                      <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['etat_achat'] == 0 ? print 'checked' : '' ?> type="radio" id="etat_achat2" value="0"  name="etat_achat" class="custom-control-input">
                                          <label class="custom-control-label" for="etat_achat2">Non</label>
                                      </div>
                                  </div>
                              </div>
                              <div class="form-group col-md-2">
                                  <label for="remarque">Etat_vente_achat :</label>
                                  <div class="mb-4">
                                      <div style="display: inline-block;" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['etat_vente_achat'] == 1 ? print 'checked' : '' ?> type="radio" id="etat_vente_achat1" value="1" checked="" name="etat_vente_achat" class="custom-control-input">
                                          <label class="custom-control-label" for="etat_vente_achat1">Oui</label>
                                      </div>
                                      <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['etat_vente_achat'] == 0 ? print 'checked' : '' ?> type="radio" id="etat_vente_achat2" value="0"  name="etat_vente_achat" class="custom-control-input">
                                          <label class="custom-control-label" for="etat_vente_achat2">Non</label>
                                      </div>
                                  </div>
                              </div>


                              <div class="form-group col-md-2">
                                <label for="remarque">Depots :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input <?php $oldvalue['depot'] == 1 ? print 'checked' : '' ?> type="radio" id="depot1" value="1" checked="" name="depot"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="charge1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input type="radio" id="depot2" value="0" name="depot"
                                            class="custom-control-input">
                                        <label <?php $oldvalue['depot'] == 0 ? print 'checked' : '' ?> class="custom-control-label" for="depot2">Non</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="remarque">Ancienne Vente :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input <?php $oldvalue['ancienne_vente'] == 1 ? print 'checked' : '' ?> type="radio" id="ancienne_vente1" value="1" checked="" name="ancienne_vente"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="ancienne_vente1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input <?php $oldvalue['ancienne_vente'] == 0 ? print 'checked' : '' ?> type="radio" id="ancienne_vente2" value="0" name="ancienne_vente"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="ancienne_vente2">Non</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="remarque">Devis :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input <?php $oldvalue['devis'] == 1 ? print 'checked' : '' ?> type="radio" id="devis1" value="1" checked="" name="devis"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="devis1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input <?php $oldvalue['devis'] == 0 ? print 'checked' : '' ?> type="radio" id="devis2" value="0" name="devis"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="devis2">Non</label>

                                    </div>
                                </div>
                            </div>
                             <div class="form-group col-md-2">
                                <label for="remarque"> Achat Vente :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input <?php $oldvalue['achat_vente'] == 1 ? print 'checked' : '' ?> type="radio" id="achat_vente1" value="1" checked="" name="achat_vente"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="achat_vente1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input <?php $oldvalue['achat_vente'] == 0 ? print 'checked' : '' ?> type="radio" id="achat_vente2" value="0" name="achat_vente"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="devis2">Non</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="remarque">Bon Commande :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input <?php $oldvalue['bon_commande'] == 1 ? print 'checked' : '' ?> type="radio" id="bon_commande1" value="1" checked="" name="bon_commande"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="bon_commande1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input <?php $oldvalue['bon_commande'] == 0 ? print 'checked' : '' ?> type="radio" id="bon_commande2" value="0" name="bon_commande"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="bon_commande2">Non</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                                <label for="remarque"> Commande Vendeur  :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input <?php $oldvalue['commande_vendeur'] == 1 ? print 'checked' : '' ?> type="radio" id="commande_vendeur1" value="1" checked="" name="commande_vendeur"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="commande_vendeur1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input <?php $oldvalue['commade_vendeur'] == 0 ? print 'checked' : '' ?> type="radio" id="commande_vendeur2" value="0" name="commande_vendeur"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="commande_vendeur2">Non</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                            <label for="remarque"> Bon Livraison  :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input <?php $oldvalue['bon_livraison'] == 1 ? print 'checked' : '' ?> type="radio" id="bon_livraison1" value="1" checked="" name="bon_livraison"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="bon_livraison1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input <?php $oldvalue['bon_livraison'] == 0 ? print 'checked' : '' ?> type="radio" id="bon_livraison2" value="0" name="bon_livraison"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="bon_livraison2">Non</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                            <label for="remarque"> Réglement  :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input <?php $oldvalue['reglement'] == 1 ? print 'checked' : '' ?> type="radio" id="reglement1" value="1" checked="" name="reglement"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="reglement1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input <?php $oldvalue['reglement'] == 0 ? print 'checked' : '' ?> type="radio" id="reglement2" value="0" name="reglement"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="reglement2">Non</label>

                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-2">
                            <label for="remarque"> Facture  :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input <?php $oldvalue['facture'] == 1 ? print 'checked' : '' ?> type="radio" id="facure1" value="1" checked="" name="facure"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="facure1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input <?php $oldvalue['facture'] == 0 ? print 'checked' : '' ?> type="radio" id="facure2" value="0" name="facure"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="facure2">Non</label>

                                    </div>
                                </div>
                            </div>

                            
                            <div class="form-group col-md-2">
                            <label for="remarque"> Caisse  :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input <?php $oldvalue['caisse'] == 1 ? print 'checked' : '' ?> type="radio" id="caisse1" value="1" checked="" name="caisse"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="caisse1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input <?php $oldvalue['caisse'] == 0 ? print 'checked' : '' ?> type="radio" id="caisse2" value="0" name="caisse"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="caisse2">Non</label>

                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-2">
                            <label for="remarque"> Transfert Caisse   :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input <?php $oldvalue['transfert_caisse'] == 1 ? print 'checked' : '' ?> type="radio" id="transfert_caisse1" value="1" checked="" name="transfert_caisse"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="transfert_caisse1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input <?php $oldvalue['transert_caisse'] == 0 ? print 'checked' : '' ?> type="radio" id="transfert_caisse2" value="0" name="transfert_caisse"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="transfert_caisse2">Non</label>

                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-2">
                            <label for="remarque"> Recettes Points De Vente :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input <?php $oldvalue['recette_point_vente'] == 1 ? print 'checked' : '' ?> type="radio" id="recette_point_vente1" value="1" checked="" name="recette_point_vente"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="recette_point_vente1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input <?php $oldvalue['recette_point_vente'] == 0 ? print 'checked' : '' ?> type="radio" id="recette_point_vente2" value="0" name="recette_point_vente"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="recette_point_vente2">Non</label>

                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group col-md-2">
                            <label for="remarque"> Annulation    :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input <?php $oldvalue['annulation'] == 1 ? print 'checked' : '' ?> type="radio" id="annulation" value="1" checked="" name="annulation"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="annulation1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input <?php $oldvalue['annulation'] == 1 ? print 'checked' : '' ?> type="radio" id="annulation2" value="0" name="annulation"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="annulation2">Non</label>

                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-2">
                            <label for="remarque"> Etat    :</label>
                                <div class="mb-4">
                                    <div style="display: inline-block;" class="custom-control custom-radio">
                                        <input <?php $oldvalue['etat'] == 1 ? print 'checked' : '' ?> type="radio" id="etat" value="1" checked="" name="annulation"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="etat1">Oui</label>
                                    </div>
                                    <div style="display: inline-block;margin-left: 20px"
                                        class="custom-control custom-radio">
                                        <input <?php $oldvalue['etat'] == 1 ? print 'checked' : '' ?> type="radio" id="etat2" value="0" name="annulation"
                                            class="custom-control-input">
                                        <label class="custom-control-label" for="etat2">Non</label>

                                    </div>
                                </div>
                            </div>
                              <div class="form-group col-md-2">
                                  <label for="remarque">Etat Magazinier :</label>
                                  <div class="mb-4">
                                      <div style="display: inline-block;" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['magazinier'] == 1 ? print 'checked' : '' ?> type="radio" id="magazinier1" value="1" checked="" name="magazinier" class="custom-control-input">
                                          <label class="custom-control-label" for="magazinier1">Oui</label>
                                      </div>
                                      <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['magazinier'] == 0 ? print 'checked' : '' ?> type="radio" id="magazinier2" value="0"  name="magazinier" class="custom-control-input">
                                          <label class="custom-control-label" for="magazinier1">Non</label>
                                      </div>
                                  </div>
                              </div>
                              <div class="form-group col-md-2">
                                  <label for="remarque">Etat Vente Par Employé :</label>
                                  <div class="mb-4">
                                      <div style="display: inline-block;" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['vente_par_employe'] == 1 ? print 'checked' : '' ?> type="radio" id="vente_par_employe1" value="1" checked="" name="vente_par_employe" class="custom-control-input">
                                          <label class="custom-control-label" for="vente_par_employe1">Oui</label>
                                      </div>
                                      <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['vente_par_employe'] == 0 ? print 'checked' : '' ?> type="radio" id="vente_par_employe2" value="0"  name="vente_par_employe" class="custom-control-input">
                                          <label class="custom-control-label" for="vente_par_employe2">Non</label>
                                      </div>
                                  </div>
                              </div>
                              <div class="form-group col-md-2">
                                  <label for="remarque">Etat Vente / Achat Par Employé:</label>
                                  <div class="mb-4">
                                      <div style="display: inline-block;" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['vente_achat_par_employe'] == 1 ? print 'checked' : '' ?> type="radio" id="vente_achat_par_employe1" value="1" checked="" name="vente_achat_par_employe" class="custom-control-input">
                                          <label class="custom-control-label" for="vente_achat_par_employe1">Oui</label>
                                      </div>
                                      <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['vente_achat_par_employe'] == 0 ? print 'checked' : '' ?> type="radio" id="vente_achat_par_employe2" value="0"  name="vente_achat_par_employe" class="custom-control-input">
                                          <label class="custom-control-label" for="vente_achat_par_employe2">Non</label>
                                      </div>
                                  </div>
                              </div>
                              <div class="form-group col-md-2">
                                  <label for="remarque">Etat Vente Par Categorie :</label>
                                  <div class="mb-4">
                                      <div style="display: inline-block;" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['vente_par_categorie'] == 1 ? print 'checked' : '' ?> type="radio" id="vente_par_categorie1" value="1" checked="" name="vente_par_categorie" class="custom-control-input">
                                          <label class="custom-control-label" for="vente_par_categorie1">Oui</label>
                                      </div>
                                      <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['vente_par_categorie'] == 0 ? print 'checked' : '' ?> type="radio" id="vente_par_categorie2" value="0"  name="vente_par_categorie" class="custom-control-input">
                                          <label class="custom-control-label" for="vente_par_categorie2">Non</label>
                                      </div>
                                  </div>
                              </div>
                              <div class="form-group col-md-2">
                                  <label for="remarque">Etat Stock Par Categorie :</label>
                                  <div class="mb-4">
                                      <div style="display: inline-block;" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['stock_par_categori'] == 1 ? print 'checked' : '' ?> type="radio" id="stock_par_categorie1" value="1" checked="" name="stock_par_categori" class="custom-control-input">
                                          <label class="custom-control-label" for="vente_par_categorie1">Oui</label>
                                      </div>
                                      <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['stock_par_categori'] == 0 ? print 'checked' : '' ?> type="radio" id="stock_par_categorie2" value="0"  name="stock_par_categorie" class="custom-control-input">
                                          <label class="custom-control-label" for="stock_par_categori2">Non</label>
                                      </div>
                                  </div>
                              </div>
                              <div class="form-group col-md-2">
                                  <label for="remarque">Etat Inventaire Stock :</label>
                                  <div class="mb-4">
                                      <div style="display: inline-block;" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['inventaire_stock'] == 1 ? print 'checked' : '' ?> type="radio" id="inventaire_stock1" value="1" checked="" name="inventaire_stock" class="custom-control-input">
                                          <label class="custom-control-label" for="inventaire_stock1">Oui</label>
                                      </div>
                                      <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['inventaire_stock'] == 0 ? print 'checked' : '' ?> type="radio" id="inventaire_stock2" value="0"  name="inventaire_stock" class="custom-control-input">
                                          <label class="custom-control-label" for="inventaire_stock2">Non</label>
                                      </div>
                                  </div>
                              </div>
                              <div class="form-group col-md-2">
                                  <label for="remarque">Etat Inventaire Depot :</label>
                                  <div class="mb-4">
                                      <div style="display: inline-block;" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['inventaire_depot'] == 1 ? print 'checked' : '' ?> type="radio" id="inventaire_depot1" value="1" checked="" name="inventaire_depot" class="custom-control-input">
                                          <label class="custom-control-label" for="inventaire_depot1">Oui</label>
                                      </div>
                                      <div style="display: inline-block;margin-left: 20px" class="custom-control custom-radio">
                                          <input  <?php $oldvalue['inventaire_depot'] == 0 ? print 'checked' : '' ?> type="radio" id="inventaire_depot2" value="0"  name="inventaire_depot" class="custom-control-input">
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
    $(document).ready(function () {
        $(".select2-single").select2({
            theme: "bootstrap",
            placeholder: "",
            maximumSelectionSize: 6,
            containerCssClass: ":all:"
        });
        $("#id_categorie").change(function () {
            var id_categorie = $(this).val();
            $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL . 'views/utilisateur/'; ?>controle.php",
                data: {
                    act: "getcat",
                    id_categorie: id_categorie
                },
                success: function (data) {
                    $('#code_bar').val(data);
                }
            });
        });
        $("#addform").on("submit", function (event) {
            event.preventDefault();
            var form = $(this);
            $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL . 'views/utilisateur/'; ?>controle.php",
                data: new FormData(this),
                dataType: 'text', // what to expect back from the PHP script, if anything
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                    if (data.indexOf("success") >= 0) {
                        swal(
                            'Modification',
                            'utilisateur a ete bien modifie',
                            'success'
                        ).then((result) => {
                            $.ajax({
                                method: 'POST',
                                data: {
                                    ajax: true
                                },
                                url: `<?php echo BASE_URL . "views/utilisateur/index.php" ?>`,
                                context: document.body,
                                success: function (data) {
                                    history.pushState({}, "",
                                        `<?php echo BASE_URL . "utilisateur/index.php" ?>`
                                    );
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