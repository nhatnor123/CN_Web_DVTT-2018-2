<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin | Quản lý đơn hàng</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>

</head>
<body class="skin-blue">
	<div class="wrapper">
		<jsp:include page="Header.jsp"></jsp:include>
		<jsp:include page="Sidebar.jsp"></jsp:include>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Quản lý đơn hàng</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Quản lý đơn hàng</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
					

						<div class="box">
							<div class="box-header">
							
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Mã đơn hàng</th>
											<th>Doanh thu</th>
											<th>Trạng thái</th>
											<th>Thời gian</th>
											<th>Hành động</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${list}" var="order">
											<tr>
												<td><c:out value="${order.id }" /></td>
												<td><c:out value="${order.pay }" /></td>
												<td><c:out value="${order.status }" /></td>
												<td><c:out value="${order.create_at }" /></td>
												<td><a
													href="AdminOrderController?action=view&orderId=<c:out value="${order.id}"/>">
														<button type="button" class="btn btn-default btn-sm">
															<span class="glyphicon glyphicon-edit"></span> Chi tiết
														</button>
												</a>
												
												 <a
													href="AdminOrderController?action=remove&orderId=<c:out value="${order.id}"/>">
														<button type="button" class="btn btn-default btn-sm">
															<span class="glyphicon glyphicon-remove"></span> Remove
														</button>
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<th>Mã đơn hàng</th>
											<th>Doanh thu</th>
											<th>Trạng thái</th>
											<th>Thời gian</th>
											<th>Hành động</th>
										</tr>
									</tfoot>
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
      $(function () {
        $("#example1").dataTable();
        $('#example2').dataTable({
          "bPaginate": true,
          "bLengthChange": false,
          "bFilter": false,
          "bSort": true,
          "bInfo": true,
          "bAutoWidth": false
        });
      });
    </script>
</body>
</html>