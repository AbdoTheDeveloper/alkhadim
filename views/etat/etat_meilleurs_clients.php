<?php
include("../../evr.php");
function dateFormat($dat)
{
  $date = new DateTime($dat);

  return $date->format('d-m-Y');
}
function design_ar($design, $design_ar)
{
  if ($design == '' && $design_ar != '') {
    echo $design_ar;
  }
  if ($design != '' && $design_ar != '') {
    echo "/ " . $design_ar;
  }
}
?>
<!DOCTYPE html
  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <link rel="icon" href="<?php echo BASE_URL . 'asset/img/icon.png' ?>" type="image/x-icon">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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

  <?php if (isset($_POST['dd'])) { ?>
    <h3 align="center"> Etat des Meilleurs Clients du
      <?php echo dateFormat($_POST['dd']); ?> a
      <?php echo dateFormat($_POST['df']); ?> .
    </h3>
    <fieldset>
      <legend></legend>
      <table class="datatables" border=1>
        <tr class="row">
          <th width="16%"> Clients</th>
          <th width="16%"> Montant Achetées</th>
          <th width="16%">Qte Achetée </th>
          <th width="16%">Avance </th>
          <th width="16%">Reste </th>

        </tr>

        <?php

        $data = connexion::getConnexion()->query("SELECT    c.nom,
Sum(da.prix_produit * da.qte_vendu) AS total_montant_achetes,
Sum(da.qte_vendu)                   AS total_quantite,
Sum(r.montant)                      AS avance
FROM      client c
LEFT JOIN vente v
ON        v.id_client = c.id_client
LEFT JOIN detail_vente da
ON        v.id_vente = da.id_vente
LEFT JOIN reg_vente r
ON        r.id_vente = v.id_vente
WHERE     v.date_vente BETWEEN " . '"' . $_POST['dd'] . '"' . " AND  " . '"' . $_POST['df'] . '"' . "
ORDER BY  total_montant_achetes DESC limit 10")->fetchAll(PDO::FETCH_OBJ);
        foreach ($data as $client) {
          $reste = 0;
          if ($client->avance) {
            $reste = $client->total_montant_achetes - $client->avance;
          }
          ?>

          <tr>
            <td style="text-align: center">
              <?php echo $client->nom ?>
            </td>
            <td style="text-align: center">
              <?php echo $client->total_montant_achetes ?>
            </td>
            <td style="text-align: center">
              <?php echo $client->total_quantite ?>
            </td>
            <td style="text-align: center">
              <?php echo $client->avance ? $client->avance : 0 ?>
            </td>
            <td style="text-align: center">
              <?php echo $reste ?>
            </td>
          </tr>
          </tr>
        <?php } ?>
      </table>


    </fieldset>


  <?php } else {
    include("form_date.php");
  } ?>
</body>

</html>