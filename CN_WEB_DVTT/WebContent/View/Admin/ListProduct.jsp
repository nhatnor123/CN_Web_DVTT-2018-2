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
<link href="././template/admin/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons <-->
</-->
<link
	href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- DATA TABLES -->
<link
	href="././template/admin/plugins/datatables/dataTables.bootstrap.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="././template/admin/dist/css/AdminLTE.min.css"
	rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="././template/admin/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body class="skin-blue">
	<div class="wrapper">
		<%@ include file="common/Header.jsp"%>
		<%@ include file="common/Sidebar.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Quản lý sản phẩm <small style="color: red">${mes }</small>
				</h1>

				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Quản lý sản phẩm</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">


						<div class="box">
							<div class="box-header">
								<a href="productmanage?action=insert">
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
											<th>ID</th>
											<th>Tên sản phẩm</th>
											<th>Số lượng</th>
											<th>Giá</th>
											<th>Ảnh</th>
											<th>Cập nhật ngày</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${list}" var="pr">
											<tr>
												<td><c:out value="${pr.id }" /></td>
												<td><c:out value="${pr.name }" /></td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-default">Chi tiết</button>
														<button type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown">
															<span class="caret"></span> <span class="sr-only">Toggle
																Dropdown</span>
														</button>
														<ul class="dropdown-menu" role="menu">
															<c:forEach items="${pr.sizes }" var="x">
																<li><a
																	href="productmanage?action=editsize&sizeId=<c:out value="${x.id}"/>">${x.size}
																		- Tồn kho: ${x.quantity } </a></li>
															</c:forEach>
														</ul>
													</div></td>
												<td><c:out value="${pr.price }" /> VNĐ</td>
												<td><img alt="" src="template/user/img/${pr.avatar }"
													style="height: 100px; width: 80px"></td>
												<td><c:out value="${pr.updated_at}" /></td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-default">Action</button>
														<button type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown">
															<span class="caret"></span> <span class="sr-only">Toggle
																Dropdown</span>
														</button>
														<ul class="dropdown-menu" role="menu">
															<li><a
																href="productmanage?action=addsize&prId=<c:out value="${pr.id}"/>">Thêm
																	size</a></li>
															<li><a
																href="productmanage?action=edit&prId=<c:out value="${pr.id}"/>">Edit</a></li>
														</ul>
													</div>
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
		<%@ include file="common/Footer.jsp"%>

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