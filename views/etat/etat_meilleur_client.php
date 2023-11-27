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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
        <h3 align="center"> Meilleurs clients du <?php echo dateFormat($_POST['dd']); ?> à <?php echo dateFormat($_POST['df']); ?> .</h3>
        <table class="datatables" border=1>
            <tr class="row">
                <th width="33%"> Client</th>
                <th width="33%"> Qte Article achetés </th>
                <th width="33%">Montant acheté </th>
                <!-- <th width="17%"> TTC </th> -->
                <!-- <th width="17%"> Avance </th>
                <th width="16%"> Reste</th> -->
            </tr>
        </table>
        <tbody>
        <?php
        debug("select c.nom_prenom_ar , sum(da.qte_vendu) as quantité_totale  , sum(da.prix_produit * da.qte_vendu) as montant_acheté , sum(r.montant) as avance from client c ,vente v , detail_vente da  , 
        reg_vente r where v.id_vente  = da.id_vente and  r.id_vente = v.id_vente and v.date_vente between " . $_POST['dd'] . " and " .  $_POST['df'])   ; 
        $data  = connexion::getConnexion()->query("select c.nom_prenom_ar , sum(da.qte_vendu) as quantité_totale  , sum(da.prix_produit * da.qte_vendu) as montant_acheté , sum(r.montant) as avance from client c ,vente v , detail_vente da  , 
                                                      reg_vente r where v.id_vente  = da.id_vente and  r.id_vente = v.id_vente and v.date_vente between " . $_POST['dd'] . " and " .  $_POST['df'])->fetchAll(PDO::FETCH_OBJ);

        if($data){ 
        foreach ($data as $key => $value) { ?>
            <tr>
                <td><?=$value->nom_prenom_ar?></td>
                <td><?=$value->quantité_totale?></td>
                <td><?=$value->montant_acheté?></td>
            </tr>
          <?php  
        }
    }
        ?>

    <?php } else {
        include("form_date.php");
    } ?>
</body>

</html>