<?php
include 'koneksi.php';
$id = $_POST['id_catatan'];
$nama = $_POST['catatan'];

$connect->query("UPDATE catatn SET nama='$nama'
 WHERE id_catatan='$id.'");
?>