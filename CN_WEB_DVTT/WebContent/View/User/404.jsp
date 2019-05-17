<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<!-- Bootstrap CSS-->
<link rel="stylesheet" href="././template/user/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="././template/user/vendor/font-awesome/css/font-awesome.min.css">
<!-- Google fonts - Roboto -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700">
<!-- owl carousel-->
<link rel="stylesheet" type="text/css"
	href="././template/user/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="././template/user/vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet" type="text/css" href="././template/user/css/style.default.css" 
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="././template/user/css/custom.css">
<!-- Favicon-->
<link rel="shortcut icon" href="././template/user/favicon.png">
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<title>404 Page</title>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- breadcrumb-->
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li aria-current="page" class="breadcrumb-item active">Page
									not found</li>
							</ol>
						</nav>
						<div id="error-page" class="row">
							<div class="col-md-6 mx-auto">
								<div class="box text-center py-5">
									<p class="text-center">
										<img src="img/logo.png" alt="Obaju template">
									</p>
									<h3>We are sorry - this page is not here anymore</h3>
									<h4 class="text-muted">Error 404 - Page not found</h4>
									<p class="text-center">
										To continue please use the <strong>Search form</strong> or <strong>Menu</strong>
										above.
									</p>
									<p class="buttons">
										<a href="index.html" class="btn btn-primary"><i
											class="fa fa-home"></i> Go to Homepage</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>