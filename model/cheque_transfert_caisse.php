<?php
class cheque_transfert_caisse extends table
{
   public $id;
   public $montant_cheque;
   public $num_cheque;
   public $id_transfert_caisse;
   public function selectByIdTransfertCaisse($id)
	{
		$result = connexion::getConnexion()->query("select * from cheque_transfert_caisse where id_transfert_caisse = " . $id);
		if ($result) return $result->fetchAll(PDO::FETCH_OBJ);
	}
   public function deletebyIdTransfertCaisse($id)
   {
       connexion::getConnexion()->query("delete from cheque_transfert_caisse where id_transfert_caisse  = ".  $id );      
   }

}


?>