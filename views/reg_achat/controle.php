<?php
include('../../evr.php');




if ($_POST['act']=='insert') {
	try {
		
	 if ($_POST['date_validation']=='') {
   $_POST['date_validation'] = '1900-01-01';
   }
 if (empty($_POST['num_cheque'])) {
 	
   $_POST['num_cheque'] = 0;
   }

	$achat = new achat();
	$_POST["id_user"] =auth::user()["id"] ;
   $reg_achat = new reg_achat();
   $reg_achat->insert();
   //$i = 0;
   $montant = $_POST["montant"];
   $montant_t = $_POST["montant"];
   if($_POST["remarque"] =="") {
      $_POST["remarque"] = "Reglement global [ Montant : " . $montant_t . "/Mode de Reglement : " . $_POST["mode_reg"] . "/Date : " . $_POST["date_reg"] . "]";
   }

  

  



		die('success');
		} catch (Exception $e) {
				die($e);
		
	}
}
elseif ($_POST['act']=='update') {
	try {
		
		$reg_achat=new reg_achat();
 		$reg_achat->update($_POST["id"]);
		die('success');
		} catch (Exception $e) {
				die($e);
		
	}
}
elseif ($_POST['act']=='delete') {
	try {
		
		$reg_achat=new reg_achat();
		$reg_achat->delete($_POST["id"]);
		die('success');
		} catch (Exception $e) {
				die($e);
	}
}




?>