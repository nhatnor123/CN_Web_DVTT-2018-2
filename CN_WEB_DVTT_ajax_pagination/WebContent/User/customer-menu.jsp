<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<div class="col-lg-3">
		<!--
              *** CUSTOMER MENU ***
              _________________________________________________________
              -->
		<div class="card sidebar-menu">
			<div class="card-header">
				<h3 class="h4 card-title">Danh mục tài khoản</h3>
			</div>
			<div class="card-body">
				<ul class="nav nav-pills flex-column">
					 <p class="text-center"><img src="img/${user.avatar }" alt="${user.avatar }" style="width: 150px; height: 150px;" class="rounded-circle img-fluid"></p>
					<a href="/CN_WEB_DVTT/User/OrderHistory?user_id=${user.id }"
						class="nav-link active"><i class="fa fa-list"></i> Danh sách
						đơn hàng</a>
					<a href="/CN_WEB_DVTT/User/Comment" class="nav-link"><i
						class="fa fa-comment"></i> Nhận xét sản phẩm đã mua</a>
					<a href="customer-account.jsp" class="nav-link"><i
						class="fa fa-user"></i> Thông tin tài khoản</a>
					<a href="/CN_WEB_DVTT/User/Login?logout=yes" class="nav-link"><i
						class="fa fa-sign-out"></i> Đăng xuất</a>
				</ul>
			</div>
		</div>
		<!-- /.col-lg-3-->
		<!-- *** CUSTOMER MENU END ***-->
	</div>
</body>
</html>