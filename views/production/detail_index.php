<?php
if (isset($_POST['ajax'])) {
include('../../evr.php');
}
 $detail_commande = new detail_commande();
 $id = explode('?id=',$_SERVER["REQUEST_URI"])[1];

$data = $detail_commande->selectAllValide($id);
$poids  = connexion::getConnexion()->query("select * from poids ")->fetch(PDO::FETCH_OBJ)->valeur ;  
$commande = connexion::getConnexion()->query("select * from boncommande where id_bon = ".$id)->fetch(PDO::FETCH_OBJ); 
?>

<script>
  $(".sidebar").remove() ;
</script>
<style type="text/css">

</style>

<div class="container-fluid disable-text-selection">
  <div class="row">
    <div class="col-12">
      <div class="mb-2  d-flex justify-content-between">
        <h1>Detail commande N° : <?php echo $id ?></h1>
        <input type="hidden" id="id_bon" value="<?php echo $id  ?>"/>
        <div class="float-sm-right text-zero">
                    <button type="button" class="btn btn-success  url notlink" data-url="production/index.php" > <i class="glyph-icon simple-icon-arrow-left"></i></button>
                </div>
        <!-- <div class="float-sm-right text-zero">
          <button type="button" class="btn btn-primary btn-lg  mr-1 url notlink" data-url="production/add.php?id=<?php echo $id ?>" >AJOUTER</button>
        </div> -->
        
      </div>
      <div class="separator mb-5"></div>
    </div>
  </div>
  <div class="row">
    
     
    
    <div class="col-xl-12 col-lg-12 mb-4">
      <div class="card h-100">
        <div class="card-body">
         
            <table class="table  responsive table-striped table-bordered table-hover" id="datatables" >
              <thead>
                <tr>
                  <th scope="col" width="1px">Id</th>
                  <th scope="col">Produit</th>
                  <!-- <th>Prix</th> -->
                  <!-- <th>Remise</th> -->
                  <th>P.R</th>
                  <th scope="col" style='width:170px;'> Qte</th>
                  <!-- <th scope="col"> Unite</th> -->
                  <th scope="col"> Qte*Prix</th>
                  <!-- <th scope="col">Dépot</th> -->
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $total = 0;
                foreach($data as $ligne) {
                ?>
                <tr id="<?php echo $ligne->id_detail; ?>">
                  <td><?php echo $ligne->id_detail; ?></td>
                  <td id="<?php echo $ligne->id_produit; ?>"><?php echo $ligne->designation; ?></td>
                  <!-- <td style="text-align:right;">
                    <label>
                      <?php // echo $ligne->prix_produit; ?>
                    </label> <input
                    type='text' value="<?php // echo $ligne->prix_produit; ?>"/>
                  </td> -->
                  <!-- <td style="text-align:right;">
                    <label>
                      <?php // echo $ligne->remise; ?>
                    </label> <input
                    type='text' value="<?php // echo $ligne->remise; ?>"/>
                  </td> -->
                  <td style="text-align:right;"> <?php $prixr = $ligne->prix_produit * (1-$ligne->remise/100); echo number_format($prixr, 2, '.', ''); ?>  </td>
                  <td style="text-align:right;">
                    <label>
                      <?php echo $poids; ?>
                    </label>
                    <input style='width:80px;' type='text'
                    value="<?php echo $poids; ?>"/>
                    <span 
                      id="qte<?php echo $poids; ?>">
                    </span>
                  </td>

                  <!-- <td class="d-flex flex-row">
                  <label >
                  <?php if(!empty($ligne->valunit) && !empty($ligne->unit)){
                    echo $ligne->valunit." ".$ligne->unit;
                  }
                  ?>
                  </label>
                 
                  <input style="text-align:left;width: 40px;" type="text" name="" id=""  value="<?php if(!empty($ligne->valunit) && !empty($ligne->unit)){
                    // echo $ligne->valunit;
                  }
                  ?>
                  ">
                  <input style="text-align:left;width: 40px;" type="text" name="" id="" value="<?php if(!empty($ligne->valunit) && !empty($ligne->unit)){
                    // echo $ligne->unit;
                  }
                  ?>
                  ">
                  </td> -->
                  
                  <td style="text-align:right;" width="90">
                    <?php 
                    if(!empty($ligne->valunit) || $ligne->valunit!=0){
                    echo number_format($ligne->valunit* $prixr , 2, '.', '');
                    }else{
                      echo number_format($ligne->qte_vendu * $prixr, 2, '.', '');
                    }
                   
                    // var_dump($tva);
                    if(!empty($ligne->valunit) || $ligne->valunit!=0){
                      $total += ($ligne->valunit* $prixr);
                      
                    }else{
                      $total += $ligne->qte_vendu * $prixr ;
                    }
                    
                    ?>
                  </td>
                  <!-- <td>
                  	 <?php // echo $ligne->depot ?>
                  </td> -->
                  <td>
                    <?php // if(auth::user()['privilege'] == 'Admin') { ?>
                      <a class="badge badge-info mb-2  " style="color: white;cursor: pointer;" 
                      title="Imprimer detail commandes" href="<?php echo BASE_URL . "views/production/facture.php?id=" .$ligne->id_detail ?>" target="_black">
                          <i class=" simple-icon-printer" style="font-size: 15px;"></i>
                        </a>

                        <a
                        class="badge  mb-2  <?php echo !$ligne->valide ? 'badge-success valide_commande ' : 'badge-secondary ' ?>"
                        
                        title="<?php echo $ligne->valide ? 'commande validé valide_commande' : 'valider commande' ?>" type="button"
                        style="color: white;cursor: pointer;" id="btn_valide_<?php echo $ligne->detail; ?>"
                        data-id="<?php echo $ligne->id_detail; ?>"
                        data-valide="<?php echo $ligne->valide; ?>">
                        <i class="simple-icon-check" style="font-size: 15px;"></i>
                      </a>
                    <?php // } ?>
                    
                  </td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
             <h1 id="total">Total : <?php echo  number_format( $total, 2, '.', '') ?> DH 
             <input type="hidden" value="<?php echo  number_format( $total, 2, '.', '') ?>" class="mytotal">
             </h1>

         
        </div>
      </div>
    </div>

  </div>
