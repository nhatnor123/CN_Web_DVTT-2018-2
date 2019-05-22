<%@page import="Model.Category"%>
<%@page import="DAO.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Fashion Shop</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet" href="././template/user/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="././template/user/vendor/font-awesome/css/font-awesome.min.css">
<!-- Google fonts - Roboto -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700">
<!-- owl carousel-->
<link rel="stylesheet"
	href="././template/user/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet"
	href="vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="././template/user/css/style.default.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="././template/user/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="favicon.png">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>

	<%
		CategoryDAO categoryDAO = new CategoryDAO();
	%>

	<header class="header mb-5">
		<!--
      *** TOPBAR ***
      _________________________________________________________
      -->
		<div id="top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 offer mb-3 mb-lg-0">
						<c:if test="${user ne null }">
							<a href="#" class="ml-1"><img src="././template/user/img/${user.avatar }"
								alt="${user.avatar }" style="width: 20px; height: 20px;"
								class="rounded-circle img-fluid"> Chào mừng ${user.name }</a>
						</c:if>
					</div>
					<div class="col-lg-6 text-center text-lg-right">
						<ul class="menu list-inline mb-0">
						
							<c:choose>
								<c:when test="${user ne null }">
									<c:if test="${user.level == 3 }">
										<li class="list-inline-item"><a
										href="usermanage">Đến trang Admin</a></li>
									</c:if>
									<li class="list-inline-item"><a
										href="Login?logout=yes">Đăng xuất</a></li>
									<li class="list-inline-item"><a
										href="CustomerAccount?action=viewInfo">Tài khoản của bạn</a></li>
								</c:when>

								<c:otherwise>
									
									<li class="list-inline-item"><a href="#"
										data-toggle="modal" data-target="#login-modal">Đăng nhập</a></li>
									<li class="list-inline-item"><a href="Register?register=yes">Đăng
											ký</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div>
			<div id="login-modal" tabindex="-1" role="dialog"
				aria-labelledby="Login" aria-hidden="true" class="modal fade">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Khách hàng đăng nhập</h5>
							<button type="button" data-dismiss="modal" aria-label="Close"
								class="close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<form action="Login" method="post">
								<p style="color: red">${email_login__err }</p>
								<div class="form-group">
									<input id="email-modal" type="text" placeholder="email"
										name="email" class="form-control">
								</div>

								<p style="color: red">${password_login_err }</p>
								<div class="form-group">
									<input id="password-modal" type="password"
										placeholder="password" name="password" class="form-control">
								</div>
								<p class="text-center">
									<button class="btn btn-primary">
										<i class="fa fa-sign-in"></i> Đăng nhập
									</button>
								</p>
							</form>
							<p class="text-center text-muted">Bạn chưa đăng ký tài khoản?</p>
							<p class="text-center text-muted">
								<a href="register.jsp"><strong>Đăng ký ngay</strong></a>! It is
								dễ dàng và thực hiện trong 1 phút và cung cấp cho bạn quyền truy
								cập vào hệ thống để đặt mua các sản phẩm
							</p>
						</div>
					</div>
				</div>
			</div>
			<!-- *** TOP BAR END ***-->


		</div>
		<nav class="navbar navbar-expand-lg">
			<div class="container">
				<a href="index" class="navbar-brand home"><span class="sr-only">Fashion
						Shop</span></a>
				<div class="navbar-buttons">
					<button type="button" data-toggle="collapse"
						data-target="#navigation"
						class="btn btn-outline-secondary navbar-toggler">
						<span class="sr-only">Toggle navigation</span><i
							class="fa fa-align-justify"></i>
					</button>
					<button type="button" data-toggle="collapse" data-target="#search"
						class="btn btn-outline-secondary navbar-toggler">
						<span class="sr-only">Toggle search</span><i class="fa fa-search"></i>
					</button>
					<a href="shopping-cart.jsp"
						class="btn btn-outline-secondary navbar-toggler"><i
						class="fa fa-shopping-cart"></i></a>
				</div>
				<div id="navigation" class="collapse navbar-collapse">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item"><a href="index"
							class="nav-link active">Home</a></li>
						<li class="nav-item dropdown menu-large"><a href="#"
							data-toggle="dropdown" data-hover="dropdown" data-delay="200"
							class="dropdown-toggle nav-link">Danh mục<b class="caret"></b></a>
							<ul class="dropdown-menu megamenu">
								<li>
									<div class="row">
										<div class="col-md-6 col-lg-3">
											<h5>Quần áo nam</h5>
											<%
												for (Category c : categoryDAO.getListCategory()) {
											%>
											<ul class="list-unstyled mb-3">
												<%
													if (c.getSex().equals("1")) {
												%>


												<li class="nav-item"><a
													href="CategoryController?category_id=<%=c.getId()%>&sex=<%=c.getSex()%>&page=1&maxInEachPage=5&sortMode=1"
													class="nav-link"><%=c.getName()%></a></li>

												<%
													}
												%>
											</ul>
											<%
												}
											%>
										</div>

										<div class="col-md-6 col-lg-3">
											<h5>Quần áo nữ</h5>
											<%
												for (Category c : categoryDAO.getListCategory()) {
											%>
											<ul class="list-unstyled mb-3">
												<%
													if (c.getSex().equals("0")) {
												%>


												<li class="nav-item"><a
													href="CategoryController?category_id=<%=c.getId()%>&sex=<%=c.getSex()%>&page=1&maxInEachPage=5&sortMode=1"
													class="nav-link"><%=c.getName()%></a></li>

												<%
													}
												%>
											</ul>
											<%
												}
											%>
										</div>

									</div>
								</li>
							</ul></li>
						<li class="nav-item dropdown menu-large"><a href="#"
							data-toggle="dropdown" data-hover="dropdown" data-delay="200"
							class="dropdown-toggle nav-link">Mục khác<b class="caret"></b></a>
							<ul class="dropdown-menu megamenu">
								<li>
									<div class="row">
										<div class="col-md-6 col-lg-3">
											<h5>Clothing</h5>
											<ul class="list-unstyled mb-3">
												<li class="nav-item"><a href="category.html"
													class="nav-link">T-shirts</a></li>
												<li class="nav-item"><a href="category.html"
													class="nav-link">Shirts</a></li>
												<li class="nav-item"><a href="category.html"
													class="nav-link">Pants</a></li>
												<li class="nav-item"><a href="category.html"
													class="nav-link">Accessories</a></li>
											</ul>
										</div>

									</div>
								</li>
							</ul></li>
					</ul>
					<div class="navbar-buttons d-flex justify-content-end">
						<!-- /.nav-collapse-->
						<div id="search-not-mobile" class="navbar-collapse collapse"></div>
						<a data-toggle="collapse" href="#search"
							class="btn navbar-btn btn-primary d-none d-lg-inline-block"><span
							class="sr-only">Toggle search</span><i class="fa fa-search"></i></a>
						<div id="basket-overview"
							class="navbar-collapse collapse d-none d-lg-block">
							<a href="Cart"
								class="btn btn-primary navbar-btn"><i
								class="fa fa-shopping-cart"></i><span>${order.countItem() }
									mặt hàng</span></a>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<div id="search" class="collapse">
			<div class="container">
				<form  role="search" class="ml-auto" >
					<div class="input-group">
						<input type="text" placeholder="Search" class="form-control"
							id="search123" onkeyup="showResult()" >
						<div class="input-group-append">
							<button type="button" class="btn btn-primary"  onclick="searchButton()" >
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
					<div class="list-group" id="divShowResult"></div>

				</form>
			</div>
		</div>
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script>
			function showResult() {
				var str = $("#search123").val();
				if (str.length > 0) {
					$.get("ajax/search?str=" + str, function(data) {
						$("#divShowResult").html(data);
					});
				} else {
					$("#divShowResult").html("");
				}
			}
		</script>
		<script >
			function searchButton(){
				var str = $("#search123").val();
				if (str.length > 0 ){
					//alert("SearchCategoryController?str="+str+"&page=1&maxInEachPage=20&sortMode=1");
					window.location = "SearchCategoryController?str="+str+"&page=1&maxInEachPage=20&sortMode=1";
				}
			}
		</script>
		
	</header>
</body>
</html>