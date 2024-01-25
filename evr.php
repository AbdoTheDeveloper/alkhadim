<?php


 include('eve.php');



 

// function generateForm($operation) {
//     // Escape the parameter to prevent XSS attacks
//     $escapedClientValue = htmlspecialchars($operation, ENT_QUOTES, 'UTF-8');

//     // Build the HTML code using the parameter
//     $htmlCode = '<div class="form-group col-md-2">
//                     <label for="remarque"> $operation :</label>
//                     <div class="mb-4">
//                         <div style="display: inline-block;" class="custom-control custom-radio">
//                             <input type="radio" id="$operation.1" value="1"  name="$operation" class="custom-control-input">
//                             <label class="custom-control-label" for="$operation.1">Oui</label>
//                         </div>
//                         <div style="display: inline-block; margin-left: 20px;" class="custom-control custom-radio">
//                             <input type="radio" id="$operation.2" value="0" name="$operation" class="custom-control-input">
//                             <label class="custom-control-label" for="$operation.2">Non</label>
//                         </div>
//                     </div>
//                 </div>';

//     // Return the HTML code
//     return $htmlCode;
// }
  // echo generateForm('client') ;
  // dd() ;  

 function debug($param) { 
  if(is_array($param)){
    var_dump($param);
    die()    ; 
  }else {
    var_dump($param) ;
    die() ;  
  } ;


 }

if (auth::user() == null){

die("<script language=javascript >document.location.href='".BASE_URL."login.php"."';</script>");
 // header("Location:".BASE_URL."login.php");

  }

?>