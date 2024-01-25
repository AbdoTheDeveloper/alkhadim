<?php
include('../../evr.php');


if ($_POST['act'] == 'insert') {
	try {

		if ($_POST['date_validation'] == '') {
			$_POST['date_validation'] = '1900-01-01';
		}
		if (empty($_POST['num_cheque'])) {

			$_POST['num_cheque'] = 0;
		}

		$client = new client();
		$_POST["id_user"] = auth::user()["id"];
		$_POST["id_client"] = $_POST["id"];
		$_POST["id_vente"] = $_POST["ventes"];
		$reg_client = new reg_client();
		$reg_client->insert();


		$vente_price = connexion::getConnexion()->query("SELECT SUM(detail_vente.prix_produit * detail_vente.qte_vendu) as price FROM detail_vente WHERE detail_vente.id_vente=" . $_POST["id_vente"])->fetch(PDO::FETCH_OBJ);


		$vente = connexion::getConnexion()->query("SELECT * FROM vente WHERE id_vente =" . $_POST["id_vente"])->fetch(PDO::FETCH_OBJ);

		if ($vente->amount_paid + $_POST["montant"] >= $vente_price->price) {

			connexion::getConnexion()->exec("UPDATE vente SET amount_paid=amount_paid+'" . $_POST["montant"] . "', is_paied=1 WHERE id_vente = " . $_POST["id_vente"]);
		} else {

			connexion::getConnexion()->exec("UPDATE vente SET amount_paid=amount_paid+'" . $_POST["montant"] . "', is_paied=0 WHERE id_vente = " . $_POST["id_vente"]);
		}


		//$i = 0;
		$montant = $_POST["montant"];
		$montant_t = $_POST["montant"];
		if ($_POST["remarque"] == "") {
			$_POST["remarque"] = "Reglement global [ Montant : " . $montant_t . "/Mode de Reglement : " . $_POST["mode_reg"] . "/Date : " . $_POST["date_reg"] . "]";
		}



		$list_vente = $client->selectAllVente($_POST["id"]);

		$reg_client = $reg_client->laset_insert();

		$_POST["id_reg_client"] = $reg_client;


		foreach ($list_vente as $vente) {
			$list_detail_vente = $client->selectAllDetailVente($vente->id_vente);
			$montant_detail_vente = 0;
			foreach ($list_detail_vente as $dv) {
				$montant_detail_vente = $montant_detail_vente + ($dv->prix_produit * $dv->qte_vendu);
			}
			$list_reg_vente = $client->selectAllVenteReg($vente->id_vente);
			$montant_reg_vente = 0;
			foreach ($list_reg_vente as $rv) {
				$montant_reg_vente = $montant_reg_vente + $rv->montant;
			}
			if ($montant_reg_vente < $montant_detail_vente) {
				$dif = $montant_detail_vente - $montant_reg_vente;
				if ($montant >= $dif) {
					$_POST["id_vente"] = $vente->id_vente;
					$_POST["montant"] = $dif;
					$reg_vente = new reg_vente();
					$reg_vente->insert();
					$montant = $montant - $dif;
				} elseif ($montant < $dif && $montant > 0) {
					$_POST["id_vente"] = $vente->id_vente;
					$_POST["montant"] = $montant;
					$reg_vente = new reg_vente();
					$reg_vente->insert();
					$montant = 0;
				}
			}
		}




		die('success');
	} catch (Exception $e) {
		die($e);
	}
} elseif ($_POST['act'] == 'update') {
	try {

		$reg_client = new reg_client();
		$reg_client->update($_POST["id"]);
		die('success');
	} catch (Exception $e) {
		die($e);
	}
} elseif ($_POST['act'] == 'delete') {
	try {

		$reg_client = new reg_client();
		$reg = connexion::getConnexion()->query("SELECT * FROM reg_client WHERE id_reg =" . $_POST["id"])->fetch(PDO::FETCH_OBJ);
		connexion::getConnexion()->exec("UPDATE vente SET amount_paid=amount_paid-'" . $reg->montant . "', is_paied=0 WHERE id_vente = " . $reg->id_vente);
		$reg_client->delete($_POST["id"]);
		connexion::getConnexion()->exec("DELETE FROM reg_vente WHERE id_reg_client = " . $_POST["id"]);

		die('success');
	} catch (Exception $e) {
		die($e);
	}
} elseif ($_POST['act'] == 'getetat') {
	try {

		$reg_client = new reg_client();
		$res = $reg_client->selectById($_POST["id"]);
		$total = 0;
		$poids = 0;
		$qte = 0;
		if ($_POST['etatreg_client'] == "achat") {
			$result = connexion::getConnexion()->query("select concat_ws(' ',f.raison_sociale)as fournisseur ,
	a.date_achat,da.prix_reg_client,sum(da.qte_achete) as qte_achete ,da.prix_reg_client*da.qte_achete as total
	from fournisseur f left join  achat a on a.id_fournisseur=f.id_fournisseur left join detail_achat da on da.id_achat=a.id_achat where (a.date_achat between '" . $_POST['dd'] . "' and '" . $_POST['df'] . "')  and da.id_reg_client=" . $_POST["id"] . " group by f.id_fournisseur");
			$data = $result->fetchAll(PDO::FETCH_OBJ);
?>

			<center>
				<p>
				<h3> Liste des achats de reg_client :</span>
					<?php echo $res["designation"] . " ( " . $res["poid"] . " ) "; ?> <br />

					<b dir="rtl">
						لائحة الشراء المنتج : <?php echo $res["designation_ar"] . " ( " . $res["poid"] . " ) " ?></b>
				</h3>
				De <?php echo $_POST['dd']; ?> من<br />
				Au <?php echo $_POST['df']; ?> الى<br />
				</p>
				<?php if (count($data) > 0) { ?>
					<table class="table table-dark responsive" id="example" border="1" cellspacing="0" cellpadding="0">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Fournisseur /المورد</th>
								<th scope="col">Date / التاريخ</th>
								<th scope="col">Prix Achat / ثمن الشراء</th>
								<th scope="col">Poid / الوزن</th>
								<th scope="col">Qte Achete /الكمية المشتراة</th>
								<th scope="col">Total /المجموع</th>

							</tr>
						</thead>
						<?php
						foreach ($data as $ligne) { ?>
							<tr>
								<td> <?php echo $ligne->fournisseur; ?> </td>
								<td> <?php echo $ligne->date_achat; ?> </td>
								<td> <?php echo number_format($ligne->prix_reg_client, 2, ".", " "); ?> &nbsp;&nbsp;</td>
								<td> <?php echo $ligne->qte_achete * $res["poid"];
										$poids += $ligne->qte_achete * $res["poid"]; ?> g &nbsp;&nbsp;&nbsp;&nbsp; </td>
								<td><?php echo $ligne->qte_achete;
									$qte += $ligne->qte_achete; ?> &nbsp;&nbsp;&nbsp;&nbsp; </td>
								<td> <?php echo number_format($ligne->total, 2, ".", " ");
										$total += $ligne->total;
										?> &nbsp;&nbsp;&nbsp;&nbsp;</td>
								</td>
							</tr>
						<?php } ?>
					</table>
					<table class="table table-dark responsive" border="1" cellspacing="0" cellpadding="0">

						<tr>
							<td colspan="4">
								<center> Total / المجموع </center>
							</td>
							<td> <?php echo $poids; ?> g &nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td> <?php echo $qte; ?> &nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td> <?php echo number_format($total, 2, ".", " "); ?>&nbsp;&nbsp;&nbsp;&nbsp; </td>

						</tr>
					</table>
				<?php  } else {  ?>

					<div class="alert alert-primary" role="alert">
						No Data
					</div>

				<?php }
			} else {
				$result = connexion::getConnexion()->query("select concat_ws(' ',c.nom,c.prenom)as client ,
			v.date_vente,dv.prix_reg_client,sum(dv.qte_vendu) as qte_vendu ,dv.prix_reg_client*dv.qte_vendu as total
			from client c left join  vente v on v.id_client=c.id_client left join detail_vente dv on dv.id_vente=v.id_vente where (v.date_vente between '" . $_POST['dd'] . "' and '" . $_POST['df'] . "')  and dv.id_reg_client=" . $_POST["id"] . " group by c.id_client");
				$data = $result->fetchAll(PDO::FETCH_OBJ);

				?>
				<center>
					<p>
					<h3>Liste des Vente de reg_client :</span>
						<?php echo $res["designation"] . " ( " . $res["poid"] . " ) " ?> <br>
						<b dir="rtl">
							لائحة بيع المنتج : <?php echo $res["designation_ar"] . " ( " . $res["poid"] . " ) " ?></b>
					</h3>
					De <?php echo $_POST['dd']; ?> من<br />
					Au <?php echo $_POST['df']; ?> الى<br />
					</p>

					<?php if (count($data) > 0) { ?>
						<table class="table" id="example" border="1" cellspacing="0" cellpadding="0">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Client / المنتوج</th>
									<th scope="col">Date / التاريخ</th>
									<th scope="col">Prix Vente /ثمن البيع </th>
									<th scope="col">Poid / الوزن</th>
									<th scope="col">Qte Vendu /الكمية المباعة</th>
									<th scope="col">Total /المجموع</th>
								</tr>
							</thead>
							<?php

							$total = 0;
							$poids = 0;
							$qte = 0;
							foreach ($data as $ligne) {

								$total += (int)$ligne->total;
								$qte += (int)$ligne->qte_vendu;
								$poids += (int)$ligne->qte_vendu * (int)$res["poid"];
							?>
								<tr>
									<td> <?php echo $ligne->client; ?> </td>
									<td> <?php echo $ligne->date_vente; ?> </td>
									<td> <?php echo number_format($ligne->prix_reg_client, 2, ".", " "); ?>&nbsp;&nbsp;</td>
									<td><?php echo $ligne->qte_vendu * $res["poid"]; ?> &nbsp;&nbsp; </td>
									<td><?php echo $ligne->qte_vendu; ?> &nbsp;&nbsp; </td>
									<td> <?php echo number_format($ligne->total, 2, ".", " "); ?> &nbsp;&nbsp;</td>
								</tr>
							<?php } ?>

						</table>
						<table class="table table-dark responsive" border="1" cellspacing="0" cellpadding="0">
							<tr style="font-weight:bold">
								<td colspan="3">
									<center> Total / المجموع</center>
								</td>
								<td> <?php echo $poids; ?> &nbsp;&nbsp;</td>

								<td> <?php echo $qte; ?> &nbsp;&nbsp;</td>
								<td> <?php echo number_format($total, 2, ".", " "); ?> &nbsp;&nbsp;</td>
							</tr>
						</table>
					<?php } else {  ?>

						<div class="alert alert-primary" role="alert">
							No Data
						</div>

				<?php }
				} ?>


				<script type="text/javascript">
					$(document).ready(function() {
						$('#example').DataTable({
							ordering: false,
							pageLength: 6,
							language: {
								paginate: {
									previous: "<i class='simple-icon-arrow-left'></i>",
									next: "<i class='simple-icon-arrow-right'></i>"
								}
							},
							drawCallback: function() {
								$($(".dataTables_wrapper .pagination li:first-of-type")).find("a").addClass("prev"), $($(".dataTables_wrapper .pagination li:last-of-type")).find("a").addClass("next"), $(".dataTables_wrapper .pagination").addClass("pagination-sm")
							},
							searching: !1,
							bLengthChange: !1,
							destroy: !0,
							info: !1,
							dom: 'Bfrtip',
							buttons: ["csv", "pdf", "excel"],
						});

					});
				</script>
		<?php

	} catch (Exception $e) {
		die($e);
	}
}


		?>
