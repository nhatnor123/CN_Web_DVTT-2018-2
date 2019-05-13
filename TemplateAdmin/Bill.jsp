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
							<i class="fa fa-globe"></i> ABC Shop <small class="pull-right">Time:
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
							<strong>ABC Shop</strong><br> Số 1 Đại Cồ Việt<br>
							quận Đống Đa, Hà Nội<br> Phone: (804) 123-5432<br />
							Email: info@almasaeedstudio.com
						</address>
					</div>
					<!-- /.col -->
					<div class="col-sm-4 invoice-col">
						To
						<address>
							<strong>${bill.user.name }</strong><br> ${bill.address }<br>
							Phone: ${bill.phone }<br />
							Email: ${bill.user.email }
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
									<th>Qty</th>
									<th>Product</th>
									<th>Serial #</th>

									<th>Subtotal</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items = "${bill.items }" var = "item">
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