</div>

<script type="text/javascript">            
$(document).ready(function () {
    $('.valide_commande').click( function (e) {
        // e.preventDefault() ; 
      
        let id_detail_commande = $(this).attr('data-id');
        let valide = $(this).attr('data-valide');
        let id_bon_commande = <?php echo $id ?> ;  
        let remarque  = `<?php echo $commande->remarque ?>`  ; 
        let id_client  = `<?php echo $commande->id_client ?>` ; 
       
        // document.getElementById('btn_valide_' + id).style.display = 'none';
        $.ajax({
          type: "POST",
          url: "<?php echo BASE_URL . 'views/bon-commande/controle.php' ?>",
          data: {
            act: 'valide_detail_commande',
            id_detail_commande: id_detail_commande , 
            id_bon_commande : id_bon_commande , 
            remarque: remarque , 
            id_client  : id_client ,
            qte : <?php echo $poids ;?> , 
            valide : valide 
          },
          dataType: 'text',
          success: function (data) {
            swal(
              'Validation Commande',
              'detail commande  N°' + id_detail_commande + ' a ete bien validé',
              'success'
            ).then((result) => {
              location.reload();
            });
          }
        })

      })

       $("input.datepicker").datepicker({
                     format: 'yyyy-mm-dd',
                     templates: {
                     leftArrow: '<i class="simple-icon-arrow-left"></i>',
                     rightArrow: '<i class="simple-icon-arrow-right"></i>'
                     }
                });



          
       var table =    $('#datatables').dataTable({
                 order: [[ 0, "desc" ]],
                dom: 'Bfrtip',
                  buttons: [

                  ],
                pageLength: 10,
                language: {
                paginate: {
                previous: "<i class='simple-icon-arrow-left'></i>",
                next: "<i class='simple-icon-arrow-right'></i>"
                }
                },
                drawCallback: function() {
                $($(".dataTables_wrapper .pagination li:first-of-type")).find("a").addClass("prev"),
                $($(".dataTables_wrapper .pagination li:last-of-type")).find("a").addClass("next"),
                $(".dataTables_wrapper .pagination").addClass("pagination-sm")
                }
            });
            



            $('body').on( "click",".delete", function( event ) {
             event.preventDefault();


                    var btn = $(this);
                swal({
                 title: 'Êtes-vous sûr?',
                  text: "Voulez vous vraiment Supprimer ce commande !",
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#d33',
                  cancelButtonColor: '#3085d6',
                  confirmButtonText: 'Oui, Supprimer !'
                }).then((result) => {
                  if (result.value) {

                $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL.'views/detail_commande/' ;?>controle.php",
                data: {act:"delete",id: btn.data('id')},
                success: function (data) {
                   
                   swal(
                      'Supprimer',
                      'commande a ete bien Supprimer',
                      'success'
                    ).then((result) => {
                        btn.parents("td").parents("tr").remove();
                        location.reload();
                    });
                   
                }
                 });
                    
                  }
                });
           
            });


        $('body').on( "click",".archive", function( event ) {
             event.preventDefault();


                    var btn = $(this);
                swal({
                 title: 'Êtes-vous sûr?',
                  text: "Voulez vous vraiment Archiver ce commande !!",
                  type: 'warning',
                  showCancelButton: true,
                  confirmButtonColor: '#145388',
                  cancelButtonColor: '#3085d6',
                  confirmButtonText: 'Oui, Archiver!'
                }).then((result) => {
                  if (result.value) {

                $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL.'views/detail_commande/' ;?>controle.php",
                data: {act:"archive",id: btn.data('id'),val:btn.data('arc')},
                success: function (data) {
                   
                               swal(
                                 "Archived",
                                  'Your Product has been archived.',
                                  'success'
                                ).then((result) => {
                                    btn.parents("td").parents("tr").remove();
                                });
                               
                            }
                        });
                    
                  }
                });
           
            });
            

              $('body').on( "click",".static", function( event ) {
                 event.preventDefault();

                  var btn = $(this); 
                     $.ajax({
                    type: "POST",
                    url: "<?php echo BASE_URL.'views/detail_commande/' ;?>controle.php",
                    data: {act:"getName",id: btn.data('id')},
                    success: function (datas) {
                        var data = datas.split(';;;');
                                $('#exampleModalRight .modal-title').html("Etat commande "+data[1]);
                                $('#idstatic').val(data[0]);
                                }
                            });

          
           
            });


        $("#Staticform" ).on( "submit", function( event ) {
             event.preventDefault();

             var form = $( this );
             $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL.'views/detail_commande/' ;?>controle.php",
                data: new FormData(this),
                dataType: 'text',  // what to expect back from the PHP script, if anything
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                

                      $('#etatstatic').html(data);  
                         
                                              
                        }
                    });
                   
         });


        $('#datatables tbody').on( 'click', '.updatee', function () {


var value = $(this).data('id');
    $('#' + value).find("label").hide();
    $('#' + value).find("input[type='text']").show();
    $('#' + value).children("td:eq(9)").html("<input type='button' class='Applique'  value='Applique'data-id= '" + value + "' />");

    
} );

 
$('#datatables tbody').on( 'click', '.Applique', function () 
  {

	
    var value = $(this).data('id');
    var qte = $('#' + value).find("input[type='text']:eq(2)").val();
    var reste_stock = parseInt($('#qte' + value).html());
    var prix = $('#' + value).find("input[type='text']:eq(0)").val();
    var remise = $('#' + value).find("input[type='text']:eq(1)").val();
    var unit = $('#' + value).find("input[type='text']:eq(4)").val();
    var valunit = $('#' + value).find("input[type='text']:eq(3)").val();
	    
    $.ajax({
    type: "POST",
    url: "<?php echo BASE_URL.'views/detail_commande/' ;?>controle.php",
    data: {act:'update_detail', 
		   id_detail: $(this).data('id'),
		   id_bon: $('#id_bon').val(),
		   remise: remise,
		   prix_produit: prix,
		   qte_vendu: qte, 
		   unit: $('#' + value).find("input[type='text']:eq(4)").val(),
		   valunit: $('#' + value).find("input[type='text']:eq(3)").val(),
		   id_produit: $('#' + value).children("td:eq(1)").attr('id'),
		   qte_venduh: $('#' + value).find("label:eq(2)").html(),
		  
		  },
    success: function (data) {
	console.log(data);
		
    $('#' + value).find("label:eq(0)").html($('#' + value).find("input[type='text']:eq(0)").val());
    $('#' + value).find("label:eq(1)").html($('#' + value).find("input[type='text']:eq(1)").val());
    $('#' + value).find("label:eq(2)").html($('#' + value).find("input[type='text']:eq(2)").val());
    $('#' + value).find("label:eq(3)").html($('#' + value).find("input[type='text']:eq(3)").val()+' '+$('#' + value).find("input[type='text']:eq(4)").val());
      
    $('#' + value).find("label").show();
    $('#' + value).find("input[type='text']").hide();
   
    $('#' + value).children("td:eq(9)").html(`<a class="badge badge-danger mb-2 delete" data-id="<?php echo $ligne->id_detail; ?>" style="color: white;cursor: pointer;" title="Supprimer" href='javascript:void(0)' >
                      <i class="simple-icon-trash" style="font-size: 15px;"></i>
                    </a>
                    
                    <a class="badge badge-warning mb-2 updatee " data-id="<?php echo $ligne->id_detail; ?>" style="color: white;cursor: pointer;" title="Modifier"
                      href="javascript:void(0)">
                      <i class="iconsmind-Pen-5" style="font-size: 15px;"> </i>
                    </a>`);
    if(valunit!=null || valunit!=0)
    {
      $('#' + value).children("td:eq(7)").html(parseFloat(prix) *parseFloat(valunit) * (1 - remise/100) );
    } if(valunit==null || valunit==0){
      alert(parseFloat(prix) *parseFloat(qte) * (1 - remise/100) );
      $('#' + value).children("td:eq(7)").html(parseFloat(prix) *parseFloat(qte) * (1 - remise/100) );
    }             
    
    $('#qte' + value).html("");
    $('#total').html("Total : "+data+" DH");
  
    },error: function(error){
      console.log(error);
    }
    });
    
    })






 });




      </script>