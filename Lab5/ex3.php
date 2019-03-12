<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<?php
		require "Object.php";

		$sv = new Student();

		$sv->setName("Nguyễn Đình Ngọc");
		$sv->setAge("21");	
		$sv->setAddress("Nghệ An");
		$sv->setClass("CNTT2.01 K61");
		echo "<br>";
		$sv->display();
		echo "<br>";

		$gv = new Teacher();
		$gv->setName("Lê Thị Quỳnh Phương");
		$gv->setAge("40");
		$gv->setAddress("Nghệ An");
		$gv->setSubject("Toán");
		echo "<br>";	
		$gv->display();

	?>
</body>
</html>