<?php
require "koneksi.php";
if ($_SERVER['REQUEST_METHOD'] == "POST") {
$response = array();
$email = $_POST['email'];
$password = md5($_POST['password']);
$nama = $_POST['nama'];
$telp = $_POST['telp'];
$jk = $_POST['jk'];



$cek = "SELECT * FROM tb_user WHERE email='$email'";
$result = mysqli_fetch_array(mysqli_query($connect, $cek));
if (isset($result)) {
$response['value'] =2;
$response['message'] = "Email telah digunakan";
echo json_encode($response);
} else {
$insert = "INSERT INTO tb_user (nama,email,telp,password,Jk) VALUES('$nama','$email', '$telp', '$password','$jk')";
if (mysqli_query($connect, $insert)) {
$response['value'] =1;
$response['message'] = "Berhasil didaftarkan";

echo json_encode($response);
} else {
$response['value'] = 0;
$response['message'] = "Gagal didaftarkan";
echo json_encode($response);
}
}
}
?>
