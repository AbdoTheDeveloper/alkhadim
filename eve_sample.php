<?php
session_start();
error_reporting(0);
ini_set('display_errors', 0);

define('SERVER','localhost');
define('DATABASE','alkhadim');
define('USER','root');
define('PASSWORD','');
define('BASE_URL','/alkhadim.ma/');
 
function __autoload($class_name) 
{
   include_once('model/'.$class_name.'.php');
}







?>
