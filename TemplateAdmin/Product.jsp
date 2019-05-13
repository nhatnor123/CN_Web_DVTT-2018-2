<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin-Quản lý sản phẩm-Thêm sản phẩm</title>

</head>
<body class="skin-blue">
	<div class="wrapper">
		<%@ include file="common/Header.jsp"%>
		<%@ include file="common/Sidebar.jsp"%>

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
									<div class="form-group">
										<label>Thể loại</label> <select class="form-control">
											<option>option 1</option>
											<option>option 2</option>
											<option>option 3</option>
											<option>option 4</option>
											<option>option 5</option>
										</select>
									</div>

									<div class="form-group">
										<label>Thông tin chi tiết </label>
										<textarea class="form-control" rows="3"
											 name="description"
											value="abc new">${product.description }</textarea>
									</div>

									<div class="form-group">
										<label for="exampleInputFile">Ảnh</label> 
										<input type="file" name="file" multiple ="multiple" value = "${product.avatar }"/>
								
								</div>
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
		<%@ include file="common/Footer.jsp"%>

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
	<script src="./plugins/jQuery/jQuery-2.1.3.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="./bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- FastClick -->
	<script src='./plugins/fastclick/fastclick.min.js'></script>
	<!-- AdminLTE App -->
	<script src="./dist/js/app.min.js"
		type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="./dist/js/demo.js" type="text/javascript"></script>
</body>
</html>