<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin-Quản lý sản phẩm-Thêm sản phẩm</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>

<script>
	$(document).ready(function() {
		$("#add1").click(function() {
			$("#color").clone().appendTo("#div1");
		});
		$("#add2").click(function() {
			$("#size").clone().appendTo("#div2");
		});
	});
</script>
</head>
<body class="skin-blue">
	<div class="wrapper">
		<%@ include file="Header.jsp"%>
		<%@ include file="Sidebar.jsp"%>

		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Quản lý sản phẩm <small>Thêm sản phẩm</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Product</a></li>
					<li class="active">Add</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<!-- left column -->
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<!-- general form elements -->
						<div class="box box-primary">
							<div class="box-header">
								<h3 class="box-title">Thêm sản phẩm</h3>
							</div>
							<!-- /.box-header -->
							<!-- form start -->
							<form role="form" action="AdminProductController" method="POST" enctype="multipart/form-data">
								<div class="box-body">
									<div class="form-group">
										<label for="exampleInputEmail1">ID</label> <input type="email"
											class="form-control" id="" readonly="readonly" name="id"
											value="${product.id}">
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">Tên sản phẩm</label> <input
											type="text" class="form-control" id="" name="name"
											value="${product.name }">
									</div>
									<div class="form-group">
										<label for="exampleInputEmail1">Giá</label> <input type="text"
											class="form-control" id="" name="price"
											value="${product.price }">
									</div>
									<!-- 
									<div class="form-group">
										<label>Màu sắc</label>
										 <select class="form-control" name="color">
											<option value="Đỏ" >Đỏ</option>
											<option value="Trắng">trắng</option>
											<option value="Vàng">vàng</option>
											<option value="xanh">xanh</option>
										</select>
									</div>
									
									<div class="form-group">
										<label>Size</label>
										 <select class="form-control" name="size">
											<option value="S" >S</option>
											<option value="M">M</option>
											<option value="L">L</option>
											<option value="XL">XL</option>
										</select>
									</div>
									-->

									<div class="form-group">
										<label>Thông tin chi tiết </label>
										<textarea class="form-control" rows="4"
											 name="description">${product.description }</textarea>
									</div>
									<!--  
									<div class="form-group">
											<label for="anh1">Ảnh cũ 1: </label>
											<div class="row">
											<div class="col-md-3 col-sm-3 col-xs-12">
												<img alt="Image" src="img/${product.avatar }"
												style="width: 100px; height: 100px;">
											</div>
											<div class="col-md-3 col-sm-3 col-xs-12">
												<img alt="Image" src="img/${product.avatar }"
												style="width: 100px; height: 100px;">
											</div>
											<div class="col-md-3 col-sm-3 col-xs-12">
												<img alt="Image" src="img/${product.avatar }"
												style="width: 100px; height: 100px;">
											</div>
											
											<div class="col-md-3 col-sm-3 col-xs-12">
												<img alt="Image" src="img/${product.avatar }"
												style="width: 100px; height: 100px;">
											</div>
											</div>	
									</div>

									<div class="form-group">
										<label for="exampleInputFile">Ảnh</label> 
										<input type="file" name="file" multiple ="multiple" value = "${product.avatar }"/>
								
								</div>
								-->
								<!-- /.box-body -->

								<div class="box-footer">
									<button type="submit" class="btn btn-primary">Save</button>
								</div>
							</form>
						</div>
						<!-- /.box -->

						<!-- Form Element sizes -->

					</div>
					<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<%@ include file="Footer.jsp"%>

	</div>

	<script>
		function show() {
			var list = document.getElementsByName('colors[]');
			var list1 = document.getElementsByName('sizes[]');
			var demo = document.getElementById('demo');
			var str = " ";
			for (var i = 0; i < list.length; i++) {
				for (var j = 0; j < list1.length; j++) {

					str += ("<tr><td>" + list[i].value + "</td><td>"
							+ list1[j].value + "</td><td><input name="+"quantity[]></td></tr>");
				}
			}

			demo.innerHTML = str;
		};
	</script>
	<script src="././template/admin/plugins/jQuery/jQuery-2.1.3.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="././template/admin/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- FastClick -->
	<script src='././template/admin/plugins/fastclick/fastclick.min.js'></script>
	<!-- AdminLTE App -->
	<script src="././template/admin/dist/js/app.min.js"
		type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="././template/admin/dist/js/demo.js" type="text/javascript"></script>
</body>
</html>