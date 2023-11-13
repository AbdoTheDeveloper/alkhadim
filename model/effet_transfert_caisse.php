<?php
class effet_transfert_caisse extends table
{
    public $id;
    public $montant_effet;
    public $num_effet;
    public $id_transfert_caisse;

    public function selectByIdTransfertCaisse($id)
	{
        $result = connexion::getConnexion()->query("select * from effet_transfert_caisse where id_transfert_caisse = ". $id  );
		if ($result) return $result->fetchAll(PDO::FETCH_OBJ);
	}
    public function deletebyIdTransfertCaisse($id)
   {
       connexion::getConnexion()->query("delete from effet_transfert_caisse where id_transfert_caisse  = ".  $id );      
   }

}



?>