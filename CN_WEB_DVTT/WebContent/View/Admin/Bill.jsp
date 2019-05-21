<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin- Đơn hàng</title>
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
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Hóa đơn <small>${bill.id }</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Order</a></li>
					<li class="active">Bill</li>
				</ol>
			</section>



			<!-- Main content -->
			<section class="invoice">
				<!-- title row -->
				<div class="row">
					<div class="col-xs-12">
						<h2 class="page-header">
							<i class="fa fa-globe"></i> Fashion Shop <small class="pull-right">Thời gian đặt hàng:
								${bill.create_at }</small>
						</h2>
					</div>
					<!-- /.col -->
				</div>
				<!-- info row -->
				<div class="row invoice-info">
					<div class="col-sm-4 invoice-col">
						From
						<address>
							<strong>ABC Shop</strong><br> Số 1 Đại Cồ Việt<br> quận
							Hai Bà Trưng, Hà Nội<br> Phone: (804) 123-5432<br /> Email:
							abcshop@gmail.com
						</address>
					</div>
					<!-- /.col -->
					<div class="col-sm-4 invoice-col">
						To
						<address>
							<strong>${bill.user.name }</strong><br> ${bill.address }<br>
							Phone: ${bill.phone }<br /> Email: ${bill.user.email }
						</address>
					</div>
					<!-- /.col -->
					<div class="col-sm-4 invoice-col">
						<b>Tổng tiền: ${bill.pay }</b>

					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->

				<!-- Table row -->
				<div class="row">
					<div class="col-xs-12 table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Số lượng</th>
									<th>Sản phẩm</th>
									<th>ID</th>
									<th>Subtotal</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${bill.items }" var="item">
									<tr>
										<td>${item.quantity }</td>
										<td>${item.product.name }</td>
										<td>${item.product.id }</td>
										<td>${item.price }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
		</div>
		<!-- /.content-wrapper -->
	</div>
	<%@ include file="common/Footer.jsp"%>


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