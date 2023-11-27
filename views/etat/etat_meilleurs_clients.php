<?php
include("../../evr.php");
function dateFormat($dat){
$date = new DateTime($dat);

return $date->format('d-m-Y');
}
function design_ar($design,$design_ar){
  if ($design==''&& $design_ar!='') {
    echo $design_ar;
  }
  if ($design!=''&& $design_ar!='') {
    echo "/ ".$design_ar;
  }
}
?>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<link rel = "icon" href ="<?php echo BASE_URL . 'asset/img/icon.png' ?>"
        type = "image/x-icon">	
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title> 

 
 <style type="text/css">
 .tableform{background-color:#999999; width:400px; margin:150px auto; }
 .inputText{height:22px; width:80%; border-radius:3px;margin-top:10px;}
 .button{height:25px; width:30%; border-radius:3px;margin-top:10px; font-weight:bold;}
 .button:hover{color:#666666; cursor:pointer;}
 h3{text-decoration:underline;text-transform:uppercase;}
 .datatables{border-collapse:collapse; width:100%;}
 .row{background-color:#CCCCCC;}
 .montant{text-align:right;}
 </style>
 
</head>

<body style="width:950px;margin:auto;">

<?php if(isset($_POST['dd'])){ ?>
<h3 align="center"  > Etat des Meilleurs Clients du <?php echo dateFormat( $_POST['dd']); ?> a <?php echo dateFormat($_POST['df']); ?> .</h3>
 <fieldset><legend></legend>
<table class="datatables"  border=1  >
	<tr class="row">
		<th width="33%"> Clients</th> 
		<th width="33%"> Montant Achetées</th> 
        <th width="33">Qte Achetée </th>
   </tr>
	
<?php
// debug("select c.nom , sum(da.prix_produit  *  da.qte_vendu) as total_montant_achetés , sum( da.qte_vendu) as total_quantité from client c , vente v , detail_vente da 
// where c.id_client = v.id_client and v.id_vente = da.id_vente and v.date_vente between ".  '"'.(String)$_POST['dd']. '"' . " and ". '"' . (String)$_POST['df']. '" ') ; 
$data = connexion::getConnexion()->query("select c.nom , sum(da.prix_produit  *  da.qte_vendu) as total_montant_achetes , sum( da.qte_vendu) as total_quantite from client c , vente v , detail_vente da 
where c.id_client = v.id_client and v.id_vente = da.id_vente and v.date_vente between ".  '"'.$_POST['dd']. '"' . " and ". '"' . $_POST['df']. '" order by total_montant_achetes desc limit 10  ')->fetchAll(PDO::FETCH_OBJ) ;  
foreach ($data as $client ) { ?>
<tr >
	<td  class ="montant"> <?php echo $client->nom ?></td>
	<td  class ="montant"><?php echo $client->total_montant_achetes?></td>
	<td  class ="montant"><?php echo $client->total_quantite ?></td>
</tr>
<?php }?>
</table>


</fieldset>

 
<?php }else{ include("form_date.php"); } ?>
</body>

</html>