<?php
// if (isset($_POST['ajax'])) {
  include('../../evr.php');
// }
$boncommande = new boncommande();
$data = $boncommande->selectAll3(date('Y') . '-' . date('m') );
?>

<script>
  $(".sidebar").remove() ; 
</script>
<div class="container-fluid responsive disable-text-selection  col-sm-12">
  <div class="row">
    <div class="col-xl-12 col-lg-12 mb-4">
      <div class="mb-2 d-flex justify-content-between">
        <h1>Inventaire Bon Commande </h1>
        <!-- <div class="float-sm-right text-zero">
          <button type="button" class="btn btn-success  url notlink" data-url="bon_commande/inventaire_bon_commande.php"> <i class="glyph-icon simple-icon-arrow-left"></i></button>
        </div> -->
      </div>
      <div class="separator mb-5"></div>
      </div>
      </div>
  <div class="row">
    <!-- <div class="col-12">
      <div class="mb-2">
        <h1>Liste Des commandes</h1>
      </div>
     -->
  </div>
  <div class="row">
    <div class="col-xl-12 col-lg-12  col-sm-12 mb-4">
      <div class="card h-100">
        <div class="card-body">
          <form method="get" name="frm" id="formfilter">
            <div class="form-row">
              <div class="form-group col-md-2">
                <h4 class="mt-5 ">Mois de recherche : </h4>
              </div>
              <div class="form-group col-md-2">
                <label for="id_client">A : </label>
                <select name='anne' class="form-control" id="anne">
                  <option value="0">Tous</option>
                  <?php for ($d = Date("Y"); $d >= 2009; $d--)
                    echo "<option value='$d'> $d</option>"; ?>
                </select>
              </div>
              <div class="form-group col-md-2">
                <label> M: </label>
                <select name='mois' class="form-control" id="mois">
                  <option value="0">Tous</option>
                  <?php for ($m = 1; $m <= 9; $m++)
                    echo "<option value='0$m' >0$m</option>"; ?>
                  <?php for ($m = 10; $m <= 12; $m++)
                    echo "<option value='$m' >$m</option>"; ?>
                </select>
              </div>
              <div class="form-group col-md-2">
                <button type="button" class="btn btn-success default btn-lg btn-block mr-1 sub " style="margin-top: 30px;">Afficher</button>
              </div>
            </div>
          </form>
          <div >
          <div class="col align-self-start">
    </div>
    <div class="card mb-4">
        <div class="card-body">
          <form id="addform" method="post" name="form_produit" enctype="multipart/form-data">
            <div class="form-row">
              <div class="form-group col-md-6 col-sm-12">
                <label for="id_client">Client : </label>
                <select class="form-control select2-single" name="id_client" id="id_client">
                    <option value ="tout" >Selectionner Client</option>
                  <?php
                  $client = new client();
                  $clients = $client->selectChamps("*", '', '', 'nom', 'asc');
                  foreach ($clients as $row) {
                    if (isset($client_key)) {
                      echo '<option value="' . $row->id_client . '" ' . (($row->id_client == $client_key) ? "selected" : "") . '>' . $row->nom . '</option>';
                    } else {
                      echo '<option value="' . $row->id_client . '">' . $row->nom . '</option>';
                    }
                  } ?>
                </select>
              </div>
              </form>
        </div>
      </div>
      <div id="results">
      <table class="table  responsive table-striped table-bordered table-hover " id="datatables">
              <thead>
                <tr>
                  <th scope="col">Id</th>
                  <th scope="col">Client</th>
                   <th scope="col"> Montant</th>
                  <!-- <th scope="col"> Reste</th> --> 
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
                    <!-- <td style="text-align: right;"> <?php
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
                    </td> -->
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
      </div>
          </div>
        </div>
      </div>
    </div>
</div>
<script type="text/javascript">
  $(document).ready(function() {
    $("input.datepicker").datepicker({
      format: 'yyyy-mm-dd',
      templates: {
        leftArrow: '<i class="simple-icon-arrow-left"></i>',
        rightArrow: '<i class="simple-icon-arrow-right"></i>'
      }
    })
    $('#datatables').dataTable({
      responsive: false,
      order: [
        [0, "desc"]
      ],
      dom: 'tp',
      buttons: [
      ],
      pageLength: 20,
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





    
$("#id_client").change(function() {
$.ajax({
  type: "POST",
  url: "<?php echo BASE_URL . 'views/production/'; ?>controle.php",
  dataType: 'text',
  data: {
    act: "get_bon_commandes",
    id_client: $("#id_client").val()
  },
  success: function(data) {
    console.log(data) ; 
    $("#results").html(data);
          $('#datatables').dataTable({
            order: [
              [0, "desc"]
            ],
            dom: 'tp',
            buttons: [],
            pageLength: 20,
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
  }
})


$(".sub").on("click", function(event) {
      event.preventDefault();
      $("#results").html('<div class="col-md-12"><br><br><br><br><div class="loading"></div></div>');
      var form = $(this);
      $.ajax({
        type: "POST",
        url: "<?php echo BASE_URL . 'views/production/'; ?>controle.php",
        data: {
          act:"get_bon_commandes" , 
          anne  : $('#anne').val() , 
          mois  : $('#mois').val() ,   
          id_client  : $('#id_client').val()   
        },
        dataType: 'text',

        success: function(data) {
          $("#results").html(data);
          $('#datatables').dataTable({
            order: [
              [0, "desc"]
            ],
            dom: 't',
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
        }
      });
    });
})
  })
</script>
