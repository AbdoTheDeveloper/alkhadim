<?php
include('../../evr.php');
if ($_POST['act'] == 'getcat' && isset($_POST['id_zone'])) {
	$id = $_POST['id_zone'];

	$zone = new zone();
	$data = $zone->selectChamps("code_bar", "id_zone =  $id", '', "id_zone", "desc", "1");
	die($data[0]->code_bar);
} elseif ($_POST['act'] == 'insert') {
	try {
		$_POST["id_user"] = auth::user()["id"];
		$zone = new zone();
		$res = $zone->insert();
		if ($res) {
			die('success');
		}
		die("Erreur");
	} catch (Exception $e) {
		die($e);
	}
} elseif ($_POST['act'] == 'update') {
	try {
		$_POST["id_user"] = auth::user()["id"];
		$zone = new zone();
		$zone->update($_POST["id_zone"]);

		connexion::getConnexion()->exec("UPDATE produit SET remise_max = ".$_POST['remise_max']." WHERE id_zone = ".$_POST['id']);

		die('success');
	} catch (Exception $e) {
		die($e);
	}
} elseif ($_POST['act'] == 'delete') {
	try {


		$zone = new zone();
		$zone->delete($_POST["id"]);
		die('success');
	} catch (Exception $e) {
		die($e);
	}
} elseif ($_POST['act'] == 'archive') {
	try {



		$zone = new zone();
		$zone->archiver($_POST["id"], $_POST["val"], auth::user()["id"]);


		die('success');
	} catch (Exception $e) {
		die($e);
	}
} elseif ($_POST['act'] == 'getName') {
	try {



		$zone = new zone();
		$oldvalue = $zone->selectById($_POST['id']);
		die($_POST['id'] . ";;;<strong>" . $oldvalue['nom'] . " " . $oldvalue['prenom'] . "</strong>");
	} catch (Exception $e) {
		die($e);
	}
} elseif ($_POST['act'] == 'getetat') {
	try {

		$zone = new zone();
		$res = $zone->selectById($_POST["id"]);
		$total = 0;
		$poids = 0;
		$qte = 0;
		if ($_POST['etatzone'] == "achat") {
			$result = connexion::getConnexion()->query("select concat_ws(' ',f.raison_sociale)as fournisseur ,
	a.date_achat,da.prix_zone,sum(da.qte_achete) as qte_achete ,da.prix_zone*da.qte_achete as total
	from fournisseur f left join  achat a on a.id_fournisseur=f.id_fournisseur left join detail_achat da on da.id_achat=a.id_achat where (a.date_achat between '" . $_POST['dd'] . "' and '" . $_POST['df'] . "')  and da.id_zone=" . $_POST["id"] . " group by f.id_fournisseur");
			$data = $result->fetchAll(PDO::FETCH_OBJ);
?>

			<center>
				<p>
				<h3> Liste des achats de zone :</span>
					<?php echo $res["designation"] . " ( " . $res["poid"] . " ) "; ?> <br />

					<b dir="rtl">
						لائحة الشراء المنتج : <?php echo $res["designation_ar"] . " ( " . $res["poid"] . " ) " ?></b>
				</h3>
				De <?php echo $_POST['dd']; ?> من<br />
				Au <?php echo $_POST['df']; ?> الى<br />
				</p>
				<?php if (count($data) > 0) { ?>
					<table class="table " id="example" border="1" cellspacing="0" cellpadding="0">
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
								<td> <?php echo number_format($ligne->prix_zone, 2, ".", " "); ?> &nbsp;&nbsp;</td>
								<td> <?php echo $ligne->qte_achete * $res["poid"];
										$poids += $ligne->qte_achete * $res["poid"]; ?> g &nbsp;&nbsp;&nbsp;&nbsp; </td>
								<td><?php echo $ligne->qte_achete;
									$qte += $ligne->qte_achete; ?> &nbsp;&nbsp;&nbsp;&nbsp; </td>
								<td> <?php echo number_format($ligne->total, 2, ".", " ");
										$total += $ligne->total;
										?> &nbsp;&nbsp;&nbsp;&nbsp;</td>
								</td>
							</tr>
						<?php } ?> <tr>
							<td colspan="3">
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
				$result = connexion::getConnexion()->query("select concat_ws(' ',c.nom,c.prenom)as zone ,
			v.date_vente,dv.prix_zone,sum(dv.qte_vendu) as qte_vendu ,dv.prix_zone*dv.qte_vendu as total
			from zone c left join  vente v on v.id_zone=c.id_zone left join detail_vente dv on dv.id_vente=v.id_vente where (v.date_vente between '" . $_POST['dd'] . "' and '" . $_POST['df'] . "')  and dv.id_zone=" . $_POST["id"] . " group by c.id_zone");
				$data = $result->fetchAll(PDO::FETCH_OBJ);

				?>
				<center>
					<p>
					<h3>Liste des Vente de zone :</span>
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
									<th scope="col">zone / المنتوج</th>
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
									<td> <?php echo $ligne->zone; ?> </td>
									<td> <?php echo $ligne->date_vente; ?> </td>
									<td> <?php echo number_format($ligne->prix_zone, 2, ".", " "); ?>&nbsp;&nbsp;</td>
									<td><?php echo $ligne->qte_vendu * $res["poid"]; ?> &nbsp;&nbsp; </td>
									<td><?php echo $ligne->qte_vendu; ?> &nbsp;&nbsp; </td>
									<td> <?php echo number_format($ligne->total, 2, ".", " "); ?> &nbsp;&nbsp;</td>
								</tr>
							<?php } ?>

						</table>
						<table class="table " border="1" cellspacing="0" cellpadding="0">
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
							buttons: ["csv", "pdf", "excel", "print"],
						});

					});
				</script>
		<?php

	} catch (Exception $e) {
		die($e);
	}
}
		?>