<?php
#hide errors
ob_start();
include('../../evr.php');
include('../../newpdf/tcpdf_include.php');
include('../../newpdf/tcpdf.php');
include("../../model/convert.php");
?>

<?php

$societe= connexion::getConnexion()->query("SELECT * FROM societe")->fetch(PDO::FETCH_OBJ);

$result=connexion::getConnexion()->query("select * from depot_op where id_depot_op=".$_GET["id"]);

$data1=$result->fetch(PDO::FETCH_ASSOC);
$vendeur = connexion::getConnexion()->query("SELECT nom FROM utilisateur WHERE privilege = 'Vendeur' and id =  " .$data1['id_vendeur'])->fetch(PDO::FETCH_OBJ);
// debug($vendeur) ; 
$data2=connexion::getConnexion()->query("SELECT ddo.*, d1.nom AS depot_src, d2.nom AS depot_dest, p.designation FROM detail_depot_op ddo LEFT JOIN depot d1 ON ddo.id_depot_src = d1.id
 LEFT JOIN depot d2 ON ddo.id_depot_dest = d2.id LEFT JOIN produit p ON ddo.id_produit = p.id_produit WHERE ddo.id_depot_op = " . $_GET['id'] . " order by ddo.id_detail desc");
$rep=$data2->fetchAll(PDO::FETCH_ASSOC);
// debug($rep) ; 
$vente=new vente();
$vente1=$vente->selectById($_GET["id"]);
ob_start();
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
	   
// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, '', '', array(255,255,255), array(0,255,255));
$pdf->setFooterData(array(0,64,0), array(0,64,128));
	   
// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
	   
// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
	   
// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);
	   
// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
	   
// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
	   
// set some language-dependent strings (optional)
if(@file_exists(dirname(__FILE__).'/lang/eng.php')) 
{
	require_once(dirname(__FILE__).'/lang/eng.php');
	$pdf->setLanguageArray($l);
}
	   
// ---------------------------------------------------------
// set default font subsetting mode
$pdf->setFontSubsetting(true);
	   
// Set font
// dejavusans is a UTF-8 Unicode font, if you only need to
// print standard ASCII chars, you can use core fonts like
// helvetica or times to reduce file size.
$pdf->SetFont('dejavusans', '', 14, '', true);
	   
$pdf->setTextShadow(array('enabled'=>true, 'depth_w'=>0.2, 'depth_h'=>0.2, 'color'=>array(196,196,196), 'opacity'=>1, 'blend_mode'=>'Normal'));
$pdf->AddPage();
$code = $vente1["id_vente"]. '-' . date("Y");
if($vente1["date_vente"] != '0000-00-00')
{
   $str = date("Y");
}
else
  $str=date('Y');

$pdf->SetFont('dejavusans', '', 8, '', true);
$str="";
if($data1["date_op"]!='0000-00-00')
{
  $str=date('Y',strtotime($data1["date_op"]));
}

$font = TCPDF_FONTS::addTTFfont("../../newpdf/fonts/calibri_reg.ttf");
$font_light = TCPDF_FONTS::addTTFfont("../../newpdf/fonts/calibri_light.ttf");

$style1d = array('position' => 'S', 'align' => 'C', 'stretch' => false, 'fitwidth' => true, 'cellfitalign' => '', 'border' => false, 'hpadding' => '50', 'vpadding' => '30', 'fgcolor' => array(0, 0, 0), 'bgcolor' => false, 'text' => false, 'font' => 'helvetica', 'fontsize' => 0, 'stretchtext' => 4);

$pdf->setXY(144, 6);
$pdf->write1DBarcode('D.' . $vente1["id_vente"] .' - ' . $str, 'C128B', '', '', '', 22, 4, $style1d, 'T');

$pdf->SetTextColor(15,15,15);
$pdf->SetFillColor(139, 130, 125);
$pdf->SetXY(142,22);
$pdf->setCellPadding(2);
$pdf->SetFont('dejavusans', '', 10, 'C', true);
$pdf->Cell(50, 5, 'Depot Operation N°: ' . 'D.' . $data1["id_depot_op"] .' - ' . $data1["date_op"], 0, 0, 'C', 0, 0);

$pdf->SetFont('dejavusans', '', 10, 'C', true);


$pdf->setXY(10, 56);
#Custom

$leftInfo = '
<style>
  h5,p{font-size:7pt; font-weight:400;color: rgb(20,20,20);}
   h3, h5{color: rgb(20,20,20);}
   h5{
     font-size:12pt !important; margin-bottom:20px;
   }
   tr
   {
    padding:30px;
   }
  
</style>
<div>
<table>
   <tr>
      <td width="24%" style="height:10; width:10%;">Vendeur</td>
      <td width="4%"> : </td>
      <td width="71%">' . $vendeur->nom . '</td>
   </tr>

   <tr>
      <td width="35%" style="height:10; width:15%;">Transporteur</td>
      <td width="4%"> : </td>
      <td>' . $data1['transporteur'] . '</td>
   </tr>
   <tr>
   <td width="35%" style="height:10; width:15%;">Date Opération</td>
   <td width="4%"> : </td>
   <td>' . $data1['date_op'] . '</td>
</tr>
  
</table>
</div>';
	   
$rightInfo = "
<style>
  h3{color: rgb(20,20,20); text-align:center;}
  h5,p{font-size:8pt; font-weight:700;color: #000;text-align:left;}
</style>
<div>
   <h5>CASABLANCA Le: " . date('d/m/Y',strtotime($vente1["date_vente"])) . "</h5>
	 <h5>Objet: " . $data1['obj'] . "</h5>
	 
	 
</div>";
	   
$pdf->SetLineStyle(array('width' => 0.3, 'cap' => 'butt', 'join' => 'miter', 'dash' => 0, 'color' => array(37,151,213)));	   
$pdf->SetFillColor(255,255,255);
$pdf->setCellPadding(3,0,3,0 );
$pdf->SetFont('dejavusans', '', 9, '', true);
$pdf->writeHTMLCell(86, 20,'','', $leftInfo, 1, 0 , 'L', 1); 
$pdf->Cell(8);
	  
$pdf->SetLineStyle(array('width' => 0.3, 'cap' => 'butt', 'join' => 'miter', 'dash' => 0, 'color' => array(37,151,213)));
     
$pdf->SetFillColor(255,255,255);
$pdf->SetFont('dejavusans', '', 7, '', true);
$pdf->setCellPadding(3,0,3,0 );
$pdf->SetFont('dejavusans', '', 7, '', true);
// $pdf->writeHTMLCell(86, 36,'','', $rightInfo, 0, 1 , 'C',0);   

$pdf->Ln(6);




# End custom


$pdf->setCellPadding(0);
$pdf->Ln(4);
$pdf->Ln(12);
$pdf->SetXY(190, 80);
$pdf->SetTextColor(20,20,20);

// #first Row
// $pdf->SetFont('dejavusans', '', 10, '', true);
// $pdf->Cell(70,0,'' ,0,1,'L',0);

// #ini Row
// $pdf->SetFont('dejavusans', '', 9, '', true);
// $pdf->Cell(32,8,'Client                    : ' ,0,0,'L',0);
// $pdf->SetFont('dejavusans', '', 8, '', true);
// $pdf->Cell(90,8,$data1['nom'] ,0,0,'L',0);
// $pdf->SetFont('dejavusans', '', 9, '', true);
// $pdf->Cell(40,8,'Date                    : ' . date('d/m/Y',strtotime($vente1["date_vente"])),0,1,'L',0);
// #second Row
// $pdf->SetFont('dejavusans', '', 9, '', true);
// $pdf->Cell(32,8,'A l\'attention de     :' ,0,0,'L',0);
// $pdf->SetFont('dejavusans', '', 8, '', true);
// $pdf->Cell(90,8,$data1['responsable'] ,0,0,'L',0);
// $pdf->SetFont('dejavusans', '', 9, '', true);
// $pdf->Cell(40,8,'Devis N°              : D.' . $vente1["id_vente"] .' - ' . $str,0,1,'L',0);

// #third Row
// $pdf->SetFont('dejavusans', '', 9, '', true);
// $pdf->Cell(32,8,'Adresse                :' ,0,0,'L',0);
// $pdf->SetFont('dejavusans', '', 8, '', true);
// $pdf->Cell(90,8, $data1['adresse'] ,0,0,'L',0);
// $pdf->SetFont('dejavusans', '', 9, '', true);
// $pdf->Cell(40,8,'Validité de l\'offre : ' . $data1['validite'],0,1,'L',0);

// #fourth Row


// #fifth Row
// $pdf->SetFont('dejavusans', '', 9, '', true);
// $pdf->Cell(32,8,'Téléphone            :' ,0,0,'L',0);
// $pdf->SetFont('dejavusans', '', 8, '', true);
// $pdf->Cell(90,8,$data1['telephone'] ,0,0,'L',0);

// #End Rows
// $pdf->SetFont('dejavusans', '', 9, '', true);
// $pdf->Cell(10, 8, $data1['obj'], 0, 1, 'L', 0);
$pdf->Ln(4);

$pdf->Ln(2);
$cont=0;

$pdf->SetFont('dejavusans', '', 7, '', true);
$tbl = '
<style>
   .mytable td 
   {
        border-left : 1px solid #000;
        border-right : 1px solid #000;
   }
   
   .mytable th 
   {
       padding: 8px;
	   
   }
   .mytable td
   {
      border-bottom : 1px solid #000;
      border-right : 1px solid #000;
      font-size:8.5pt;
   }
</style>
<table cellspacing="0" cellpadding="3" border="1" class="mytable">
 <tr style="background-color:#2597d5;">
       <th  align="center" height="10" width="6%" style="color:white; font-weight:900; font-size:8.5pt;">N°</th>
        <th  align="center" height="10" width="50%" style="color:white; font-weight:900; font-size:8.5pt;">Désignation</th>
        <th  align="center" height="10" width="13%" style="color:white; font-weight:900; font-size:8.5pt;">Date Opération</th>
        <th  align="center" height="10" width="10%" style="color:white; font-weight:900; font-size:8.5pt;">Depot Source</th>
        <th  align="center" height="10" width="12%" style="color:white; font-weight:900; font-size:8.5pt;">Depot Destination</th>
        <th  align="center" height="10" width="12%" style="color:white; font-weight:900; font-size:8.5pt; text-align:center">Qte Opération </th>
</tr>
  ';

$totalremise = 0;
foreach($rep as $key => $ligne){

$vtva=$ligne["tva"];

$prix=round(($ligne["prix_produit"]*(1-$ligne["remise"]/100)) ,2);
$totalremise += $ligne["qte_vendu"]*$ligne["prix_produit"]*$ligne["remise"]/100 ; 

if(!empty($ligne["unit"]))
{
    $unit=$ligne["unit"];
    
}
if(!empty($ligne["valunit"]) || $ligne["valunit"]!=0)
{
    $mtnht=($ligne["valunit"]);
}
else
{
    $mtnht=$ligne["qte_vendu"];
}
	
$a = ($mtnht*$ligne["prix_produit"]);

$b = $a - ($a * ($ligne["remise"]/100));

$c = $b * $ligne["tva"];

$prixut =  (($ligne["qte_vendu"]*$ligne["prix_produit"] ) - ( ($ligne["qte_vendu"]*$ligne["prix_produit"] ) * ($ligne["remise"]/100) ) ) + (  (($ligne["qte_vendu"]*$ligne["prix_produit"] ) - (($ligne["qte_vendu"]*$ligne["prix_produit"] ) * ($ligne["remise"]/100)) ) * $ligne["tva"] ) ;
$tot_ht = $ligne['qte_vendu'] * ($ligne["prix_produit"] / (1 + $ligne["tva"]));
  $tbl .= '
   <tr>
        <td align="center">' . ($key + 1) . '</td>
        <td>'.$ligne['designation'].'</td>
        <td align="center">'.$data1['date_op'].'</td>
        <td align="right">'.$ligne['depot_src'] .  '</td>
        <td  align="right">'.$ligne["depot_dest"] .'</td>
        <td  align="center">'.$ligne['qte_op'] .'</td>
    </tr>
   ';

$total+=($prixut)*$ligne["qte_vendu"]* $vtva;

$tottva += $vtva;

$totalht+=$b;

$totaltva+=$c;


}

for ($i=0; $i < 12  - count($rep)  ; $i++) 
{ 
/*
  $tbl .= '
   <tr>
        <td border="0" ></td>
        <td border="0" ></td>
        <td border="0"  align="right"></td>
        <td border="0"  align="right"></td>
        <td border="0"  align="right"></td>
        <td border="0"  align="right"></td>
        <td border="0"  align="right"></td>
        <td border="0"  align="center"></td>
    </tr>
   ';*/
}

$tbl  .= "</table> ";

$pdf->SetX(10);

$pdf->writeHTML($tbl, true, false, false, false, '');

$tot = $totalht +$total ;

$total=round($total, 2);
$timber=$basHt;
	   
if($modReg=='Espece')
{
  $timber=$basHt * 0.0025 + ($basHt) ;
}
	   
$pdf->Ln(2);

$ttc= $basHt + $tottvaSee;
$printtotal = '

<style>
    .tab-foot  td 
	 {
      font-size:8.5pt;
    }
    .tab-foot  th 
	 {
      font-size:8.5pt;
    }
</style>
<table>
<tr>
<td>
<table cellspacing="0" cellpadding="6"   class="tab-foot" width="100%">
    <tr>
	  <td width="60%"></td>
      <th border="1" align="left" height="10" width="20%" style="background-color:#2597d5; color:white;">Total H.T</th>
	  <td align="right" border="1" width="20%">' . number_format($totalht/1.2, 2, ".", " ") . '</td>
    </tr>
     <tr>
	   <td width="60%"></td>
       <th border="1" align="left" height="10" width="20%"  style="background-color:#2597d5; color:white;">Total T.V.A (20%)</th>
	   <td align="right" border="1" width="20%">' . number_format($totalht - $totalht/1.2, 2, ".", " ") . '</td>
    </tr>
	<tr>
	   <td width="60%"></td>
       <th border="1" align="left" height="10" width="20%"  style="background-color:#2597d5; color:white;">Total T.T.C</th>
	   <td align="right" border="1" width="20%">' . number_format($totalht, 2, ".", " ") . '</td>
    </tr>
  </table>
</td>
  ';

$ttc = $totalht;
$pdf->SetX(10);

// $pdf->writeHTML($printtotal, true, false, false, false, '');

$pdf->Ln(5);




// $pdf->writeHTML("<p style='color:black;'>Arréter le présent devis a la somme de :</p>", true, false, false, false, '');

$str='<p>' .chifre_en_lettre(intval(($totalht)));

//$pdf->Image('../../pdf/signe.png',160,240,35);

if(intval(round(($totalht )-intval(($totalht)), 2)*100)>0 )
{

	$str .=' et ';

	if (round(($totalht ),2) - intval(($totalht )) < 0.1)

	$str.= 'Zero ' ;

	$str .= trim((chifre_en_lettre(substr(strstr(number_format($totalht,2,"."," "),"."),1) ,' Centimes')));

}
$str.=" TTC</p>";

$pdf->Ln(2);

// $pdf->writeHTML($str, true, false, false, false, '');
$pdf->Ln(7);

$pdf->SetFont($font_light, '', 9, 'I', true);
//$pdf->Cell(170,8,'Pour toute question relative à ce devis, veuillez nous contacter.',0,1,'L',0);
$pdf->SetFont('dejavusans', 'B', 7, '', true);
ob_end_clean();
$pdf->Output($data1['nom'] . '_devis.pdf', 'I');

?>
