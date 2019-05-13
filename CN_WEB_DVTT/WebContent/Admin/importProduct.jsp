<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin | Quản lý sản phẩm</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body class="skin-blue">
	<div class="wrapper">
		<%@ include file="Header.jsp"%>
		<%@ include file="Sidebar.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Kho sản phẩm <small style="color: red">${mes }</small>
				</h1>

				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Quản lý sản phẩm</li>
					<li class="active">Kho sản phẩm</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-10">


						<div class="box">
							<div class="box-header">
								<a href="AdminProductController?action=insert">
									<button type="button" class="btn btn-default btn-sm">
										<span class="glyphicon glyphicon-plus"></span> Thêm sản phẩm
									</button>
								</a>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Màu sắc</th>
											<th>Kích cỡ</th>
											<th>Tồn kho</th>
											<th><center>Action</center></th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${listColor_Size}" var="pr">
											<tr>
												<td><c:out value="${pr.color }" /></td>
												<td><c:out value="${pr.size }" /></td>
												<td><c:out value="${pr.quantity }" /></td>
												<td><center>
												 <div class="dropdown">
												 <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">nhập kho</button>
													<form action="AdminImportProductController" method="post"
														class="form-inline dropdown-menu">
														<div class="form-group">
															<input type="text" name="quantity" class="form-control">
														</div>
														<input type="hidden" value="${pr.size_id}" name="size_id">
		                    							<button type="submit" class="btn btn-success" name="prId" value="${pr.product_id }">nhập kho</button>
													</form>
													</div>
												</center>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<%@ include file="Footer.jsp"%>

	</div>
	<!-- jQuery 2.1.3 -->
	<script src="././template/admin/plugins/jQuery/jQuery-2.1.3.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="././template/admin/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- DATA TABES SCRIPT -->
	<script
		src="././template/admin/plugins/datatables/jquery.dataTables.js"
		type="text/javascript"></script>
	<script
		src="././template/admin/plugins/datatables/dataTables.bootstrap.js"
		type="text/javascript"></script>
	<!-- SlimScroll -->
	<script
		src="././template/admin/plugins/slimScroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<!-- FastClick -->
	<script src='././template/admin/plugins/fastclick/fastclick.min.js'></script>
	<!-- AdminLTE App -->
	<script src="././template/admin/dist/js/app.min.js"
		type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="././template/admin/dist/js/demo.js" type="text/javascript"></script>
	<!-- page script -->
	<script type="text/javascript">
		$(function() {
			$("#example1").dataTable();
			$('#example2').dataTable({
				"bPaginate" : true,
				"bLengthChange" : false,
				"bFilter" : false,
				"bSort" : true,
				"bInfo" : true,
				"bAutoWidth" : false
			});
		});
	</script>
</body>
</html>