<?php
include('../../evr.php');


if ($_POST['act'] == 'filter') {
  $Transfert_caisse = new transfert_caisse();

  if ($_POST['anne'] != 0)
    $data = $Transfert_caisse->selectAll3($_POST['anne'] . "-" . $_POST['mois'], 1);
  else
    $data = $Transfert_caisse->selectAll3($_POST['mois'], 0);



  ?>
  <table class="table  responsive table-striped table-bordered table-hover" id="datatables">
    <thead>
      <tr>

        <th>NR°</th>
        <th>Mode</th>
        <th>Designation</th>
        <th>Date caisse</th>
        <th>Montant</th>
        <th>Remarque</th>
        <th style="width: 85px;">Action</th>
      </tr>
    </thead>
    <tbody>


      <?php
      foreach ($data as $Transfert_caisse) {


        ?>
        <tr>
          <td>
            <?php echo $Transfert_caisse->id ?>
          </td>
          <td>
            <?php echo $Transfert_caisse->type_reg ?>
          </td>

          <td>
            <?php echo $Transfert_caisse->designation ?>
          </td>

          <td>
            <?php echo $Transfert_caisse->date_transfert_caisse ?>
          </td>
          < <td>
            <?php echo $transfert_caisse->montant_espece ?>
            </td>
            <td>
              <?php
              if ($transfert_caisse->montant_espece)
                echo $transfert_caisse->montant_espece * $transfert_caisse->devise ?>
              </td>
              <td>
              <?php echo $Transfert_caisse->remarque ?>
            </td>
            <td>
              <a class="badge badge-info mb-2  " style="color: white;cursor: pointer;" title="Imprimmer"
                href="<?php echo BASE_URL . "views/caisse/etat.php?id=" . $Transfert_caisse->id; ?>" target="_black">

                <i class=" simple-icon-printer" style="font-size: 15px;"></i>

              </a>
              <?php if (auth::user()['privilege'] == 'Admin') { ?>
                <a class="badge badge-danger mb-2 delete" data-id="<?php echo $Transfert_caisse->id; ?>"
                  style="color: white;cursor: pointer;" title="Supprimer" href='javascript:void(0)'>
                  <i class="simple-icon-trash" style="font-size: 15px;"></i>
                </a>

              <?php } ?>

              <a class="badge badge-warning mb-2  url notlink"
                data-url="tranfert_caisse/update.php?id=<?php echo $Transfert_caisse->id; ?>"
                style="color: white;cursor: pointer;" title="Modifier" href="javascript:void(0)">
                <i class="iconsmind-Pen-5" style="font-size: 15px;"> </i>
              </a>

              <?php if ($Transfert_caisse->image != '' || $Transfert_caisse->deux_image != '') {
                $img = $Transfert_caisse->image != '' ? $Transfert_caisse->image : $Transfert_caisse->deux_image; ?>
                <a class="badge badge-success " data-fancybox
                  data-caption="<?php echo $Transfert_caisse->designation; ?> <br> Prix : <?php echo $Transfert_caisse->montant ?> DH"
                  style="color: white;cursor: pointer;" title="<?php echo $Transfert_caisse->designation; ?>"
                  href="<?php echo BASE_URL . 'upload/caisse/' . $img; ?>">
                  <i class="simple-icon-picture" style="font-size: 15px;"> </i>
                </a>
              <?php } ?>
            </td>
        </tr>
      <?php } ?>
    </tbody>
  </table>
  <?php
} elseif ($_POST['act'] == 'insert') {
  $dossier = '../../upload/caisse/';

  if ($_FILES['image']['name'] != "") {
    $fichier = md5(uniqid());
    $extension = strrchr($_FILES['image']['name'], '.');
    if (move_uploaded_file($_FILES['image']['tmp_name'], $dossier . $fichier . $extension)) {
      $_POST["image"] = $fichier . $extension;
    }
  }

  $_POST["id_user"] = auth::user()["id"];

  $Transfert_caisse = new transfert_caisse();
  $Transfert_caisse->insert();
  $id = $Transfert_caisse->laset_insert();
  $effet_transfert_caisse = new effet_transfert_caisse();
  $cheque_transfert_caisse = new cheque_transfert_caisse();

  foreach ($_POST['montant_effet'] as $key => $value) {
    $effet_transfert_caisse->id_transfert_caisse = $cheque_transfert_caisse->id_transfert_caisse = $_POST['id_transfert_caisse'] = (int) $id;
    $effet_transfert_caisse->montant_effet = $_POST['montant_effet'][$key];
    $effet_transfert_caisse->num_effet = $_POST['num_effet'][$key];
    $effet_transfert_caisse->insert();
  }

  foreach ($_POST['montant_cheque'] as $key => $value) {
    $effet_transfert_caisse->id_transfert_caisse = $cheque_transfert_caisse->id_transfert_caisse = $_POST['id_transfert_caisse'] = (int) $id;
    $cheque_transfert_caisse->montant_cheque = $_POST['montant_cheque'][$key];
    $cheque_transfert_caisse->num_cheque = $_POST['num_cheque'][$key];
    $cheque_transfert_caisse->insert();
  }

  die("success");
} elseif ($_POST['act'] == 'update') {
  try {

    $dossier = '../../upload/caisse/';

    if ($_FILES['image']['name'] != "") {
      $fichier = md5(uniqid());
      $extension = strrchr($_FILES['image']['name'], '.');
      if (move_uploaded_file($_FILES['image']['tmp_name'], $dossier . $fichier . $extension)) {
        $_POST["image"] = $fichier . $extension;
      }
    }

    // instantiation d'un objet du classe transfert_caisse 
    $Transfert_caisse = new transfert_caisse(); 
    $Transfert_caisse->update($_POST["id"]);
    $id = (int) $_POST["id"];

     // instantiation d'un objet du classe effet_transfert_caisse 
    $effet_transfert_caisse = new effet_transfert_caisse();
    // instantiation d'un objet du classe cheque_transfert_caisse 
    $cheque_transfert_caisse = new cheque_transfert_caisse;
 
    
    $effet_transfert_caisse->deletebyIdTransfertCaisse($id);
    $cheque_transfert_caisse->deletebyIdTransfertCaisse($id);


    foreach ($_POST['montant_effet'] as $key => $value) {
      if ($_POST['montant_effet'][$key] != "" && $_POST['num_effet'][$key] != "" ) {
        $effet_transfert_caisse->id_transfert_caisse = $cheque_transfert_caisse->id_transfert_caisse = $_POST['id_transfert_caisse'] = (int) $_POST['id'];
        $effet_transfert_caisse->montant_effet = $_POST['montant_effet'][$key];
        $effet_transfert_caisse->num_effet = $_POST['num_effet'][$key];
        $effet_transfert_caisse->insert();
      }

    }

    foreach ($_POST['montant_cheque'] as $key => $value) {
      if (!empty($_POST['montant_cheque'][$key]) && !empty($_POST['num_cheque'][$key])) {
      $effet_transfert_caisse->id_transfert_caisse = $cheque_transfert_caisse->id_transfert_caisse = $_POST['id_transfert_caisse'] = (int) $_POST['id'];
      $cheque_transfert_caisse->montant_cheque = $_POST['montant_cheque'][$key];
      $cheque_transfert_caisse->num_cheque = $_POST['num_cheque'][$key];
      $cheque_transfert_caisse->insert();
      }
    }
    die('success');
  } catch (Exception $e) {
    die($e);

  }
} elseif ($_POST['act'] == 'delete') {
  try {

    $Transfert_caisse = new transfert_caisse();
    $Transfert_caisse->delete($_POST["id"]);
    die('success');
  } catch (Exception $e) {
    die($e);
  }
}
?>