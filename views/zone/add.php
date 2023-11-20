  <?php
    if (isset($_POST['ajax'])) {
        include('../../evr.php');
    }

    ?>

  <div class="container-fluid disable-text-selection">
      <div class="row f" class="col-12">
          <div class="mb-2 col-12" >
              <h1>zone </h1>
              <div class="float-sm-right text-zero">
                  <button type="button" class="btn btn-success  url notlink" data-url="zone/index.php"> <i class="glyph-icon simple-icon-arrow-left"></i></button>
              </div>

          </div>

          <div class="separator mb-5"></div>
      </div>
  </div>

  <div class="row">
      <div class="col align-self-start">
          <div class="card mb-4">
              <div class="card-body">
                  <h5 class="mb-4">Ajouter Nouvelle Zone</h5>
                  <form id="addform" method="post" name="form_produit" enctype="multipart/form-data">
                      <input type="hidden" name="act" value="insert">
                      <div class="form-row">

                          <div class="form-group col-md-4">
                              <label for="nom"> Nom :</label>
                              <input type="text" class="form-control" id="libelle" name="libelle" placeholder='Nom'>
                          </div>
                          <div class="form-group col-md-4">
                              <label for="code_postal"> Code Postal :</label>
                              <input type="text" class="form-control" id="code_postal" name="code_postal" placeholder='Code Postal'>
                          </div>


                      </div>
                      <div class="float-sm-left">
                          <button type="submit" class="btn btn-primary btn-lg  mr-1 ">Enregistrer</button>
                      </div>
                      <!-- <div class="form-row">
                          <div class="col-md-4">
                          </div>
                          
                      </div> -->

                  </form>
              </div>
          </div>
      </div>
  </div>
  </div>

  <script type="text/javascript">
      $(document).ready(function() {

          $("#addform").on("submit", function(event) {
              event.preventDefault();

              var form = $(this);
              $.ajax({
                  type: "POST",
                  url: "<?php echo BASE_URL . 'views/zone/'; ?>controle.php",
                  data: new FormData(this),
                  dataType: 'text',
                  cache: false,
                  contentType: false,
                  processData: false,
                  success: function(data) {

                      if (data.trim() == "success") {
                          swal(
                              'Ajouter',
                              'zone a ete bien Ajouter',
                              'success'
                          ).then((result) => {



                              $.ajax({

                                  method: 'POST',
                                  data: {
                                      ajax: true
                                  },
                                  url: `<?php echo BASE_URL . "views/zone/index.php"; ?>`,
                                  context: document.body,
                                  success: function(data) {
                                      history.pushState({}, "", `<?php echo BASE_URL . "zone/index.php"; ?>`);
                                      $("#main").html(data);
                                  }
                              });
                          });
                      } else {

                          form.append(` <div id="alert-danger" class="alert  alert-danger alert-dismissible fade show rounded mb-0" role="alert">
                                <strong>${data}</strong> 
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>`);
                      }
                  }
              });
          });




      });
  </script>