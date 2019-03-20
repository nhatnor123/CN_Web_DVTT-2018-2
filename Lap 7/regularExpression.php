<!DOCTYPE html>
<html>
<head>
	<title>Regular Expression</title>
</head>
<body>
	<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method = "POST">
		<table>
			<tr>
				<th>
					Email Address:
				</th>
				<td>
					<input type="text" name="email">
				</td>
			</tr>
			<tr>
				<th>
					URL Address :
				</th>
				<td>
					<input type="text" name="url">
				</td>
			</tr>
			<tr>
				<th>
					Phone Number:
				</th>
				<td>
					<input type="text" name="phone">
				</td>
			</tr>
			<tr>
				<td align="right">
					<input type="submit" name="SUBMIT" value="Check Valid">
				</td>
				<td align="left">
					<input type="reset" name="RESET">
				</td>
			</tr>

		</table>

		<div>

			<?php
			if($_SERVER["REQUEST_METHOD"] == "POST"){
				$email = $_POST['email'];
				$url = $_POST['url'];
				$phone = $_POST['phone'];

				print("<br>");
				$checkEmail = preg_match('/^[a-z][a-z0-9_\.]{5,32}@[a-z0-9]{2,}(\.[a-z0-9]{2,4}){1,2}$/', $email);
				if ($checkEmail){
					print("Valid email = ");
				} else {
					print("Invalid email = ");
				}
				print($email);
				print("<br>");
				
				$checkUrl = preg_match( '/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i', $url);
				if ($checkUrl){
					print("Valid url = ");
				} else {
					print("Invalid url = ");
				}
				print($url);
				print("<br>");


				$checkPhone1 = preg_match("/(09|01[2|6|8|9])+([0-9]{8})\b/", $phone);
				$checkPhone2 = preg_match("/(08[1|2|3|4|5]|03[2|3|4|5|6|7|8|9]|07[0|9|7|6|8]|05[6|8])+([0-9]{7})\b/", $phone);

				if ($checkPhone1||$checkPhone2){
					print("Valid phone = ");
				} else {
					print("Invalid phone = ");
				}
				print($phone);
				print("<br>");
			}


			?>

		</div>

	</form>
</body>
</html>