  <?php
if (isset($_POST['ajax'])) {
include('../../evr.php');
}
$vente=new vente();
$id = explode('?id=',$_SERVER["REQUEST_URI"]);
$oldvalue=$vente->selectById($id[1]);
?>
<div class="container-fluid disable-text-selection">
<div class="row">
        <div class="col-12">
            <div class="mb-2">
                <h1>ventes </h1>
                <div class="float-sm-right text-zero">
          <button type="button" class="btn btn-success  url notlink" data-url="detail_depot/index.php"> <i
              class="glyph-icon simple-icon-arrow-left"></i></button>
        </div>
            </div>
            <div class="separator mb-5"></div>
        </div>
    </div>
    <div class="row">
        <div class="col align-self-start">
  <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="mb-4">Modification vente</h5>
                          <form id="addform" method="post" name="form_vente" enctype="multipart/form-data">
                                  <div class="col-md-4">
                                    <input type="text" 
                                  </div>
                                </form>
                        </div>
                    </div>
                </div>
            </div>
</div>
<script type="text/javascript">
    $( document ).ready(function() {
        $(".select2-single").select2({
            theme: "bootstrap",
            placeholder: "",
            maximumSelectionSize: 6,
            containerCssClass: ":all:"
        });
    $("#id_categorie").change(function() {
            var id_categorie = $(this).val();
            $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL.'views/vente/' ;?>controle.php",
                data: {act:"getcat",id_categorie: id_categorie},
                success: function (data) {
                    $('#code_bar').val(data);
                }
            });
});
    $("#addform" ).on( "submit", function( event ) {
             event.preventDefault();
             var form = $( this );
             $.ajax({
                type: "POST",
                url: "<?php echo BASE_URL.'views/vente/' ;?>controle.php",
                data: new FormData(this),
                dataType: 'text',  // what to expect back from the PHP script, if anything
                cache: false,
                contentType: false,
                processData: false,
                success: function (data) {
                if (data=="success") {
                    form.append(` <div id="alert-success" class="alert  alert-success alert-dismissible fade show rounded mb-0" role="alert"> <strong>vente bient Modifie</strong> <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button> </div>`);
                }
                else{
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
$('#back').click(function(){
    history.back() ; 
})
});
</script>
