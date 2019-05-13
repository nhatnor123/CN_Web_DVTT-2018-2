<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin | Quản lý sản phẩm</title>

</head>
<body class="skin-blue">
	<div class="wrapper">
		<%@ include file="common/Header.jsp"%>
		<%@ include file="common/Sidebar.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Quản lý sản phẩm <small style = "color:red">${mes }</small></h1>
				
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
											<th>ID</th>
											<th>Tên sản phẩm</th>
											<th>Giá</th>
											<th>Tồn kho</th>
											<th>Ngày tạo</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach items="${list}" var="pr">
											<tr>
												<td><c:out value="${pr.id }" /></td>
												<td><c:out value="${pr.name }" /></td>
												<td><c:out value="${pr.price }" /></td>
												<td><c:out value="${pr.quantity }" /></td>
												<td><c:out value="${pr.created_at}" /></td>
												<td><a
													href="AdminProductController?action=edit&prId=<c:out value="${pr.id}"/>">
														<button type="button" class="btn btn-default btn-sm">
															<span class="glyphicon glyphicon-edit"></span> Edit
														</button>
												</a>
												 <a
													href="AdminProductController?action=remove&prId=<c:out value="${pr.id}"/>">
														<button type="button" class="btn btn-default btn-sm">
															<span class="glyphicon glyphicon-remove"></span> Remove
														</button>
												</a></td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<th>ID</th>
											<th>Tên sản phẩm</th>
											<th>Giá</th>
											<th>Màu</th>
											<th>Size</th>
											<th>Action</th>
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
		<%@ include file="common/Footer.jsp"%>

	</div>
	<!-- jQuery 2.1.3 -->
	<script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- DATA TABES SCRIPT -->
	<script
		src="plugins/datatables/jquery.dataTables.js"
		type="text/javascript"></script>
	<script
		src="plugins/datatables/dataTables.bootstrap.js"
		type="text/javascript"></script>
	<!-- SlimScroll -->
	<script
		src="plugins/slimScroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<!-- FastClick -->
	<script src='plugins/fastclick/fastclick.min.js'></script>
	<!-- AdminLTE App -->
	<script src="dist/js/app.min.js"
		type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="dist/js/demo.js" type="text/javascript"></script>
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