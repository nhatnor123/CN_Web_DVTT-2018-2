
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div id="main-slider" class="owl-carousel owl-theme">
							<div class="item">
								<img src="././template/user/img/main-slider1.jpg" alt=""
									class="img-fluid">
							</div>
							<div class="item">
								<img src="././template/user/img/main-slider2.jpg" alt=""
									class="img-fluid">
							</div>
							<div class="item">
								<img src="././template/user/img/main-slider3.jpg" alt=""
									class="img-fluid">
							</div>
							<div class="item">
								<img src="././template/user/img/main-slider4.jpg" alt=""
									class="img-fluid">
							</div>
						</div>
						<!-- /#main-slider-->
					</div>
				</div>
			</div>

			<div id="hot">
				<div class="box py-4">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<h2 class="mb-0">Sản phẩm hot trong tuần</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h1>Sản phẩm của nam</h1>
						</div>
					</div>

					<div class="product-slider owl-carousel owl-theme">
						<c:forEach items="${listProductMale }" var="product">
							<div class="item">
								<div class="product">
									<div class="flip-container">
										<div class="flipper">
											<div class="front">
												<a href="productController?product_id=${product.id }"><img
													style="height: 227px; width: 170px;"
													src="././template/user/img/${product.avatar }" alt=""
													class="img-fluid"></a>
											</div>
											<div class="back">
												<a href="productController?product_id=${product.id }"><img
													style="height: 227px; width: 170px;"
													src="././template/user/img/${product.avatar }" alt="image"
													alt="" class="img-fluid"></a>
											</div>
										</div>
									</div>
									<a href="productController?product_id=${product.id }"
										class="invisible"><img style="height: 227px; width: 170px;"
										src="././template/user/img/${product.avatar }" alt=""
										class="img-fluid"></a>
									<div class="text">
										<h3>
											<a href="productController?product_id=${product.id }">${product.name }</a>
										</h3>
										<p class="price">
											<del></del>
											${product.price }
										</p>
									</div>
								</div>
								<!-- /.product-->
							</div>
						</c:forEach>
					</div>

					<div class="row">
						<div class="col-md-12">
							<h1>Sản phẩm của nữ</h1>
						</div>
					</div>

					<div class="product-slider owl-carousel owl-theme">
						<c:forEach items="${listProductFeMale }" var="product">
							<div class="item">
								<div class="product">
									<div class="flip-container">
										<div class="flipper">
											<div class="front">
												<a href="productController?product_id=${product.id }"><img
													style="height: 227px; width: 170px;"
													src="././template/user/img/${product.avatar }" alt=""
													class="img-fluid"></a>
											</div>
											<div class="back">
												<a href="productController?product_id=${product.id }"><img
													style="height: 227px; width: 170px;"
													src="././template/user/img/${product.avatar }" alt="image"
													alt="" class="img-fluid"></a>
											</div>
										</div>
									</div>
									<a href="productController?product_id=${product.id }"
										class="invisible"><img style="height: 227px; width: 170px;"
										src="././template/user/img/${product.avatar }" alt=""
										class="img-fluid"></a>
									<div class="text">
										<h3>
											<a href="productController?product_id=${product.id }">${product.name }</a>
										</h3>
										<p class="price">
											<del></del>
											${product.price }
										</p>
									</div>
								</div>
								<!-- /.product-->
							</div>
						</c:forEach>
					</div>

					<!-- /.container-->
				</div>
				<!-- /#hot-->
				<!-- *** HOT END ***-->
			</div>
			<!--
        *** GET INSPIRED ***
        _________________________________________________________
        -->
			<div class="container">
				<div class="col-md-12">
					<div class="box slideshow">
						<h3>Get Inspired</h3>
						<p class="lead">Get the inspiration from our world class
							designers</p>
						<div id="get-inspired" class="owl-carousel owl-theme">
							<c:forEach items="${listBanner }" var="banner">
								<div class="item">
									<a href="#"><img
										src="././template/user/img/${banner.image }"
										alt="Get inspired" class="img-fluid"></a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!-- *** GET INSPIRED END ***-->
			<!--
        *** BLOG HOMEPAGE ***
        _________________________________________________________
        -->
			<div id="hot">
				<div class="box text-center">
					<div class="container">
						<div class="col-md-12">
							<h3 class="text-uppercase">Sản phẩm mới nhập</h3>

						</div>
					</div>
				</div>
				<div class="container">
					<div class="col-md-12">
						<div class="product-slider owl-carousel owl-theme">
							<c:forEach items="${listProductNew }" var="product">
								<div class="item">
									<div class="product">
										<div class="flip-container">
											<div class="flipper">
												<div class="front">
													<a href="productController?product_id=${product.id }"><img style="height: 227px; width: 170px;"
														src="././template/user/img/${product.avatar }" alt="image"
														class="img-fluid"></a>
												</div>
												<div class="back">
													<a href="productController?product_id=${product.id }"><img style="height: 227px; width: 170px;"
														src="././template/user/img/${product.avatar }" alt="image"
														alt="" class="img-fluid"></a>
												</div>
											</div>
										</div>
										<a href="productController?product_id=${product.id }"
											class="invisible"><img style="height: 227px; width: 170px;"
											src="././template/user/img/${product.avatar }" alt=""
											class="img-fluid"></a>
										<div class="text">
											<h3>
												<a href="productController?product_id=${product.id }">${product.name }</a>
											</h3>
											<p class="price">
												<del></del>
												${product.price }
											</p>
										</div>
									</div>
									<!-- /.product-->
								</div>
							</c:forEach>
						</div>
						<!-- /#blog-homepage-->
					</div>
				</div>
				<!-- /.container-->
				<!-- *** BLOG HOMEPAGE END ***-->
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>