<?php
include 'koneksi.php';

$nama = $_POST['catatan'];

$connect->query("INSERT INTO catatn (catatan)
values('".$nama."')");
?>