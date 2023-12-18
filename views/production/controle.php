<?php
include('../../evr.php');

  if($_POST['act'] == "valide_detail_commande"){ 
    $_POST['code_bar'] = generateRandomString(8) ;
    $_POST['id_bon_commande'] = (int) $_POST['id_bon_commande'] ; 
    $_POST['id_detail_commande'] = (int) $_POST['id_detail_commande'] ; 
    $_POST['id_client'] = (int) $_POST['id_client'] ; 
    $_POST['qte'] = (Float) $_POST['qte'] ; 
    $_POST['id_lot'] = NULL ; 
    if($_POST['valide'] == 0){
      $production  = new production() ; 
      $production->insert() ; 
      connexion::getConnexion()->exec("update detail_commande set valide = 1  where id_detail = " . $_POST['id_detail_commande']) ; 
    }
    die("success ") ; 
  }
if($_POST['act'] == "get_bon_commandes"){

  $bon_commande = new boncommande() ;
if(isset($_POST['anne']) &&!empty($_POST['anne'])){
  if($_POST['anne'] != 0)
  {
  $data = $bon_commande->get_commandes_by_client($_POST['anne'] . "-" . $_POST['mois'] , $_POST['id_client']);
  }
  if($_POST['anne']==0)
  $data = $bon_commande->selectAll3allByClient($_POST['id_client']);
}else{
  $data=$bon_commande->get_commandes_by_client(date('Y') . '-' . date('m') , $_POST['id_client']);
} 
?>
 <table class="table  responsive table-striped table-bordered table-hover " id="datatables">
              <thead>
                <tr>
                  <th scope="col">Id</th>
                  <th scope="col">Client</th>
                  <th scope="col"> Montant</th>
                  <th scope="col"> Reste</th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
                <?php
                foreach ($data as $ligne) {
                ?>
                  <tr>
                    <td> <?php echo $ligne->id_bon; ?></td>
                    <td class="nowrap">
                      <a href="javascript:void(0)" class="badge badge-primary mb-1 url notlink" data-url="client/update.php?id=<?php echo $ligne->id_client; ?>"><?php echo $ligne->client;
                                                                                                                                                                  if ($ligne->nom_prenom_ar != "" && $ligne->client == " ") {
                                                                                                                                                                    echo $ligne->nom_prenom_ar;
                                                                                                                                                                  }
                                                                                                                                                                  if ($ligne->nom_prenom_ar != "" && $ligne->client != " ") {
                                                                                                                                                                    echo "/" . $ligne->nom_prenom_ar;
                                                                                                                                                                  }
                                                                                                                                                                  ?> </a>
                    </td>
                    <td style="text-align: right;" class="nowrap" data-href="#">
                      <a href="javascript:void(0)" class="badge badge-primary mb-1 url notlink" data-url="client/update.php?id=<?php echo $ligne->id_client; ?>">
                        <?php
                        if ($ligne->motunitv != 0 || !empty($ligne->motunitv)) {
                          echo number_format($ligne->motunitv, 2, '.', ' ');
                        } else {
                          echo number_format($ligne->montantv, 2, '.', ' ');
                        }
                        ?>
                      </a>
                      &nbsp;&nbsp;
                    </td>
                    <td style="text-align: right;"> <?php
                                                    $query = $result = connexion::getConnexion()->query("SELECT sum(montant) as paye FROM reg_commande where id_bon=" . $ligne->id_bon);
                                                    $result = $query->fetch(PDO::FETCH_OBJ);
                                                    $paye = $result->paye != null  ?  $result->paye : 0;
                                                    if ($ligne->motunitv != 0 || !empty($ligne->motunitv)) {
                                                      $tr = $ligne->motunitv - $paye;
                                                    } else {
                                                      $tr = $ligne->montantv - $paye;
                                                    }
                                                    $tr = ($tr < 0 && $tr >= -250) ? 0 : $tr;
                                                    echo number_format($tr, 2, '.', ' ');
                                                    ?> &nbsp;&nbsp;
                    </td>
                    <td class="nowrap">
                      <?php  //if (auth::user()['privilege'] == 'Gestionnaire_Bon_commande') { ?>
                        <a class="badge badge-secondary mb-2 url notlink" data-url="production/detail_index.php?id=<?php echo $ligne->id_bon; ?>" style="color: white;cursor: pointer;" title="voir Detail" href="javascript:void(0)">
                          <i class="glyph-icon simple-icon-list" style="font-size: 15px;"></i>
                        </a>
                      <?php // } ?>
                    </td>
                  </tr>
                <?php } ?>
              </tbody>
            </table>
<?php
}


function generateRandomString($length = 10) {
  $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  $randomString = '';
  for ($i = 0; $i < $length; $i++) {
      $randomString .= $characters[rand(0, strlen($characters) - 1)];
  }
   return $randomString;
}
?>
