
<html>
<head>
</head>
<body>
    <a href="upload.php">Quay lại</a>
</body>
</html>
<?php 
$dir = 'upload/';
$cdir = scandir($dir); 
foreach ($cdir as $key => $value) {
    if (!in_array($value,array(".",".."))) {
        if (is_dir($dir . DIRECTORY_SEPARATOR . $value))
        {
            $result[$value] = dirToArray($dir . DIRECTORY_SEPARATOR . $value);
        }
        else
        {
            $result[] = $value;
        }
    }   
}
asort($result);
date_default_timezone_set('Asia/Ho_Chi_Minh');
echo "<p>Sắp xếp file theo tên - thử tự alphabet</p>";
for($i = 0; $i < count($result); $i++){
    $filename = $result[$i];
    echo "<b>$filename</b> được sửa lần cuối lúc : " . '<b>'.date ("F d Y H:i:s.", filemtime($dir.$filename))."</b> - kích thước :". '<b>'.filesize($dir.$filename) . "</b> bytes "."<br/><br/>";
}
?>