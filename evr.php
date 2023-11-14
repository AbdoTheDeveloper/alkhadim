<?php


 include('eve.php');

 function debug($param) { 
  if(is_array($param)){
    print_r($param);
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