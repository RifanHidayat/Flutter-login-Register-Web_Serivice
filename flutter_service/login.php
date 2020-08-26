<?php
require "koneksi.php";
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
$response = array();
$email = $_POST['email'];
$password = md5($_POST['password']);
// langkah 2
$cek = "SELECT * FROM tb_user WHERE email='$email' and password='$password'";
$result = mysqli_fetch_array(mysqli_query($connect, $cek));
if (isset($result)) {
$response['value'] = 1;
$response['message'] = "Login berhasil";
$response['email'] = $result['email'];
$response['nama'] = $result['nama'];
$response['telp'] = $result['telp'];
$response['jk'] = $result['Jk'];
$response['id'] = $result['id'];
echo json_encode($response);
} else {
$response['value'] = 0;
$response['message'] = "Login gagal";
echo json_encode($response);
}
}
?>
