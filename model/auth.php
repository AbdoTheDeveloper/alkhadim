<?php
class auth {

		  
	 public static function user()
	 {      
	 	if (isset($_SESSION['gs_login'])) {
	 	
	 	$user = array(
	 		"login" => $_SESSION['gs_login'], 
	 		"id" => $_SESSION['gs_id'], 
	 		"email" => $_SESSION['gs_email'], 
	 		"nom" => $_SESSION['gs_nom'], 
	 		"tele" => $_SESSION['gs_tele'], 
	 		"privilege" => $_SESSION['gs_privilege'], 
	 		"client" => $_SESSION['gs_client'], 
	 		"fournisseur" => $_SESSION['gs_fournisseur'], 
	 		"produit" => $_SESSION['gs_produit'], 
	 		"achat" => $_SESSION['gs_achat'], 
	 		"vente" => $_SESSION['gs_vente'], 
	 		"charge" => $_SESSION['gs_charge'], 
	 		"avoir" => $_SESSION['gs_avoir'] , 
			"caisse" => $_SESSION['gs_caisse'] ,
			"depot" => $_SESSION['gs_depot'] , 
			"ancienne_vente" => $_SESSION['gs_ancienne_vente'] ,
			"bon_commande" => $_SESSION['gs_bon_commande'] ,
			"devis" => $_SESSION['gs_devis'] ,
			"achat_vente" => $_SESSION['gs_achat_vente'] ,
			"commande_vendeur" => $_SESSION['gs_commande_vendeur'] ,
			"bon_livraison" => $_SESSION['gs_bon_livraison'] ,
			"reglement" => $_SESSION['gs_reglement'] ,
			"facture" => $_SESSION['gs_facture'] ,
			"transfert_caisse" => $_SESSION['gs_transfert_caisse'] ,
			"recette_point_vente" => $_SESSION['gs_recette_point_vente'] ,
			"annulation" => $_SESSION['gs_annulation'] , 
			"etat" => $_SESSION['gs_etat'] , 
			"utilisateur" => $_SESSION['gs_utilisateur']
		);

	 
	 	return $user;
	 
	 	}

	 }


	public static function login($user)
	 {      

	 	
			 $_SESSION['gs_login'] = $user->login;
			 $_SESSION['gs_id'] = $user->id;
			 $_SESSION['gs_email'] = $user->email;
			 $_SESSION['gs_nom'] = $user->nom;
			 $_SESSION['gs_tele'] = $user->tele;
			 $_SESSION['gs_privilege'] = $user->privilege;
			 $_SESSION['gs_client'] = $user->client;
			 $_SESSION['gs_fournisseur'] = $user->fournisseur;
			 $_SESSION['gs_produit'] = $user->produit;
			 $_SESSION['gs_achat'] = $user->achat;
			 $_SESSION['gs_vente'] = $user->vente;
			 $_SESSION['gs_charge'] = $user->charge;
			 $_SESSION['gs_avoir'] = $user->avoir;
			 $_SESSION['gs_depot'] = $user->depot;
			 $_SESSION['gs_ancienne_vente'] = $user->ancienne_vente;
			 $_SESSION['gs_devis'] = $user->devis;
			 $_SESSION['gs_achat_vente'] = $user->achat_vente;
			 $_SESSION['gs_bon_commande'] = $user->bon_commande;
			 $_SESSION['gs_commande_vendeur'] = $user->commande_vendeur;
			 $_SESSION['gs_bon_livraison'] = $user->bon_livraison;
			 $_SESSION['gs_reglement'] = $user->reglement;
			 $_SESSION['gs_facture'] = $user->facture;
			 $_SESSION['gs_caisse'] = $user->caisse ;
			 $_SESSION['gs_transfert_caisse'] = $user->transfert_caisse ;
			 $_SESSION['gs_recette_point_vente'] = $user->recette_point_vente;
			 $_SESSION['gs_annulation'] = $user->annulation;
			 $_SESSION['gs_etat'] = $user->etat;
			 $_SESSION['gs_utilisateur'] = $user->utilistaeur;




	 }

	public static function logout()
	 {  
             unset($_SESSION['gs_login']);
             unset($_SESSION['gs_email']);
             unset($_SESSION['gs_nom']);
             unset($_SESSION['gs_tele']);
			 unset($_SESSION['gs_id']);
			 unset($_SESSION['gs_privilege']);
			 unset($_SESSION['gs_client']);
			 unset($_SESSION['gs_fournisseur']);
			 unset($_SESSION['gs_produit']);
			 unset($_SESSION['gs_achat']);
			 unset($_SESSION['gs_vente']);
			 unset($_SESSION['gs_charge']);
			 unset($_SESSION['gs_avoir']);
			 unset($_SESSION['gs_depot']);
			 unset($_SESSION['gs_ancienne_vente']);
			 unset($_SESSION['gs_devis']);
			 unset($_SESSION['gs_achat_vente']);
			 unset($_SESSION['gs_bon_commande']);
			 unset($_SESSION['gs_commande_vendeur']);
			 unset($_SESSION['gs_bon_livraison']);
			 unset($_SESSION['gs_reglement']);
			 unset($_SESSION['gs_facture']);
			 unset($_SESSION['gs_caisse']);
			 unset($_SESSION['gs_transfert_caisse']);
			 unset($_SESSION['gs_recette_point_vente']);
			 unset($_SESSION['gs_annulation']);
			 unset($_SESSION['gs_etat']);
			 unset($_SESSION['gs_utilisateur']);
	 }

	 }
 


?>