<?php
include 'koneksi.php';

$id=$_POST['id_catatan'];
$connect->query("DELETE FROM catatn WHERE id_catatan='$id'");

?>