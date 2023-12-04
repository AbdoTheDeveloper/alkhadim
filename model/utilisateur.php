<?php
class utilisateur extends table{
protected $id;
protected $login;
protected $pwd;
protected $privilege;
protected $idu;
protected $achat;
protected $vente;
protected $client;
protected $fournisseur;
protected $produit;
protected $avoir;
protected $charge;
protected $nom;
protected $tele;
protected $email;
protected $bloque  ; 
protected $id_zone ;   
protected $depot ;
protected $ancienne_vente ;
protected $devis ;
protected $achat_vente ;
protected $bon_commande ;
protected $commande_vendeur ;
protected $bon_livraison ;
protected $reglement ;
protected $facture ;
protected $caisse ;
protected $transfert_caisse ;
protected $recette_point_vente ;
protected $annulation ;
protected $mouvement_caisse ;
protected $etat_vente ; 
protected $etat_bon_livraison ; 
protected $etat_commande_vendeur ;
protected $etat_vente_impayes;
protected $etat_achat ;
protected $magazinier ;
protected $vente_par_employe ;
protected $vente_achat_par_employe ; 
protected $vente_par_categorie ;
protected $inventaire_stock ;
protected $inventaire_depot ;
protected $cheque_vente  ; 
protected $cheque_achat  ; 
protected $stock_par_categorie  ; 
protected $etat ; 
protected $utilisateur ;   
protected $modifier ; 
protected $supprimer ; 



public function selectAllUtilisateur($moi){
$result=connexion::getConnexion()->query("select * from utilisateur where id <>'".$moi."' order by idu desc");
return $result->fetchAll(PDO::FETCH_OBJ);
}
}
?>