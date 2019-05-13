<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Admin | Quản lý thành viên</title>

</head>
<body class="skin-blue">
	<div class="wrapper">
		<%@ include file="common/Header.jsp"%>
		<%@ include file="common/Sidebar.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Quản lý sản phẩm</h1>
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
								
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<table id="example1" class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>ID</th>
											<th>Tên User</th>
											<th>Email</th>
											<th>Địa chỉ</th>
											<th>Điện thoại</th>
											<th>Quyền</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>

										
											<tr>
												<td>1</td>
												<td>Nguyễn Đình Ngọc</td>
												<td>dinhngocndtk@gmail.com</td>
												<td>Nghĩa Đồng, Tân Kỳ, Nghệ An</td>
												<td>0961989725</td>
												<td>Thành viên</td>
												<td><a
													href="productmanage?action=edit&prId=<c:out value="${pr.id}"/>">
														<button type="button" class="btn btn-default btn-sm">
															<span class="glyphicon glyphicon-edit"></span> Edit
														</button>
												</a> <a
													href="productmanage?action=remove&prId=<c:out value="${pr.id}"/>">
														<button type="button" class="btn btn-default btn-sm">
															<span class="glyphicon glyphicon-remove"></span> Remove
														</button>
												</a></td>
											</tr>
								
									
									</tbody>
									<tfoot>
										<tr>
											<th>ID</th>
											<th>Tên User</th>
											<th>Email</th>
											<th>Địa chỉ</th>
											<th>Điện thoại</th>
											<th>Quyền</th>
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
	<script src="./plugins/jQuery/jQuery-2.1.3.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="./bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<!-- DATA TABES SCRIPT -->
	<script
		src="./plugins/datatables/jquery.dataTables.js"
		type="text/javascript"></script>
	<script
		src="./plugins/datatables/dataTables.bootstrap.js"
		type="text/javascript"></script>
	<!-- SlimScroll -->
	<script
		src="./plugins/slimScroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<!-- FastClick -->
	<script src='./plugins/fastclick/fastclick.min.js'></script>
	<!-- AdminLTE App -->
	<script src="./dist/js/app.min.js"
		type="text/javascript"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="./dist/js/demo.js" type="text/javascript"></script>
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