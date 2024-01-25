<?php
#hide errors
ob_start();
include('../../evr.php');
include('../../newpdf/tcpdf_include.php');
include('../../newpdf/tcpdf2.php');
include("../../model/convert.php");

?>
<?php
if(!isset($_GET["id"]))
{ 
	header("Location:index.php"); 
}


$result=connexion::getConnexion()->query("select v.remarque as obj,c.*,v.date_vente,v.id_user , v.id_vente 
from vente v  left join client c on c.id_client=v.id_client where id_vente=".$_GET["id"]);

$data1=$result->fetch(PDO::FETCH_ASSOC);

$data2=connexion::getConnexion()->query("select dv.valunit,dv.unit,p.code_bar,p.tva,p.unite,p.designation,p.poid,dv.prix_produit,p.poid,dv.remise,dv.qte_vendu,dv.id_vente from detail_vente dv 
left join produit p on p.id_produit=dv.id_produit left join vente v on dv.id_vente=v.id_vente  where dv.id_vente =".$_GET["id"]);

$rep=$data2->fetchAll(PDO::FETCH_ASSOC);

$vente=new vente();

$vente1=$vente->selectById($_GET["id"]);
ob_start();
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
	   
// set default header data
// $pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, '', '', array(255,255,255), array(0,255,255));
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
if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
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

	   
// Add a page
// This method has several options, check the source code documentation for more information.
// set text shadow effect

// $pdf->setTextShadow(array('enabled'=>true, 'depth_w'=>0.2, 'depth_h'=>0.2, 'color'=>array(196,196,196), 'opacity'=>1, 'blend_mode'=>'Normal'));

$pdf->AddPage();
if($vente1["date_vente"]!='0000-00-00')
{
   $str = date("Y");
}
else
  $str=date('Y');
$str="";
if($vente1["date_vente"]!='0000-00-00')
{
  $str=date('Y',strtotime($vente1["date_vente"]));
}
// $style1d = array('position' => 'S', 'align' => 'C', 'stretch' => false, 'fitwidth' => true, 'cellfitalign' => '', 'border' => false, 'hpadding' => '50', 'vpadding' => '30', 'fgcolor' => array(0, 0, 0), 'bgcolor' => false, 'text' => false, 'font' => 'helvetica', 'fontsize' => 10, 'stretchtext' => 4);

// <style>
//   .titre{
//     color:#6d6d6d
//   }
// </style>



$date_recu = '

<style>

</style>

<table width ="400px ">

<tr>
<td  align="center" style="background-color:#6d6d6d;color:white;width:50px;line-height:30px;font-weight:bold; font-size:11px;border:1px solid black ;">
DATE
</td>
<td  align ="center"style="background-color:#fcf7f7;line-height:30px;font-weight:bold;font-size:12px; font-size:11px;border:1px solid black ;">
'. $data1['date_vente'] .'
</td>
<td  align="center"  style="background-color:#6d6d6d;color:white;line-height:30px;font-weight:bold; font-size:11px;border:1px solid black ;">
N° DE REÇU
</td>
<td align="center"style="background-color:#fcf7f7;line-height:30px;font-weight:bold;font-size:12px; font-size:11px;border:1px solid black ;">
'.$data1['id_vente'].'
</td>
</tr>

</table>' ; 

$pdf->setXY(106, 8);

$pdf->writeHTML($date_recu, true, false, false, false, '');



$pdf->SetFont('helvetica', 'B', 14); // Font: Times, Style: Italic, Size: 12
$pdf->SetTextColor(128, 128, 128);
// Write plain text
$pdf->setXY(10, 8);
$pdf->Cell(40,0,  'REÇU DE LIVRAISON', 0, 1, 'L');
$pdf->SetFont('helvetica', 'B', 9); // Font: Times, Style: Italic, Size: 12
$pdf->setXY(10, 45);
$pdf->Cell(40,0,  'Fix : 0522720698 / Téléphone : 0600964151', 0, 1, 'L');
$pdf->setXY(10, 40);
$pdf->Cell(10,0,  'LOT AL AMIRIA E 2 TIT MELLIL ', 0, 1, 'L');

$pdf->setXY(10, 35);

$pdf->Cell(50,0,  'EWM', 0, 1, 'L');







$pdf->SetFont('dejavusans', '', 14, '', true);

// $pdf->setXY(144, 10);
// $pdf->write1DBarcode('BL00' . $vente1["numbon"] .' - '.  $str, 'C128B', '', '', '', 22, 4, $style1d, 'T');


$pdf->SetFillColor(139, 130, 125);
$pdf->SetXY(142,26);
$pdf->setCellPadding(2);
$pdf->SetFont('dejavusans', '', 10, 'C', true);
// $pdf->Cell(50, 5, 'Bon Livraison N°: ' . 'BL00' . $vente1["numbon"] .' - '.  $str, 0, 0, 'C', 0, 0);

$pdf->SetFont('dejavusans', '', 10, 'C', true);


$pdf->setXY(10, 40);



$pdf->setCellPadding(0);
$pdf->Ln(4);
$pdf->Ln(12);
$pdf->SetXY(10,40);

$pdf->SetTextColor(0, 0, 0);
$pdf->SetTextColor(20,20,20);

$code = $vente1["id_vente"]. '-' . date("Y");

$societe= connexion::getConnexion()->query("SELECT * FROM societe")->fetch(PDO::FETCH_OBJ);
$code = $vente1["id_vente"]. '-' . date("Y");

$pdf->SetFont('dejavusans', '', 8, '', true);






$pdf->setXY(10, 45);
#Custom


	   
$rightInfo = '

<h3 align="center"style="border:none  ;color:white;background-color:#37794b;line-height:21px;font-weight:bold;"> INFORMATIONS SUR LE DISTINATAIRE </h3> 

';
	   
// $pdf->SetLineStyle(array('width' => 0.3, 'cap' => 'butt', 'join' => 'miter', 'dash' => 0, 'color' => array(37,151,213)));   
$pdf->SetFillColor(255,255,255);
$pdf->setCellPadding(3,0,3,0 );
$pdf->SetFont('dejavusans', '', 9, '', true);
// $pdf->writeHTMLCell(86, 22,'','', $leftInfo, 1, 0 , 'L', 1); 
$pdf->Cell(8);
	  
// $pdf->SetLineStyle(array('width' => 0.3, 'cap' => 'butt', 'join' => 'miter', 'dash' => 0, 'color' => array(150, 150, 150)));
     

$pdf->setXY(103, 20);
$pdf->SetTextColor(128, 128, 128);
$pdf->SetFont('dejavusans', '', 7, '', true);
$pdf->setCellPadding(3,0,3,0 );
$pdf->SetFont('dejavusans', '', 7, '', true);
$pdf->writeHTMLCell(105, 0, '', '', $rightInfo, 0, 0, '');



$pdf->SetFont('helvetica', 'B', 9); // Font: Times, Style: Italic, Size: 12
$pdf->setXY(103, 42);
$pdf->Cell(40,0,  $data1['telephone'], 0, 1, 'L');
$pdf->setXY(103, 37);
$pdf->Cell(10,0,  $data1['adresse'], 0, 1, 'L');

$pdf->setXY(103, 32);

$pdf->Cell(50,0,  $data1['nom'], 0, 1, 'L');


$pdf->Ln(6);



$pdf->Ln(6);
$pdf->SetTextColor(0, 0, 0);

$total=$totalht=0;

$cont=0;

$pdf->SetFont('dejavusans', '', 7, '', true);

$tbl1 = '
<style>
.mytable{
  width:740px;
}
   .mytable  th 
   {
       padding-butom:0;
   }

</style>
<table cellspacing="0" cellpadding="3"  class="mytable">
 <tr style="background-color:#37794b;">
        <th   align="center" height="10" width="48%" style="color:white; font-weight:800; font-size:8.5pt;font-weight:bold;border:1px solid gray ;">DESCRIPTION</th>
        <th  align="center"height="10" width="15%" style="color:white; font-weight:800;   font-size:8.5pt;font-weight:bold;border:1px solid gray ;">QTÉ</th>
        <th  align="center" height="10" width="15%" style="color:white; font-weight:800;  font-size:8.5pt;font-weight:bold;border:1px solid gray ;">PIÉCES/PKG</th>
        <th  align="center" height="10" width="15%" style="color:white; font-weight:800;  font-size:8.5pt;font-weight:bold;border:1px solid gray ;">TOTAL PKGS</th>
</tr>
  ';

$totalremise = 0;

foreach($rep as $ligne){

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
$a = ($mtnht*$ligne["prix_produit"] );

$b = $a - ($a * ($ligne["remise"]/100));

$c = $b * $ligne["tva"];

$prixut =  (($ligne["qte_vendu"]*$ligne["prix_produit"] ) - ( ($ligne["qte_vendu"]*$ligne["prix_produit"] ) * ($ligne["remise"]/100) ) ) + 
(  (($ligne["qte_vendu"]*$ligne["prix_produit"] ) - (($ligne["qte_vendu"]*$ligne["prix_produit"] ) * ($ligne["remise"]/100)) ) * $ligne["tva"] ) ;

  $tbl1.= '<tr>
  <td style="border:1px solid gray ;      font-size:8.5pt;"  align="center      ">'.$ligne['designation'].'</td>
  <td style="border:1px solid gray ;font-size:8.5pt;" align="center ">'.number_format($ligne['qte_vendu'],2,"."," ").'</td>
  <td style="border:1px solid gray ;      font-size:8.5pt;"       align="center       ">'.$ligne['prix_produit'].'</td>
        
        <td style="border:1px solid gray ;font-size:8.5pt;" align="center ">'.number_format($ligne['qte_vendu']  * $ligne['prix_produit'],2,"."," ").'</td>
    </tr>';

$total+=($prixut)*$ligne["qte_vendu"]* $vtva;

$tottva += $vtva;

$totalht+=$b;

$totaltva+=$c;

}




$tbl1 .= '
<tr >
<td  align="center" style="color:#4f8052;font-size:15pt;font-family:helvetica; font-weight:bold;">
MERCI
</td>
<td align="right"colspan="2" style="border-right:1px solid gray; 
background-color:#2c3f2d;color:white; font-size:13px;font-family:helvetica ;
line-height:30px;font-weight:bold;">
TOTAL
</td>
<td  align="center"style="border:1px solid gray ; background-color:#6d6d6d;color:white; font-size:13px;font-family:helvetica ;
line-height:30px;font-weight:bold;">' .
number_format($totalht,2,","," ") .'
</td >
</tr>
</table> ';


$pdf->SetXY(10,55);

$pdf->SetFont('helvetica', 'B', 9); // Font: Times, Style: Italic, Size: 12

$pdf->writeHTML($tbl1, true, false, false, false, '');

$tot = $totalht +$total ;

$total=round($total,2);

$tot = $totalht +$total ;

$total=round($total,2);


$pdf->setXY(107, 103);




$date_recu1 = '
<table width ="400px ">

<tr>
<td  align="center" style="background-color:#6d6d6d;color:white;width:50px;line-height:36px;font-weight:bold; font-size:11px;border:1px solid black ;">
DATE
</td>
<td  align ="center"style="background-color:#fcf7f7;line-height:36px;font-weight:bold;font-size:12px; font-size:11px;border:1px solid black ;">
'. $data1['date_vente'] .'
</td>
<td  align="center"  style="background-color:#6d6d6d;color:white;line-height:36px;font-weight:bold; font-size:11px;border:1px solid black ;">
N° DE REÇU
</td>
<td align="center"style="background-color:#fcf7f7;line-height:36px;font-weight:bold;font-size:12px; font-size:11px;border:1px solid black ;">
'.$data1['id_vente'].'
</td>
</tr>

</table>' ; 


$pdf->writeHTML($date_recu1, true, false, false, false, '');



$pdf->SetFont('helvetica', 'B', 14); // Font: Times, Style: Italic, Size: 12
$pdf->SetTextColor(128, 128, 128);

// Write plain text
$pdf->setXY(10, 100);
$pdf->Cell(40,0,  'REÇU DE LIVRAISON', 0, 1, 'L');
$pdf->SetFont('helvetica', 'B', 9); // Font: Times, Style: Italic, Size: 12
$pdf->setXY(10, 145);
$pdf->Cell(40,0,  'Fix : 0522720698 / Téléphone : 0600964151', 0, 1, 'L');
$pdf->setXY(10, 140);
$pdf->Cell(10,0,  'LOT AL AMIRIA E 2 TIT MELLIL ', 0, 1, 'L');
$pdf->setXY(10, 135);
$pdf->Cell(50,0,  'EWM', 0, 1, 'L');



$pdf->setXY(103, 120);
$pdf->SetFillColor(255,255,255);
$pdf->SetFont('dejavusans', '', 7, '', true);
$pdf->setCellPadding(3,0,3,0 );
$pdf->SetFont('dejavusans', '', 7, '', true);
$pdf->writeHTMLCell(105, 0, '', '', $rightInfo, 0, 0, '');


$pdf->SetFont('helvetica', 'B', 9); // Font: Times, Style: Italic, Size: 12
$pdf->setXY(103, 145);
$pdf->Cell(40,0,  $data1['telephone'], 0, 1, 'L');
$pdf->setXY(103, 140);
$pdf->Cell(10,0,  $data1['adresse'], 0, 1, 'L');

$pdf->setXY(103, 135);

$pdf->Cell(50,0,  $data1['nom'], 0, 1, 'L');
$pdf->SetTextColor(0, 0, 0) ;

$pdf->SetTextColor(0, 0, 0);
$pdf->SetXY(10,158);

$pdf->writeHTML($tbl1, true, false, false, false, '');





















ob_end_clean();



$pdf->ln(4);
$pdf->SetFont('dejavusans', 'B', 7, '', true);

ob_end_clean();


$pdf->Output($data1['nom'] . '_bon_livraison.pdf', 'I');


?>