<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<div class="col-lg-4">
		<!--
              *** CUSTOMER MENU ***
              _________________________________________________________
              -->
		<div class="card sidebar-menu">
			<div class="card-header">
				<h3 class="h4 card-title"><center>Danh mục tài khoản</center></h3>
			</div>
			<div class="card-body">
				<ul class="nav nav-pills flex-column">
					 <p class="text-center"><img src="img/${user.avatar }" alt="${user.avatar }" style="width: 150px; height: 150px;" class="rounded-circle img-fluid"></p>
					<a href="CustomerAccount?action=viewInfo" class="nav-link"><i
						class="fa fa-user"></i> Thông tin tài khoản</a>
					<a href="OrderHistory?user_id=${user.id }" class="nav-link" ><i 
						class="fa fa-list"></i> Danh sách đơn hàng</a>
					<a href="CommentProductBought" class="nav-link"><i
						class="fa fa-comment"></i> Nhận xét sản phẩm đã mua</a>
					<a href="Login?logout=yes" class="nav-link"><i
						class="fa fa-sign-out"></i> Đăng xuất</a>
				</ul>
			</div>
		</div>
		<!-- /.col-lg-3-->
		<!-- *** CUSTOMER MENU END ***-->
	</div>
</body>
</html>