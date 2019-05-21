<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>


	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">

					<jsp:include page="customer-menu.jsp"></jsp:include>

					<div class="col-lg-8">
						<div class="box">
							<h1>My account</h1>
							<p class="lead">Thay đổi chi tiết cá nhân hoặc mật khẩu của
								bạn ở đây.</p>

							<h3>Thay đổi mật khẩu</h3>
							<form action="CustomerAccount" method="post" >
								<p style="color: green">${message }</p>
								<p style="color: red">${checkOldPassord_err }</p>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="password_old">Mật khẩu cũ</label> <input
												id="password_old" name="password_old" type="password"
												class="form-control">
										</div>
									</div>
								</div>
								<p style="color: red">${checkConfrimPassword }</p>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="password_new">Mật khẩu mới</label> <input
												id="password_new" name="password_new" type="password"
												class="form-control">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="confrimPassword_new">Nhập lại mật khẩu
												mới</label> <input id="confrimPassword_new"
												name="confrimPassword_new" type="password"
												class="form-control">
										</div>
									</div>
								</div>
								<!-- /.row-->
								<div class="col-md-12 text-center">
									<button type="submit" class="btn btn-primary"
										name="change_account" value="change_password">
										<i class="fa fa-save"></i> Lưu mật khẩu
									</button>
								</div>
							</form>
							<h3 class="mt-5">Thông tin cá nhân</h3>
							<p style="color: green">${messageInfo }</p>
							<p style="color: red">${checkUpdateOtherInfo_err }</p>
							<form action="CustomerAccount" method="post" >
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="name">Tên</label> <input id="name" name="name"
												type="text" value="${user.name }" class="form-control">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="avatar">Email</label> <input id="email"
												type="text" name="avatar" value="${user.email }"
												class="form-control" readonly="readonly">
										</div>
									</div>
								</div>
								<!-- /.row-->
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="phone">Số điện thoại</label> <input id="phone"
												type="text" name="phone" value="${user.phone }"
												class="form-control">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="address">Địa chỉ</label> <input id="address"
												name="address" type="text" value="${user.address }"
												class="form-control">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="address">Avatar</label> <input type="file"
												class="form-control" multiple ="multiple">
										</div>
									</div>
								</div>
								<!-- /.row-->
								<div class="row">
									<div class="col-md-12 text-center">
										<button type="submit" class="btn btn-primary"
											name="change_account" value="change_ortherInfo">
											<i class="fa fa-save"></i> Lưu thay đổi
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>