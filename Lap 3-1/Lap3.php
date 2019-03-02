<!DOCTYPE html>
<html>
<head>
	<title>
		Date time validation
	</title>
</head>
<body>
	Enter your name and select date and time for the appointment
	<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method = "GET" > 
		<table>
			<tr>
				<td>
					Your name : 
				</td>
				<td>
					<input type="text" name="YourName">
				</td>
			</tr>
			<tr>
				<td>
					Date :
				</td>
				<td>
					<select name="ngay">
						<?php 
						$thang =2;
						$nam =1999;
						if ($thang == 2){
							if ($nam %4 == 0 ){
								if ($nam %100 == 0){
									if ($nam %400 == 0){
										$max_ngay == 29;
									} else{
										$max_ngay == 28;
									}
								} else {
									$max_ngay == 29;
								}
							} else {
								$max_ngay = 28;
							}
						} elseif ($thang == 4 || $thang ==6||$thang ==9||$thang ==11) {
							$max_ngay == 30;
						} else {
							$max_ngay == 31;
						}


						for ($i = 1; $i <=$max_ngay; $i ++){
							print("<option>$i</option>");

						}
						?>
					</select>
				</td>
				<td>
					<select name="thang">
						<?php 
						for ($i = 1; $i <=12; $i ++){
							print("<option>$i</option>");

						}
						?>
					</select>
				</td>
				<td>
					<select name="nam">
						<?php 
						for ($i = 0; $i <=1000; $i ++){
							print("<option>$i</option>");

						}
						?>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					Time :
				</td>
				<td>
					<select name="gio">
						<?php 
						for ($i = 0; $i <=24; $i ++){
							print("<option>$i</option>");

						}
						?>
					</select>
				</td>
				<td>
					<select name="phut">
						<?php 
						for ($i = 0; $i <=60; $i ++){
							print("<option>$i</option>");

						}
						?>
					</select>
				</td>
				<td>
					<select name="giay">
						<?php 
						for ($i = 0; $i <=60; $i ++){
							print("<option>$i</option>");

						}
						?>
					</select>
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
			$YourName = $_GET['YourName'];
			$ngay = $_GET['ngay'];
			$thang = $_GET['thang'];
			$nam = $_GET['nam'];
			$gio = $_GET['gio'];
			$phut = $_GET['phut'];
			$giay = $_GET['giay'];
			print("Hi $YourName");
			print("</br>You have choose to have an appointment on $gio:$phut:$giay, $ngay/$thang/$nam");
			print("</br>More infomation");
			if ($gio >=12){
				$gio -=12;
			}
			print("<br/>In 12 hours, the time and date is $gio:$phut:$giay PM, $ngay/$thang/$nam");
			print("<br/>This mounth has $thang day")

			?>
			



		</div>
		
	</form>
</body>
</html>