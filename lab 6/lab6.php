

<!DOCTYPE html>
<html>
<head>
	<title>admin.php</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<p style="font-size: 24px;">Category Administration</p>
		</div>
		<div class="row">
			<table class="table table-bordered">
				<thead>
			      	<tr>
						<th>CatID</th>
						<th>Title</th>
						<th>Description</th>
			      	</tr>
			    </thead>
			    <form action="" method="POST">
			    	<tbody>
			    		<?php 

			    		$servername = "localhost";
						$database = "business_service";
						$username = "root";
						$password = "";

						$conn = mysqli_connect($servername, $username, $password, $database);

						if (!$conn) {
					    	die("Kết nối thất bại: " . mysqli_connect_error());
						}else{
							if(isset($_POST['add_category'])){
								$category_name = $_POST['category_name'];
								$category_title = $_POST['category_title'];
								$category_description = $_POST['category_description'];
								if($category_name == null || $category_title == null || $category_description == null) {
									echo "Bạn chưa điền đủ thông tin";
								}
								else {
									$sql = "INSERT INTO categories
							        VALUES ('$category_name', '$category_title','$category_description')";

							        if (mysqli_query($conn, $sql)) {
									    echo "Thêm thành công";
									} else {
									    echo "Lỗi: " . $sql . "<br>" . mysqli_error($conn);
									}
								}
								
								//mysqli_close($conn);
							}
						}


			    		$sql = "SELECT * FROM categories";

			    		$result = mysqli_query($conn, $sql);
			    		while($row = mysqli_fetch_assoc($result)) {
			    		?>
				    	<tr>
	        				<td><?php echo $row['CategoryID'] ?></td>
	        				<td><?php echo $row['Title'] ?></td>
	        				<td><?php echo $row['Description'] ?></td>
	      				</tr>
	      				<?php } 
	      					mysqli_close($conn);
	      				?>
	      				<tr>
							<td><input type="text" name="category_name"></td>
							<td><input type="text" name="category_title"></td>
							<td><input type="text" name="category_description"></td>
						</tr>
						<tr>
							<td colspan="3"><input type="submit" name="add_category" value="Add Category"></td>
						</tr>
				    </tbody>
			    </form>
			    
			</table>
		</div>
		
	</div>
</body>
</html>