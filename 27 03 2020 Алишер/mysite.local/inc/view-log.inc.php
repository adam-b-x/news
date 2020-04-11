<?php
if (is_file('log/'.PATH_LOG)) {
$log = file('log/'.PATH_LOG);
    echo "<ol>";
    foreach ($log as $line) {
    list($dt, $ref, $page) = explode("|", $line);
        $dt = date('d:m:Y H:i:s', $dt);
        echo <<<OUT
			<li>
			&nbsp	[$dt]: $ref --> $page
			</li>
OUT;
    }
        echo "</ol>";
}
?>
