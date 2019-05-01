<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chi tiết sản phẩm</title>
<style type="text/css">
div.stars {
	height: 24px;
	margin-left: 15px;
	width: 115px;
	display: inline-block;
}

input.star {
	display: none;
}

label.star {
	float: right;
	padding: 2px;
	font-size: 20px;
	color: #444;
	transition: all .2s;
}

input.star:checked ~ label.star:before {
	content: '\f005';
	color: #FD4;
	transition: all .25s;
}

input.star-5:checked ~ label.star:before {
	color: #FE7;
	text-shadow: 0 0 20px #952;
}

input.star-1:checked ~ label.star:before {
	color: #F62;
}

label.star:hover {
	transform: rotate(-15deg) scale(1.3);
}

label.star:before {
	content: '\f006';
	font-family: FontAwesome;
}
</style>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">

					<jsp:include page="sliderbar_left.jsp"></jsp:include>

					<div class="col-lg-9 order-1 order-lg-2">
						<div id="productMain" class="row">
							<div class="col-md-6">
								<div data-slider-id="1"
									class="owl-carousel shop-detail-carousel">
									<div class="item">
										<img src="img/${product.avatar }" alt="" class="img-fluid">
									</div>
									<div class="item">
										<img src="img/${product.avatar }" alt="" class="img-fluid">
									</div>
									<div class="item">
										<img src="img/${product.avatar }" alt="" class="img-fluid">
									</div>
								</div>

							</div>
							<div class="col-md-6">
								<div class="box">
									<h1 class="text-center">${product.name }</h1>
									<p class="goToDescription">
										<a href="#details" class="scroll-to">Xem mô tả sản phẩm</a>
									</p>
									<p class="price">Giá : ${product.price }</p>
									<form action="">
										<div class="product-configuration">

											<!-- Product Color -->
											<div class="product-color">
												<span>Color</span>

												<div class="color-choose">
													<div>
														<input data-image="red" type="radio" id="red" name="color"
															value="red" checked> <label for="red"><span></span></label>
													</div>
													<div>
														<input data-image="blue" type="radio" id="blue"
															name="color" value="blue"> <label for="blue"><span></span></label>
													</div>
													<div>
														<input data-image="black" type="radio" id="black"
															name="color" value="black"> <label for="black"><span></span></label>
													</div>
												</div>
											</div>

											<!-- Cable Configuration -->
											<div class="cable-config">
												<span>Cable configuration</span>

												<div class="cable-choose">
													<button>Straight</button>
													<button>Coiled</button>
													<button>Long-coiled</button>
												</div>

												<a href="#">How to configurate your headphones</a>
											</div>
										</div>

										<p class="text-center buttons">
											<a
												href="/CN_WEB_DVTT/User/AddToCart?product_id=${product.id}"
												class="btn btn-primary"><i class="fa fa-shopping-cart"></i>
												Thêm vào giỏ hàng</a>
										</p>
									</form>
								</div>
								<div data-slider-id="1" class="owl-thumbs">
									<button class="owl-thumb-item">
										<img src="img/detailsquare.jpg" alt="" class="img-fluid">
									</button>
									<button class="owl-thumb-item">
										<img src="img/detailsquare2.jpg" alt="" class="img-fluid">
									</button>
									<button class="owl-thumb-item">
										<img src="img/detailsquare3.jpg" alt="" class="img-fluid">
									</button>
								</div>
							</div>
						</div>
						<h3>Chi tiết sản phẩm</h3>
						<div id="details" class="box">
							<p>${product.description }</p>

						</div>
						<h3>Nhận xét khách hàng</h3>
						<div id="details" class="box">
							<div class="row">
								<div class="col-md-4 text-center">
									<p>Đánh giá trung bình </p>
									<h1>${avgStar }</h1>
									<p>(${hashMapComment.size() } nhận xét)</p>
								</div>
								<div class="col-md-4 ">
									<p>5 sao : ${fiveStar }</p>
									<p>4 sao : ${fourStar }</p>
									<p>3 sao : ${threeStar }</p>
									<p>2 sao : ${twoStar }</p>
									<p>1 sao : ${oneStar }</p>
								</div>
								<div class="col-md-4 text-center">
									<p>Viết nhận xét của bạn</p>
									<button type="button" class="btn btn-info"
										data-toggle="collapse" data-target="#comment">Việt
										nhận xét</button>
								</div>
							</div>
							<div id="comment" class="collapse">
								<form
									action="/CN_WEB_DVTT/User/CommentWithoutBuy"
									method="post">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="stars">1.Đánh giá sản phẩm</label>
												<div class="stars" id="stars" class="form-control">
													<input class="star star-5" id="star-5" type="radio"
														name="star" value="5" /> <label class="star star-5"
														for="star-5"></label> <input class="star star-4"
														id="star-4" type="radio" name="star" value="4" /> <label
														class="star star-4" for="star-4"></label> <input
														class="star star-3" id="star-3" type="radio" name="star"
														value="3" /> <label class="star star-3" for="star-3"></label>
													<input class="star star-2" id="star-2" type="radio"
														name="star" value="2" /> <label class="star star-2"
														for="star-2"></label> <input class="star star-1"
														id="star-1" type="radio" name="star" value="1" /> <label
														class="star star-1" for="star-1"></label>
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="title">2.Tiêu đề của nhận xét</label> <input
													id="title" name="title" type="text" value=""
													class="form-control">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="content">3.Nội dung nhận xét sản phẩm</label>
												<textarea rows="5" cols="" id="content" name="content"
													class="form-control"></textarea>

											</div>
										</div>
									</div>
									<!-- /.row-->

									<div class="row">
										<div class="col-md-12 text-center">
											<button type="submit" class="btn btn-primary"
												name="productId" value="${product.id }">
												<i class="fa fa-save"></i> Gửi nhận xét
											</button>
										</div>
									</div>
								</form>
							</div>
							<hr>

							<c:forEach items="${hashMapComment }" var="commentByUser">
								<div class="row">
									<div class="col-md-3 text-center">
										<p>
											<img src="img/${commentByUser.getKey().avatar }"
												alt="ảnh đại diện" style="width: 80px; height: 80px;"
												class="rounded-circle img-fluid">
										</p>
										<p>
											<strong>${commentByUser.getKey().name }</strong>
										</p>
										<p>${commentByUser.getValue().update_at }</p>
									</div>
									<div class="col-md-9">
										<p>số sao : ${commentByUser.getValue().star }</p>
										<p>Tiêu đề : ${commentByUser.getValue().title }</p>
										<p>Nội dung nhận xét: ${commentByUser.getValue().content }</p>
									</div>
								</div>
								<hr>
							</c:forEach>
						</div>

						<div class="row same-height-row">
							<div class="col-md-12">
								<h2>Bạn có thể thích những sản phẩm sau</h2>
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="product same-height">
									<div class="flip-container">
										<div class="flipper">
											<div class="front">
												<a href="detail.html"><img src="img/product2.jpg" alt=""
													class="img-fluid"></a>
											</div>
											<div class="back">
												<a href="detail.html"><img src="img/product2_2.jpg"
													alt="" class="img-fluid"></a>
											</div>
										</div>
									</div>
									<a href="detail.html" class="invisible"><img
										src="img/product2.jpg" alt="" class="img-fluid"></a>
									<div class="text">
										<h3>Fur coat</h3>
										<p class="price">$143</p>
									</div>
								</div>
								<!-- /.product-->
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="product same-height">
									<div class="flip-container">
										<div class="flipper">
											<div class="front">
												<a href="detail.html"><img src="img/product2.jpg" alt=""
													class="img-fluid"></a>
											</div>
											<div class="back">
												<a href="detail.html"><img src="img/product2_2.jpg"
													alt="" class="img-fluid"></a>
											</div>
										</div>
									</div>
									<a href="detail.html" class="invisible"><img
										src="img/product2.jpg" alt="" class="img-fluid"></a>
									<div class="text">
										<h3>Fur coat</h3>
										<p class="price">$143</p>
									</div>
								</div>
								<!-- /.product-->
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="product same-height">
									<div class="flip-container">
										<div class="flipper">
											<div class="front">
												<a href="detail.html"><img src="img/product1.jpg" alt=""
													class="img-fluid"></a>
											</div>
											<div class="back">
												<a href="detail.html"><img src="img/product1_2.jpg"
													alt="" class="img-fluid"></a>
											</div>
										</div>
									</div>
									<a href="detail.html" class="invisible"><img
										src="img/product1.jpg" alt="" class="img-fluid"></a>
									<div class="text">
										<h3>Fur coat</h3>
										<p class="price">$143</p>
									</div>
								</div>
								<!-- /.product-->
							</div>
							<div class="col-md-3 col-sm-6">
								<div class="product same-height">
									<div class="flip-container">
										<div class="flipper">
											<div class="front">
												<a href="detail.html"><img src="img/product3.jpg" alt=""
													class="img-fluid"></a>
											</div>
											<div class="back">
												<a href="detail.html"><img src="img/product3_2.jpg"
													alt="" class="img-fluid"></a>
											</div>
										</div>
									</div>
									<a href="detail.html" class="invisible"><img
										src="img/product3.jpg" alt="" class="img-fluid"></a>
									<div class="text">
										<h3>Fur coat</h3>
										<p class="price">$143</p>
									</div>
								</div>
								<!-- /.product-->
							</div>
						</div>
					</div>
					<!-- /.col-md-9-->
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>