<!DOCTYPE html>
<html>
<head>
	<title>DateTimeFunction</title>
</head>
<body>
	<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method = "POST">
		<table>
			<tr>
				<th>
					Người 
				</th>
				<th>
					Họ và tên
				</th>
				<th>
					Ngày tháng năm sinh
				</th>
			</tr>
			<tr>
				<td>
					Người 1
				</td>
				<td>
					<input type="text" name="name1">	
				</td>
				<td>
					<input type="text" name="ngay1" style="width: 30px"> /
					<input type="text" name="thang1"style="width: 30px"> /
					<input type="text" name="nam1"style="width: 35px">
				</td>		
			</tr>
			<tr>
				<td>
					Người 2
				</td>
				<td>
					<input type="text" name="name2">	
				</td>
				<td>
					<input type="text" name="ngay2"style="width: 30px">	/
					<input type="text" name="thang2"style="width: 30px"> /
					<input type="text" name="nam2"style="width: 35px">
				</td>		
			</tr>
			
			<tr>
				<td align="right">
					<input type="submit" name="SUBMIT">
				</td>
				<td align="left">
					<input type="reset" name="RESET">
				</td>
			</tr>
		</table>

		<div>
			<?php
			date_default_timezone_set('Asia/Ho_Chi_Minh');
			$name1 = $name2 = $ngay1 =$ngay2 = $thang1 = $thang2 = $nam1 = $nam2 = 0;

			if($_SERVER["REQUEST_METHOD"] == "POST"){
				$name1 = $_POST["name1"];
				$ngay1 = $_POST["ngay1"];
				$thang1 = $_POST["thang1"];
				$nam1 = $_POST["nam1"];
				$name2 = $_POST["name2"];
				$ngay2 = $_POST["ngay2"];
				$thang2 = $_POST["thang2"];
				$nam2 = $_POST["nam2"];


				$birthday1 = $ngay1.'-'.$thang1.'-'.$nam1;
				$birthday2 = $ngay2.'-'.$thang2.'-'.$nam2;

				if (date('d-m-Y',strtotime($birthday1))==$birthday1  &&date('d-m-Y',strtotime($birthday2))==$birthday2 )
				{
					print("<br>");
					print("Ngày sinh nhập đúng");
					print("<br>");
					print("<br>");

					print($name1." : ".date('l, F d, Y',strtotime($birthday1)));
					print("<br>");
					print($name2." : ".date('l, F d, Y',strtotime($birthday2)));
					print("<br>");
					print("<br>");

					$khoangcach = abs(round((strtotime($birthday2) - strtotime($birthday1))/86400));
					print("Khoảng cách giữa ngày sinh của 2 người : ");
					print($khoangcach);
					print(" ngày <br><br>	");
					
					$now = time();
					$tuoi1 = abs( round( (strtotime(date("d-m-Y",$now))- strtotime($birthday1)  ) /31536000 ) );
					$tuoi2 = abs( round( (strtotime(date("d-m-Y",$now))- strtotime($birthday2)  ) /31536000 ) );
					print("Tuổi của ".$name1." là : ".$tuoi1." tuổi"."<br>");
					print("Tuổi của ".$name2." là : ".$tuoi2." tuổi"."<br>");
					print("Khoảng cách tuổi giữa 2 người : ".(abs($tuoi1-$tuoi2)). " tuổi");

				} else {
					print("Ngày sinh nhập sai !!! Vui lòng nhập lại");
				}

			}

			?>
		</div>

	</form>
</body>
</html>