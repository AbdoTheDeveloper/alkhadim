<?php
class boncommande extends table
{
    protected $id_bon;
	protected $id_client;
	protected $date_bon;
	protected $remarque;
	protected $id_user;
	protected $numbon;
	protected $remarquebon;
	
	public function selectAll3($date) 
	{
	   $date_parts = explode('-', $date);
	   $year = $date_parts[0];
	   $month = $date_parts[1];
	   
	   if($month != 0)
	   {
		  $dateCondition = "DATE_FORMAT(c.date_bon,'%Y-%m') = '$year-$month'";  
	   }
	   else
	   {
		  $dateCondition = "DATE_FORMAT(c.date_bon,'%Y') = '$year'";
	   }
		  $result = connexion::getConnexion()->query("SELECT t1.*,t2.avance from 
	(select c.id_bon,c.numbon,DATE_FORMAT(c.date_bon,'%d-%m-%Y')as date_bon,concat_ws(' ',cl.nom,cl.prenom)  as client
		,c.id_client,cl.nom_prenom_ar,c.remarque  ,sum(dc.prix_produit*dc.qte_vendu*(1-dc.remise/100)) as montantv ,
	   sum(dc.prix_produit*(if(dc.valunit=0,dc.qte_vendu,dc.valunit))*(1-dc.remise/100) )as motunitv from boncommande c 
	left join client cl on cl.id_client=c.id_client 
	inner join detail_commande dc on dc.id_bon= c.id_bon 
	inner join produit p on dc.id_produit=p.id_produit
	where  $dateCondition
	group by  c.id_bon  order by id_bon desc  ) as t1 
	left join (select id_bon,ifnull(sum(montant),0) as avance 
	from reg_commande group by id_bon ) as t2 
	on t2.id_bon=t1.id_bon ");

		  return $result->fetchAll(PDO::FETCH_OBJ);
   }
	
   public function selectAll3all() 
	{

		  $result = connexion::getConnexion()->query("SELECT t1.*,t2.avance from 
	(select c.id_bon,c.numbon,DATE_FORMAT(c.date_bon,'%d-%m-%Y')as date_bon,concat_ws(' ',cl.nom,cl.prenom)  as client
		,c.id_client,cl.nom_prenom_ar,c.remarque  ,sum(dc.prix_produit*dc.qte_vendu*(1-dc.remise/100)) as montantv ,
	   sum(dc.prix_produit*(if(dc.valunit=0,dc.qte_vendu,dc.valunit))*(1-dc.remise/100) )as motunitv from boncommande c 
	left join client cl on cl.id_client=c.id_client 
	inner join detail_commande dc on dc.id_bon= c.id_bon 
	inner join produit p on dc.id_produit=p.id_produit
	group by  c.id_bon  order by id_bon desc  ) as t1 
	left join (select id_bon,ifnull(sum(montant),0) as avance 
	from reg_commande group by id_bon ) as t2 
	on t2.id_bon=t1.id_bon ");

		  return $result->fetchAll(PDO::FETCH_OBJ);
   }
   public function selectBonsClient($id_client)
   {
	   $result = connexion::getConnexion()->query("SELECT * FROM boncommande WHERE id_client = " . $id_client . " ORDER BY id_bon DESC");
	   
	   return $result->fetchAll(PDO::FETCH_OBJ);
   }

	public function regelements($dd, $df)
	{
		$regbon=connexion::getConnexion()->query("SELECT r.*, c.*  FROM client c,reg_commande r ,boncommande b WHERE r.id_bon = b.id_bon AND b.id_client = c.id_client AND date_reg BETWEEN '". $dd ."' and '" . $df . "' order by id_bon Desc")->fetchAll(PDO::FETCH_ASSOC);
		
		return $regbon;
	}
	
}

?>