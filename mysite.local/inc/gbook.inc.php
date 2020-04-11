<?php
/* Основные настройки */
const DB_HOST = 'localhost';
const DB_LOGIN = 'root';
const DB_PASSWORD = '';
const DB_NAME = 'gbook';
$link = mysqli_connect( DB_HOST, DB_LOGIN, DB_PASSWORD, DB_NAME);
if( !$link ){
    echo 'Ошибка: '
        . mysqli_connect_errno()
        . ':'
        . mysqli_connect_error();
}
/* Основные настройки */
/* Сохранение записи в БД */
if($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $message = $_POST['msg'];
    $result = mysqli_query($link, "INSERT INTO msgs (name, email, msg) VALUES ('$name', '$email', '$message')");
    if( !$result ){
        echo 'Ошибка: '
            . mysqli_errno($link)
            . ':'
            . mysqli_error($link);
    }
}

/* Сохранение записи в БД */

/* Удаление записи из БД */
if (isset($_GET['del'])) {
    $del=(int)$_GET['del'];
    $sql = "DELETE FROM msgs WHERE id = $del";
    $result = mysqli_query($link, $sql);
    if( !$result ){
        echo 'Ошибка: '
            . mysqli_errno($link)
            . ':'
            . mysqli_error($link);
    }
}
/* Удаление записи из БД */
?>
<h3>Оставьте запись в нашей Гостевой книге</h3>
<form method="post" action="<?= $_SERVER['REQUEST_URI']?>">
Имя: <br /><input type="text" name="name" /><br />
Email: <br /><input type="text" name="email" /><br />
Сообщение: <br /><textarea name="msg"></textarea><br />

<br />

<input type="submit" value="Отправить!" />

</form>
<?php
/* Вывод записей из БД */
$out = mysqli_query($link, 'SELECT id, name, email, msg, UNIX_TIMESTAMP(datetime) as dt FROM msgs ORDER BY id DESC');
if( !$out ){
    echo 'Ошибка: '
        . mysqli_errno($link)
        . ':'
        . mysqli_error($link);
}
mysqli_close($link);
/* Вывод записей из БД */
?>
<p>Всего записей в гостевой книге: <?php Mysqli_num_rows($out); ?></p>
<?php WHILE($row= mysqli_fetch_assoc($out)) { ?>
<p>
    <a href="mailto:<?=$row['email'];?>"><?=$row['name'];?></a>
    <?=date('d-m-Y H:i:s', $row['dt']);?> )
    написал<br /><?=$row['msg'];?>
</p>
<p align="right">
    <a href="index.php?id=gbook&del=<?=$row['id']; ?>">Удалить</a>
</p>

<?php }?>
