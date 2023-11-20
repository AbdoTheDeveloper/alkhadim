<?php
include('../../evr.php');
if ($_POST['act'] == 'getproduit') {
  $depot = new depot();
  $res_depot = $depot->selectAll();
  foreach ($res_depot as $rep_depot) {
?>
    <optgroup label="<?php echo $rep_depot->nom; ?> ">
      <?php
      $produits = $depot->selectQuery("SELECT  id_produit,designation  FROM produit where   id_categorie=" . $_POST['id_categorie'] . " and   emplacement='" . $rep_depot->id . "' order by designation asc");
      foreach ($produits as $row) {
        echo '<option value="' . $row->id_produit . '">' . $row->designation . '</option>';
      } ?>
    </optgroup>
  <?php }
} elseif ($_POST['act'] == 'deleterow') {
  $detail_achat = new detail_achat();
  if (isset($_POST['id_detail'])) {
    $detail_achat->delete($_POST['id_detail']);
  }
  $data = $detail_achat->selectAllNonValide();
  $total = 0;
  foreach ($data as $ligne) {
  ?>
    <tr>
      <td><?php echo $ligne->designation; ?></td>
      <td><?php echo $ligne->prix_produit; ?></td>
      <td><?php echo $ligne->qte_achete; ?></td>
      <td><?php echo $ligne->poid * $ligne->qte_achete; ?> g </td>
      <td width="90" style="text-align: right;">
        <?php echo number_format($ligne->qte_achete * $ligne->prix_produit, 2, '.', ' ');
        $total += $ligne->qte_achete * $ligne->prix_produit;
        ?>
      </td>
      <td><a class="badge badge-danger mb-2 delete" data-id="<?php echo $ligne->id_detail; ?>" style="color: white;cursor: pointer;" title="Supprimer" href='javascript:void(0)'>
          <i class="simple-icon-trash" style="font-size: 15px;"></i></a> </td>
    </tr>
  <?php
  }
  ?>
  <tr>
    <td colspan="4" style="text-align: center;font-size: 15px;"> <b>Total</b> </td>
    <td style="text-align: right;" colspan="3"> <b style="font-size: 15px;color: green;text-align: right;"><?php echo number_format($total, 2, '.', ' '); ?></b></td>
  </tr>
  <?php
}
// ==========================================================================================================     Valider detail achat     ==============================================================================================================
elseif ($_POST['act'] == 'valide_detail_achat') {
  $result2 = connexion::getConnexion()->query("select da.id_detail ,  da.id_produit, da.id_depot, da.qte_achete as qte_achete , da.valide from detail_achat da WHERE da.id_detail =" . $_POST['id']);
  $data = $result2->fetchAll(PDO::FETCH_OBJ);
  if (!$data[0]->valide) {
    foreach ($data as $d) {
      $rd = connexion::getConnexion()->exec("UPDATE produit SET qte_actuel = qte_actuel+ $d->qte_achete WHERE  
    id_produit = " . $d->id_produit);
      $produit_depot = new produit_depot();
      $target = $produit_depot->get_produit_depot($d->id_produit, $d->id_depot);
      if ($target) {
        $produit_depot->add_qte($d->id_produit, $d->id_depot, $d->qte_achete);
      } else {
        $produit_depot->new_produit_depot($d->id_produit, $d->id_depot, $d->qte_achete);
      }
    }
    //calculate composant et produit fini
    foreach ($data as $d) {
      // valider detail achat  
      // if(!$d->valide) {
      $statut = connexion::getConnexion()->exec('UPDATE detail_achat SET valide = 1, date_validation = CURDATE() WHERE id_detail =' . $d->id_detail);
      //avoir produit
      $prod = connexion::getConnexion()->query("SELECT * FROM produit WHERE id_produit = " . $d->id_produit)->fetch(PDO::FETCH_OBJ);
      //Si produit est composant
      if ($prod->type_produit == 2) {
        //avoir produit fini
        $q = "SELECT p.* FROM produit p LEFT JOIN detail_produit dp ON dp.id_produit = p.id_produit WHERE dp.id_ingredient = " . $d->id_produit;
        $prod_fini = connexion::getConnexion()->query($q)->fetch(PDO::FETCH_OBJ);
        //avoir tous les composants
        $q = "SELECT * FROM detail_produit WHERE id_produit = " . $prod_fini->id_produit;
        $composants = connexion::getConnexion()->query($q)->fetchAll(PDO::FETCH_OBJ);
        $qteOfProduct = 0;
        $arr = [];
        foreach ($composants as $cmp) {
          $qte_actuel = connexion::getConnexion()->query("SELECT qte_actuel FROM produit WHERE id_produit = " . $cmp->id_ingredient)->fetch(PDO::FETCH_COLUMN);
          $arr[] = intval($qte_actuel / $cmp->qte);
        }
        $nbrOfProduct = min($arr);
        if ($nbrOfProduct) {
          //suctracter la qte des composants
          foreach ($composants as $cmp) {
            $qte_cmp = $cmp->qte * $nbrOfProduct;
            $rd = connexion::getConnexion()->exec("UPDATE produit SET qte_actuel = qte_actuel -  $qte_cmp WHERE  id_produit = " . $cmp->id_ingredient);
            $produit_depot = new produit_depot();
            $target = $produit_depot->minus_last($cmp->id_ingredient, $qte_cmp);
          }
          //incrementer produit qte 
          $rd = connexion::getConnexion()->exec("UPDATE produit SET qte_actuel = qte_actuel+ $nbrOfProduct WHERE  id_produit = " . $prod_fini->id_produit);
          $produit_depot = new produit_depot();
          $target = $produit_depot->get_produit_depot($prod_fini->id_produit, $prod_fini->emplacement);
          if ($target) {
            $produit_depot->add_qte($prod_fini->id_produit, $prod_fini->emplacement, $nbrOfProduct);
          } else {
            $produit_depot->new_produit_depot($prod_fini->id_produit, $prod_fini->emplacement, $nbrOfProduct);
          }
        }
        $arr = [];
      }
      // } 
    }
    die('Validation');
  } else {
    $qte_a_valider  = (int) $_POST['qte_a_valider'];
    foreach ($data as $d) {
      $new_quantity = $qte_a_valider - (int)$d->qte_achete ; 
      
      // debug("UPDATE produit SET qte_actuel = qte_actuel +  $new_quantity  WHERE  id_produit = " . $d->id_produit ) ; 
      $rd = connexion::getConnexion()->exec("UPDATE produit SET qte_actuel = qte_actuel +  $new_quantity  WHERE  id_produit = " . $d->id_produit);
      $produit_depot = new produit_depot();
      $target = $produit_depot->get_produit_depot($d->id_produit, $d->id_depot);
      if ($target) {
        $produit_depot->add_qte($d->id_produit, $d->id_depot, $new_quantity);
      } else {
        $produit_depot->new_produit_depot($d->id_produit, $d->id_depot, $new_quantity);
      }
    }
    //calculate composant et produit fini
    foreach ($data as $d) {
      // valider detail achat  
      if ($d->valide) {
        $new_quantity = $qte_a_valider - (int)$d->qte_achete ; 
        // debug("UPDATE detail_achat SET qte_achete =  qte_achete + $new_quantity , valide = 1 , date_validation = CURDATE() WHERE id_detail =" . $d->id_detail);
        $statut = connexion::getConnexion()->exec('UPDATE detail_achat SET qte_achete = qte_achete + ' . $new_quantity. ' , valide = 1 , date_validation = CURDATE() WHERE id_detail =' . $d->id_detail);
       
        //avoir produit
        $prod = connexion::getConnexion()->query("SELECT * FROM produit WHERE id_produit = " . $d->id_produit)->fetch(PDO::FETCH_OBJ);
        //Si produit est composant
        if ($prod->type_produit == 2) {
          //avoir produit fini
          $q = "SELECT p.* FROM produit p LEFT JOIN detail_produit dp ON dp.id_produit = p.id_produit WHERE dp.id_ingredient = " . $d->id_produit;
          $prod_fini = connexion::getConnexion()->query($q)->fetch(PDO::FETCH_OBJ);
          //avoir tous les composants
          $q = "SELECT * FROM detail_produit WHERE id_produit = " . $prod_fini->id_produit;
          $composants = connexion::getConnexion()->query($q)->fetchAll(PDO::FETCH_OBJ);
          $qteOfProduct = 0;
          $arr = [];
          foreach ($composants as $cmp) {
            $qte_actuel = connexion::getConnexion()->query("SELECT qte_actuel FROM produit WHERE id_produit = " . $cmp->id_ingredient)->fetch(PDO::FETCH_COLUMN);
            $arr[] = intval($qte_actuel / $cmp->qte);
          }
          $nbrOfProduct = min($arr);
          if ($nbrOfProduct) {
            //suctracter la qte des composants
            foreach ($composants as $cmp) {
              $qte_cmp = $cmp->qte * $nbrOfProduct;
              $rd = connexion::getConnexion()->exec("UPDATE produit SET qte_actuel = qte_actuel -  $qte_cmp WHERE  id_produit = " . $cmp->id_ingredient);
              $produit_depot = new produit_depot();
              $target = $produit_depot->minus_last($cmp->id_ingredient, $qte_cmp);
            }
            //incrementer produit qte 
            $rd = connexion::getConnexion()->exec("UPDATE produit SET qte_actuel = qte_actuel+ $nbrOfProduct WHERE  id_produit = " . $prod_fini->id_produit);
            $produit_depot = new produit_depot();
            $target = $produit_depot->get_produit_depot($prod_fini->id_produit, $prod_fini->emplacement);
            if ($target) {
              $produit_depot->add_qte($prod_fini->id_produit, $prod_fini->emplacement, $nbrOfProduct);
            } else {
              $produit_depot->new_produit_depot($prod_fini->id_produit, $prod_fini->emplacement, $nbrOfProduct);
            }
          }
          $arr = [];
        }
      }
    }
    die('Revalidation');
  }
} elseif ($_POST['act'] == 'addProduct') {
  if (!isset($_SESSION['rand_a_er']) || $_SESSION['rand_a_er'] === "") {
    $_SESSION['rand_a_er'] = rand(10, 1000);
  }
  $_POST["id_user"] = auth::user()["id"];
  $somme_poid = 0;
  $_POST["id_detail_achat"] = "-1" . $_SESSION['rand_a_er'];
  $detail_achat = new detail_achat();
  $detail_achat->insert();
  $data = $detail_achat->selectAllNonValide();
  $total = 0;
  foreach ($data as $ligne) {
  ?>
    <tr>
      <td><?php echo $ligne->designation; ?></td>
      <td><?php echo $ligne->prix_produit; ?></td>
      <td><?php echo $ligne->qte_achete; ?></td>
      <td><?php echo $ligne->poid * $ligne->qte_achete;
          $somme_poid += $ligne->poid * $ligne->qte_achete;
          ?> g </td>
      <td width="90" style="text-align: right;">
        <?php echo number_format($ligne->qte_achete * $ligne->prix_produit, 2, '.', ' ');
        $total += $ligne->qte_achete * $ligne->prix_produit;
        ?>
      </td>
      <td> <a class="badge badge-danger mb-2 delete" data-id="<?php echo $ligne->id_detail; ?>" style="color: white;cursor: pointer;" title="Supprimer" href='javascript:void(0)'>
          <i class="simple-icon-trash" style="font-size: 15px;"></i>
        </a>
      </td>
    </tr>
  <?php
  }
  ?>
  <tr>
    <td colspan="4" style="text-align: center;font-size: 15px;"> <b>Total</b> </td>
    <td style="text-align: right;" colspan="3"> <b style="font-size: 15px;color: green;text-align: right;"><?php echo number_format($total, 2, '.', ' '); ?></b></td>
  </tr>
<?php
} elseif ($_POST['act'] == 'insert') {
  if (isset($_POST["id_produit"])) {
    $_POST["id_achat"] = $_POST["id"];
    $_POST["id_user"] = auth::user()["id"];
    $_POST["prix_produit"] = trim($_POST["prix_produit"]);
    $detail_achat = new detail_achat();
    $detail_achat->insert();
    connexion::getConnexion()->exec("UPDATE produit SET qte_actuel=qte_actuel+" . $_POST["qte_achete"] . " WHERE  id_produit =" . $_POST["id_produit"]);
  }
  die("success");
} elseif ($_POST['act'] == 'update') {
} elseif ($_POST['act'] == 'delete') {
  try {
    $detail_achat = new detail_achat();
    $qte_to_restore = connexion::getConnexion()->query("select qte_achete from detail_achat where id_detail= " . $_POST['id'])->fetchColumn();
    connexion::getConnexion()->exec("UPDATE produit SET qte_actuel=qte_actuel+" . (int)$qte_to_restore . " WHERE  id_produit =" . $_POST["id_produit"]);
    $detail_achat->delete($_POST["id"]);
    die('success');
  } catch (Exception $e) {
    die($e);
  }
} elseif ($_POST['act'] == 'getPrix') {
  $produit = new produit();
  $ligne = $produit->selectById($_POST['id_produit']);
  echo  $ligne['prix_achat'] . "/" . $ligne['qte_actuel'];
} elseif ($_POST['act'] == 'update_detail') {
  $detail_achat = new detail_achat();
  $new_qte = $_POST['qte_achete'];
  $old_qte = $_POST['qte_acheteh'];
  if ((int)$new_qte > (int)$old_qte) {
    connexion::getConnexion()->exec("UPDATE produit SET qte_actuel=qte_actuel-" . ($new_qte - $old_qte) . " WHERE  id_produit =" . $_POST["id_produit"]);
  } else {
    connexion::getConnexion()->exec("UPDATE produit SET qte_actuel=qte_actuel+" . ($old_qte - $new_qte) . " WHERE  id_produit =" . $_POST["id_produit"]);
  }
  $detail_achat->update($_POST['id_detail']);
  $produit = new produit();
  $totale = $detail_achat->gettotale($_POST['id_achat']);
  die(number_format($totale['totale'], 2, '.', ''));
}
?>