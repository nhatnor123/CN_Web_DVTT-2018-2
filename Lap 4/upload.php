<?php
	error_reporting(0);

	if (isset($_POST['uploadClick'])) {
		$numberFile = $_POST['chooseNumberFile'];
		
		if ( ($numberFile> 0)&&(isset($_FILES['fileUpload']))) {
			$file_upload = array();
			if(count($_FILES['fileUpload']['name']) <= $numberFile){
				foreach ($_FILES['fileUpload']['name'] as $key => $value) {
					$file_name = $_FILES['fileUpload']['name'][$key];
					$tmp_name = $_FILES['fileUpload']['tmp_name'][$key];
					$file_size = $_FILES['fileUpload']['size'][$key];
					$file_upload_date = date('d/m/Y');

					$info_upload_file = $file_name ."-". $file_size ."-". $file_upload_date;

					$target_dir = "upload/";
					$target_dir = $target_dir.$file_name;

					move_uploaded_file($tmp_name, $target_dir);
					$file_upload[] = $info_upload_file;
				}
			}else{
				echo "bạn đã chọn số file upload lớn hơn số file đã chọn, mời chọn lại";
			}
			
		}else {
			echo "bạn chưa chọn số file muốn upload";
		}
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Upload file - Lap4</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<form method="POST" action="" enctype="multipart/form-data">
		<p>
		<span>Chọn số file muốn upload</span>
		<select name="chooseNumberFile" id="1">
			<?php
			for ($i=0; $i <=20 ; $i++) { 
			?>
				<option value="<?php print $i; ?>"><?php print $i; ?></option>
			<?php	
			 } 
			?>
		</select></p><br>

		<p><input type="file" name="fileUpload[]" multiple="true"></p><br>
		<p><input type="submit" name="uploadClick" value="upload">
			<a href="View_list_fileUpload.php">Xem danh sách file đã upload</a>
		</p>
		
	</form><hr>
	<div>
		<?php
		if(isset($_POST['uploadClick'])){ 
		?>
		<p>các file đã được upload là:</p>
		<div>
			<?php
				for ($i=0; $i < count($file_upload); $i++) { 
			?>
				<p><?php echo "$i - $file_upload[$i]" ; ?></p>
			<?php
				}
			?>
		</div>
		<?php } ?>
	</div>
</body>
</html>