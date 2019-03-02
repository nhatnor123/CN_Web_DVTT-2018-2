<!DOCTYPE html>
<html>
<head>
	<title>Lap3.1</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
	<center>
		<form action="handlingEx1.php" method="POST">
			<table>
				<thead>
					<th><h3>Thông tin của sinh viên</h3></th>
				</thead>

				<tbody>
					<tr>
						<td>Nhập họ tên</td>
						<td><input type="text" name="fullname"></td>
					</tr>
					<tr>
						<td>Ngày sinh</td>
						<td><input type="date" name="birthday"></td>
					</tr>
					<tr>
						<td>Giới tính</td>
						<td>
							<input type="radio" name="gender" value="male">Nam
							<input type="radio" name="gender" value="female">Nữ
							<input type="radio" name="gender" value="orther">Khác
						</td>
					</tr>
					<tr>
						<td>Quê quán</td>
						<td><input type="text" name="hometown"></td>
					</tr>
					<tr>
						<td>Sinh viên trường</td>
						<td><input type="text" name="university"></td>
					</tr>
					<tr>
						<td>Năm tốt nghiệp</td>
						<td><input type="text" name="graduation"></td>
					</tr>
					<tr>
						<td>Sở thích cá nhân</td>
						<td>
							<input type="checkbox" name="hobby[]" value="sleep">Ngủ<br>
  							<input type="checkbox" name="hobby[]" value="watchTV">Xem TV<br> 
  							<input type="checkbox" name="hobby[]" value="playgame">Chơi game<br>
  							<input type="checkbox" name="hobby[]" value="code">Lập trình<br> 
						</td>
					</tr>
					<tr>
						<td>Đã lập trình với</td>
						<td>
							<input type="checkbox" name="codeLanguage[]" value="Java">Java<br>
  							<input type="checkbox" name="codeLanguage[]" value="PHP">PHP<br> 
  							<input type="checkbox" name="codeLanguage[]" value="C/C++">C/C++<br>
  							<input type="checkbox" name="codeLanguage[]" value="Python">Python<br>
  							<input type="checkbox" name="codeLanguage[]	" value="JavaScript">JavaScript<br> 
						</td>
					</tr>
					<tr>
						<td><input type="submit" name="submit"></td>
						<td><input type="reset" name="reset"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</center>
</body>
</html>