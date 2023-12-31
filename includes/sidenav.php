<?php
$page = 'Acceuil';
if (isset($_GET['p'])) {
    $page = $_GET['p'];
} ?>
<div class="sidebar">
    <style>
        #inventaire_depot:hover {
            color: #034dff;
            /* Additional styles can be added here if needed */
        }
    </style>
    <div class="main-menu">
        <div class="scroll">
            <ul class="list-unstyled">
                <li class="<?= $page == 'Acceuil' ? 'active' : '' ?>">
                    <a href="javascript:void(0)" data-url="Acceuil/index.php" class="url">
                        <i class="glyph-icon iconsmind-Home"></i>
                        Accueil
                    </a>
                </li>
                <li id="client" class="<?= $page == 'client' || $page == 'utilisateur' || $page == 'fournisseur' || $page == 'reg_client'   ? 'active' : '' ?>">
                    <a href="#client" class="submenu">
                        <i class="glyph-icon iconsmind-Business-ManWoman"></i> Personnel
                    </a>
                </li>
                <li id="vente" class="<?= $page == 'vente' || $page == 'achat' || $page == 'reg_achat' || $page == 'facture'  || $page == 'detail_achat' || $page == 'reg_vente' || $page == 'detail_vente'   || $page == 'reg_avoir' || $page == 'avoir' || $page == 'detail_avoir' || $page == 'regelement'   ? 'active' : '' ?>">
                    <a href="#vente" class="submenu">
                        <i class="iconsmind-Digital-Drawing"></i> Opérations
                    </a>
                </li>
                <li id="Configuration" class="<?= $page == 'parametrage' || $page == 'categorie'  || $page == 'compte'  || $page == 'depot'  || $page == 'societe'  || $page == 'design_charges'  ? 'active' : '' ?>">
                    <a href="#Configuration" class="submenu">
                        <i class="glyph-icon iconsmind-Gear"></i> Configuration
                    </a>
                </li>
                <li id="Etat" class="<?= $page == 'chart' ? 'active' : '' ?>">
                    <a href="#Etat" class="submenu">
                        <i class="glyph-icon iconsmind-Bar-Chart"></i> État
                    </a>
                </li>
                <?php
                if ((int)auth::user()['produit'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                    <li class="<?= $page == 'produit' ? 'active' : '' ?>">
                        <a href="javascript:void(0)" data-url="produit/index.php" class="url">
                            <i class="glyph-icon iconsmind-Shop-4 "></i> Produit
                        </a>
                    </li>
                <?php
                }
                ?>
            </ul>
        </div>
    </div>
    <div class="sub-menu sub-hidden">
        <div class="scroll">
            <ul class="list-unstyled" data-link="client">
                <?php
                if ((int)auth::user()['client'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                    <li>
                        <a href="javascript:void(0)" data-url="client/index.php" class="url sub">
                            <i class="glyph-icon iconsmind-Business-Man"></i> Client
                        </a>
                    </li>
                <?php
                }
                ?>
                <?php
                if ((int)auth::user()['fournisseur'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                    <li>
                        <a href="javascript:void(0)" data-url="fournisseur/index.php" class="url sub">
                            <i class="glyph-icon iconsmind-Talk-Man"></i> Fournisseur
                        </a>
                    </li>
                <?php
                }
                ?>
                
                <?php
                if ((int)auth::user()['utilisateur'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                <li>
                    <a href="javascript:void(0)" data-url="utilisateur/index.php" class="url sub">
                        <i class="iconsmind-MaleFemale"></i> Utilisateur
                    </a>
                </li>
                <?php
                }
                ?>
            </ul>
            <ul class="list-unstyled" data-link="vente">
                <?php
                if (auth::user()['achat'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                    <li><a href="javascript:void(0)" data-url="achat/index.php" class="url sub">
                            <i class="glyph-icon iconsmind-Add-Bag"></i> Achat</a> </li>
                <?php
                }
                ?>
                <?php    // if (auth::user()['depot'] == 1 || auth::user()['privilege'] == "Admin") { ?> 
                   <?php
                if ((int)auth::user()['depot'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                <li>
                    <a href="javascript:void(0)" data-url="depots/index.php" class="url sub">
                        <i class="glyph-icon iconsmind-Shopping-Cart"></i> Depots
                    </a>
                </li>
                <?php }?>
                <?php
                if ((int)auth::user()['ancienne_vente'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                <li>
                    <a href="javascript:void(0)" data-url="ancien_vente/add.php" class="url sub">
                        <i class="glyph-icon iconsmind-Shopping-Cart"></i>Ancienne Vente</a>
                </li>
                <?php }?>
                <?php
                if ((int)auth::user()['devis'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                <li>
                    <a href="javascript:void(0)" data-url="devis/index.php" class="url sub">
                        <i class="glyph-icon iconsmind-Shopping-Cart"></i> Devis</a>
                </li>
                <?php }?>
                <?php
                if ((int)auth::user()['vente'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                    <li>
                        <a href="javascript:void(0)" data-url="vente/index.php" class="url sub">
                            <i class="glyph-icon iconsmind-Shopping-Cart"></i> Vente</a>
                    </li>
                <?php
                }
                ?>
                <?php
                if ((int)auth::user()['achat_vente'] == 1  || auth::user()['privilege'] == "Admin") {
                ?>
                    <li>
                        <a href="javascript:void(0)" data-url="achat-vente/add.php" class="url sub">
                            <i class="glyph-icon iconsmind-Shopping-Cart"></i> Achat Vente</a>
                    </li>
                <?php
                }
                ?>
                   <?php
                if ((int)auth::user()['bon_commande'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                <li>
                    <a href="javascript:void(0)" data-url="bon-commande/index.php" class="url sub">
                        <i class="glyph-icon iconsmind-Shopping-Cart"></i> Bon commande</a>
                </li>
                <?php }?>
                
                <?php
                if ((int)auth::user()['commande_vendeur'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                <li>
                    <a href="javascript:void(0)" data-url="commande-vendeurs/index.php" class="url sub">
                        <i class="glyph-icon iconsmind-Shopping-Cart"></i> Commande vendeur</a>
                </li>
                <?php }?>
                <?php
                if ((int)auth::user()['bon_livraison'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                <li> <a href="javascript:void(0)" data-url="vente/bon.php" class="url sub">
                        <i class="glyph-icon iconsmind-Shopping-Cart"></i>Bon de livraison </a>
                </li>
                <?php }?>
                <?php
                if ((int)auth::user()['avoir'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                    <li><a href="javascript:void(0)" data-url="avoir/index.php" class="url sub">
                            <i class="glyph-icon iconsmind-Shopping-Cart"></i> Avoir</a> </li>
                <?php
                }
                ?>
                   <?php
                if ( auth::user()['privilege'] == "Admin") {
                ?>
                <li>
                    <a href="javascript:void(0)" data-url="regelement/index.php" class="url sub">
                        <i class="glyph-icon iconsmind-Money-2"></i> Règlement</a>
                </li>
                <?php }?>
                <?php
                if ((int)auth::user()['facture'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                <li>
                    <a href="javascript:void(0)" data-url="facture/index.php" class="url sub">
                        <i class="glyph-icon  iconsmind-Billing"></i> Facture</a>
                </li>
                <?php }?>
                <?php
                if ((int)auth::user()['charge'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                    <li>
                        <a href="javascript:void(0)" data-url="charge/index.php" class="url sub">
                            <i class="glyph-icon  iconsmind-Billing"></i> Charges</a>
                    </li>
                <?php
                }
                ?>
                   <?php
                if ((int)auth::user()['caisse'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                <li>
                    <a href="javascript:void(0)" data-url="caisse/index.php" class="url sub">
                        <i class="glyph-icon  iconsmind-Billing"></i> Caisse</a>
                </li>
                <?php }?>
                <?php
                if ((int)auth::user()['transfert_caisse'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                <li>
                    <a href="javascript:void(0)" data-url="transfert_caisse/index.php" class="url sub">
                        <i class="glyph-icon  iconsmind-Billing"></i> Transfert Caisse</a>
                </li>
                <?php }?>
                <?php
                if ((int)auth::user()['recette_point_vente'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                <li>
                    <a href="javascript:void(0)" data-url="recette/index.php" class="url sub">
                        <i class="glyph-icon  iconsmind-Billing"></i> Recettes Points De Vente</a>
                </li>
                <?php }?>
                <?php
                if ((int)auth::user()['annulation'] == 1 || auth::user()['privilege'] == "Admin") {
                ?>
                <li>
                    <a href="javascript:void(0)" data-url="annulations/index.php" class="url sub">
                        <i class="glyph-icon  iconsmind-Billing"></i>Annulations </a>
                </li>
                <?php }?>
            </ul>
            <ul class="list-unstyled" data-link="Configuration">
                <li><a href="javascript:void(0)" data-url="categorie/index.php" class="url sub"> <i class="glyph-icon simple-icon-settings"></i>Catégories</a>
                </li>
                <li><a href="javascript:void(0)" data-url="ingredient/index.php" class="url sub"> <i class="glyph-icon simple-icon-settings"></i>Composants</a>
                </li>
                <li>
                    <a href="javascript:void(0)" data-url="societe/index.php" class="url sub"> <i class="glyph-icon simple-icon-settings"></i>Société</a>
                </li>
                <li><a href="javascript:void(0)" data-url="depot/index.php" class="url sub"> <i class="glyph-icon simple-icon-settings"></i>Dépôt</a>
                </li>
                <li><a href="javascript:void(0)" data-url="design_charges/index.php" class="url sub"> <i class="glyph-icon simple-icon-settings"></i>Paramétrage des charges</a>
                </li>
                <li>
                    <a href="javascript:void(0)" data-url="parametrage/index.php" class="url sub"> <i class="glyph-icon simple-icon-settings"></i>Paramétrages</a>
                </li>
                <li><a href="javascript:void(0)" data-url="compte/index.php" class="url sub"> <i class="glyph-icon simple-icon-settings"></i>Comptes bancaires</a>
                </li>
                <li>
                    <a href="javascript:void(0)" data-url="parametrage/pv.php" class="url sub">
                        <i class="glyph-icon simple-icon-settings"></i>Config Point de Vente
                    </a>
                </li>
                <li><a href="javascript:void(0)" data-url="zone/index.php" class="url sub"> <i class="glyph-icon simple-icon-settings"></i>Zones</a>
                </li>
            </ul>
            <ul class="list-unstyled" data-link="Etat">
                <?php if(auth::user()['etat']== 1 || auth::user()['privilege'] == "Admin") {?>
                <li><a target="_blank" href="<?php echo BASE_URL . 'views/etat/moveCaisse.php' ?>"><i class="glyph-icon  iconsmind-Billing"></i> Mouvement caisse</a> </li>
                <li><a target="_blank" href="<?php echo BASE_URL . 'views/etat/etat_meilleur_client.php' ?>"><i class="glyph-icon  iconsmind-Billing"></i> État Meilleurs Clients</a> </li>
                <li><a target="_blank" href="<?php echo BASE_URL . 'views/etat/etat_vente.php' ?>"> <i class="glyph-icon  iconsmind-Money-2"></i> État vente</a></li>
                <li><a target="_blank" href="<?php echo BASE_URL . 'views/etat/etat_meilleurs_clients.php' ?>"> <i class="glyph-icon  iconsmind-Money-2"></i> État Meilleurs Clients</a></li>
                <li><a target="_blank" href="<?php echo BASE_URL . 'views/etat/etat_bl.php' ?>"> <i class="glyph-icon  iconsmind-Money-2"></i> État BL</a></li>
                <li><a target="_blank" href="<?php echo BASE_URL . 'views/etat/etat_cmd_vendeurs.php' ?>"> <i class="glyph-icon  iconsmind-Money-2"></i> État commande vendeurs</a></li>
                <li><a target="_blank" href="<?php echo BASE_URL . 'views/etat/etat_vente_impayes.php' ?>"> <i class="glyph-icon  iconsmind-Money-2"></i> État ventes Impayées</a></li>
                <li><a target="_blank" href="<?php echo BASE_URL . 'views/etat/etat_achat.php' ?>"> <i class="glyph-icon  iconsmind-Billing"></i> État achat </a></li>
                <li><a target="_blank" href="<?php echo BASE_URL . 'views/etat/etat_vent_achat.php' ?>"> <i class="glyph-icon  iconsmind-Billing"></i> État vente-achat </a></li>
                <li><a target="_blank" href="<?php echo BASE_URL . 'views/etat/magasinier.php' ?>"> <i class="glyph-icon  iconsmind-Billing"></i> Magasinier </a></li>
                <li><a target="_blank" href="<?php echo BASE_URL . 'views/etat/cheque_vente.php' ?>"><i class="glyph-icon  iconsmind-Billing"></i> Chèque V</a> </li>
                <li><a target="_blank" href="<?php echo BASE_URL . 'views/etat/cheque_achat.php' ?>"><i class="glyph-icon  iconsmind-Billing"></i> Chèque A</a> </li>
                <li><a href="javascript:void(0)" data-url="chart/vente_client.php" class="url sub"> <i class="glyph-icon simple-icon-chart"></i> Vente par employé</a>
                </li>
                <!--         <li><a href="javascript:void(0)" data-url="chart/vente_categorie.php" class="url sub" > <i class="glyph-icon iconsmind-Bar-Chart3"></i> Vente produit par Categorie</a>
                   </li>
 -->
                <li><a href="javascript:void(0)" data-url="chart/vente_achat.php" class="url sub"> <i class="glyph-icon iconsmind-Line-Chart4"></i> Vente / Achat</a></li>
                <li><a a target="_blank" href="<?php echo BASE_URL . 'views/etat/etat_vente_categorie.php' ?>"> <i class="glyph-icon iconsmind-Pie-Chart2"></i>Vente par catégorie</a>
                </li>
                <li><a target="_blank" href="<?php echo BASE_URL . 'views/etat/inventaire_stock_par_category.php' ?>"><i class="glyph-icon  iconsmind-Billing"></i> Inventaire Stock </a></li>
                <li><a target="_blank" href="<?php echo BASE_URL . 'views/etat/stock_par_category.php' ?>"><i class="glyph-icon  iconsmind-Billing"></i>Stock par catégorie</a></li>
                <li id='inventaire_depot' style="cursor:pointer; "><a data-url="etat/inventaire_depot.php" class="url sub"> <i class="glyph-icon simple-icon-chart"></i> Inventaire Depot </a></li>
                <?php  } ?>

            </ul>
        </div>
    </div>
</div>