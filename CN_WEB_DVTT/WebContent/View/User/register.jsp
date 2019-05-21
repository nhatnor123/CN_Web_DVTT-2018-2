<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Đăng nhập - Đăng ký</title>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">

					<div class="col-lg-6">
						<div class="box">
							<h1>Đăng ký tài khoản</h1>
							<p class="lead">Hãy điền đầy đủ các thông tin</p>
							<hr>
							<form action="Register" " method="post">
								<p style="color: red" id="name_err">${name_err }</p>
								<div class="form-group">
									<label for="name">Tên</label> <input id="name" name="name"
										type="text" class="form-control">
								</div>

								<p style="color: red">${email_err }</p>
								<div class="form-group">
									<label for="email">Email</label> <input id="email" name="email"
										type="email" class="form-control">
								</div>

								<p style="color: red">${password_err }</p>
								<div class="form-group">
									<label for="password">Mật khẩu</label> <input id="password"
										name="password" type="password" class="form-control">
								</div>

								<p style="color: red">${address_err }</p>
								<div class="form-group">
									<label for="address">Địa chỉ</label> <input id="address"
										name="address" type="text" class="form-control">
								</div>

								<p style="color: red">${phone_err }</p>
								<div class="form-group">
									<label for="phone">Số điện thoại</label> <input id="phone"
										name="phone" type="phone" class="form-control">
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-primary" id="register">
										<i class="fa fa-user-md"></i> Register
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="box">
							<h1>Đăng nhập</h1>
							<p class="lead">Bạn đã có tài khoản?</p>
							<p style="color: red">${login_err }</p>

							<hr>
							<form action="Login" method="post">
								<p style="color: red">${email_login_err }</p>
								<div class="form-group">
									<label for="email">Email</label> <input id="email" name="email"
										type="text" class="form-control">
								</div>

								<p style="color: red">${password_login_err }</p>
								<div class="form-group">
									<label for="password">Password</label> <input id="password"
										name="password" type="password" class="form-control">
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-sign-in"></i> Log in
									</button>
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