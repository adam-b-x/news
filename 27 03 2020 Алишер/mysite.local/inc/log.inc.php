<?php
$dt = time();
$page = $_SERVER['REQUEST_URI'];
$ref = $_SERVER['HTTP_REFERER'];
$ref = pathinfo($ref, PATHINFO_BASENAME);
$path = "$dt | $page | $ref\n";
file_put_contents("log/".PATH_LOG, $path, FILE_APPEND);
?>
