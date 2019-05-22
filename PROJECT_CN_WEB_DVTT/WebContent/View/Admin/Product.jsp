<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin - Sản phẩm</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.2 -->
<link href="././template/admin/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="././template/admin/dist/css/AdminLTE.min.css"
	rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="././template/admin/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
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
		<%@ include file="common/Header.jsp"%>
		<%@ include file="common/Sidebar.jsp"%>

		<!-- Right side column. Contains the navbar and content of the page -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Quản lý sản phẩm <small>Sản phẩm</small>
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
								<h3 class="box-title">Sản phẩm</h3>
							</div>
							<!-- /.box-header -->
							<!-- form start -->
							<form role="form" action="productmanage" method="POST" enctype="multipart/form-data">
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
										<label>Thể loại</label> <select class="form-control" name="category">
										<c:forEach items = "${listCategory}" var="category">
											<option>${category.name }</option>
										</c:forEach>
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
										<c:if test = "${product.avatar != null}">
											<img src = "template/user/img/${product.avatar }" style = "height:200px;width: 160px"/>
										</c:if>
										<input type="file" name="file" multiple ="multiple" />
								
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