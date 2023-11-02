<?php
include("../../evr.php");
function dateFormat($dat) {
   $date = new DateTime($dat);

   return $date->format('d-m-Y');
}

function design_ar($design, $design_ar) {
   if($design == '' && $design_ar != '') 
   {
      echo $design_ar;
   }
   if($design != '' && $design_ar != '') 
   {
      echo "/ " . $design_ar;
   }
}

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <link rel = "icon" href ="<?php echo BASE_URL . 'asset/img/icon.png' ?>"
        type = "image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
  

    <style type="text/css">
        .tableform {
            background-color: #999999;
            width: 400px;
            margin: 150px auto;
        }

        .inputText {
            height: 22px;
            width: 80%;
            border-radius: 3px;
            margin-top: 10px;
        }

        .button {
            height: 25px;
            width: 30%;
            border-radius: 3px;
            margin-top: 10px;
            font-weight: bold;
        }

        .button:hover {
            color: #666666;
            cursor: pointer;
        }

        h3 {
            text-decoration: underline;
            text-transform: uppercase;
        }

        .datatables {
            border-collapse: collapse;
            width: 100%;
        }

        .row {
            background-color: #CCCCCC;
        }

        .montant {
            text-align: right;
        }
    </style>

</head>

<body style="width:950px;margin:auto;">


<h3 align="center"> liste des clients impayés </h3>

<table class="datatables" border=1>
    <tr class="row" style="height: 50px">
        <th width="25%"> Nom  </th>
        <th width="25%"> Montant </th>
        <th width="25%"> Avance </th>
        <th width="25%"> Reste </th>
    </tr>
</table>

<?php
$eleveurs = new client();
if(isset($_GET['id_client'])) {
   $data_eleveurs = $eleveurs->selectById2($_GET['id_client']);
} else {
   $data_eleveurs = $eleveurs->selectAllImp();
}
$total_montant = 0;
$total_avance = 0;
foreach($data_eleveurs as $rep_eleveurs) 
{
   $vente = new vente();
   $data = $vente->selectAllDate_er($rep_eleveurs->id_client);

   $montant = 0;
   $avance = 0;
   foreach($data as $rep) {
      // if($rep->numbon!=0){
          $montant += $rep->montantv*1.2;
          $query = $result = connexion::getConnexion()->query("SELECT sum(montant) as paye FROM reg_vente where id_vente=" . $rep->id_vente);
          $result = $query->fetch(PDO::FETCH_OBJ);
          $avance += $result->paye;
       //}

   } ?>
   <?php

   $rest = $montant/1.2 - $avance;

   if($rest >= 50) { ?>


    <?php
     $total_montant += $montant;
     $total_avance += $avance;

     ?>
       <table class="datatables" border=1>
           <tr style="height: 36px">
               <th width="25%"><?php echo $rep_eleveurs->nom . " " . $rep_eleveurs->prenom; ?><?php design_ar($rep_eleveurs->nom . " " . $rep_eleveurs->prenom, $rep_eleveurs->nom_prenom_ar); ?></th>
               <th width="25%"> <?php echo number_format($montant/1.2, 2, '.', ' '); ?></th>
               <th width="25%"> <?php echo number_format($avance, 2, '.', ' '); ?> </th>
               <th width="25%"> <?php echo number_format($montant/1.2 - $avance, 2, '.', ' '); ?> </th>
           </tr>
       </table>


   <?php } ?>


   
<?php } ?>
<br><br>

    <table class="datatables" border=1>
        <tr class="row" style="height: 50px">
            <th width="25%" colspan="2">Total G&eacute;n&eacute;rale </th>
            <th width="25%" class="montant"> <?php echo number_format($total_montant/1.2, 2, '.', ' '); ?></th>
            <th width="25%" class="montant"> <?php echo number_format($total_avance, 2, '.', ' '); ?> </th>
            <th width="25%"
                class="montant"> <?php echo number_format($total_montant/1.2 - $total_avance, 2, '.', ' '); ?> </th>
        </tr>
    </table>



</body>

</html>