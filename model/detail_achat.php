<?php
class  detail_achat extends table{
  
protected $id_detail; 
protected $id_achat;
protected $id_produit;
protected $id_depot;
protected $prix_produit;
protected $devise_produit;
protected $qte_achete;
protected $date_expiration;
protected $cout_device;
protected $f_approch;
protected $id_user;
protected $prix_revient ; 



public function selectAllNonValide(){
	$result=connexion::getConnexion()->query("SELECT dp.nom AS depot, da.id_detail ,da.date_expiration ,da.id_produit, p.tva, p.designation,p.poid,da.prix_produit,da.qte_achete ,da.devise_produit  FROM 
	  detail_achat da left join produit p on (p.id_produit=da.id_produit) 
	  LEFT JOIN depot dp ON dp.id = da.id_depot
	  where
	   da.id_achat=-1".$_SESSION["rand_a_er"]." and da.id_user=".$_SESSION["gs_id"]." order by da.id_detail desc");
	return $result->fetchAll(PDO::FETCH_OBJ);
	} 
	
public function selectAllValide($id){
	$result=connexion::getConnexion()->query("SELECT dp.nom AS depot, da.devise_produit, da.id_detail,
	da.id_produit,p.designation,da.prix_produit,da.qte_achete ,da.cout_device, da.valide ,  da.date_validation ,  da.prix_revient , 
  (a.montant * da.cout_device) as montant_achat , 
  sum(qte_achete) as qte_total
  FROM 
  detail_achat da 
    left join produit p on (p.id_produit=da.id_produit) 
   LEFT JOIN depot dp ON dp.id = da.id_depot
   LEFT JOIN achat a on a.id_achat = da.id_achat 
   
  where da.id_achat=".$id." 
  group by da.id_detail 
  order by da.id_detail desc 
");
	return $result->fetchAll(PDO::FETCH_OBJ);
	} 	
public  function gettotale($id){
  $result=connexion::getConnexion()->query("select sum(`prix_produit`*`qte_achete`)as totale from `detail_achat` WHERE `id_achat`=".$id." group by `id_achat`");
	return $result->fetch(PDO::FETCH_ASSOC);
}
  
}
?>