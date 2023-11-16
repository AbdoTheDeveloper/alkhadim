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

public function selectAllNonValide(){
	$result=connexion::getConnexion()->query("SELECT dp.nom AS depot, da.id_detail ,da.date_expiration ,da.id_produit, p.tva, p.designation,p.poid,da.prix_produit,da.qte_achete ,da.devise_produit  FROM 
	  detail_achat da left join produit p on (p.id_produit=da.id_produit) 
	  LEFT JOIN depot dp ON dp.id = da.id_depot
	  where
	   da.id_achat=-1".$_SESSION["rand_a_er"]." and da.id_user=".$_SESSION["gs_id"]." order by da.id_detail desc");
	return $result->fetchAll(PDO::FETCH_OBJ);
	} 
	
public function selectAllValide($id){
	$result=connexion::getConnexion()->query("
	SELECT 
    dp.nom AS depot, 
    da.id_detail, 
    da.id_produit, 
    p.designation, 
    da.prix_produit, 
    da.qte_achete, 
    da.valide, 
    da.date_validation, 
    a.montant AS montant_achat ,
    sum(da.qte_achete) as qte_total  , 
    (select sum(montant) from charge where id_achat  = da.id_achat ) as charge_total 
FROM 
    detail_achat da 
    LEFT JOIN produit p ON p.id_produit = da.id_produit 
    LEFT JOIN achat a ON a.id_achat = da.id_achat 
    LEFT JOIN depot dp ON dp.id = da.id_depot 
WHERE 
    da.id_achat = $id
ORDER BY 
    da.id_detail DESC
");
	return $result->fetchAll(PDO::FETCH_OBJ);
	} 	
public  function gettotale($id){
  $result=connexion::getConnexion()->query("select sum(`prix_produit`*`qte_achete`)as totale from `detail_achat` WHERE `id_achat`=".$id." group by `id_achat`");
	return $result->fetch(PDO::FETCH_ASSOC);
}
  
}
?>