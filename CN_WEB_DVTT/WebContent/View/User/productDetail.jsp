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
.radio-toolbar input[type="radio"] {
	display: none;
}
.radio-toolbar label {
	display: inline-block;
	background-color: #ddd;
	padding: 0px 15px;
	font-family: Arial;
	font-size: 16px;
	border: 2px solid #444;
	border-radius: 4px;
}
.radio-toolbar input[type="radio"]:checked+label {
	background-color: #bfb;
	border-color: #4c4;
}
.radio-toolbar label:hover {
	background-color: #dfd;
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
										<img src="././template/user/img/${product.avatar }" alt="" class="img-fluid">
									</div>
									<div class="item">
										<img src="././template/user/img/${product.avatar }" alt="" class="img-fluid">
									</div>
									<div class="item">
										<img src="././template/user/img/${product.avatar }" alt="" class="img-fluid">
									</div>
								</div>

							</div>
							<div class="col-md-6">
								<div class="box">
									<h1 class="text-center">${product.name }</h1>
									<p class="goToDescription">
										<a href="#details" class="scroll-to">Xem mô tả sản phẩm</a>
									</p>
									<p class="price" style="margin-top: 0px;">Giá :
										${product.price }</p>
									<form action="AddToCart">

										<div class="radio-toolbar" style="margin-bottom: 20px;">
											<span style="font-size: 18px;"> Chọn size </span> <input
												type="radio" id="radioS" name="size" value="S" checked>
											<label for="radioS">S</label> <input type="radio" id="radioM"
												name="size" value="M"> <label for="radioM">M</label>

											<input type="radio" id="radioL" name="size" value="L">
											<label for="radioL">L</label> <input type="radio"
												id="radioXL" name="size" value="XL"> <label
												for="radioXL">XL</label>
										</div>

										<div>
											<span style="font-size: 18px;">Chọn số lượng </span> <input
												type="number" name="quantity" min="1" max="5" value="1"
												style="border-radius: 4px; margin-bottom: 20px;">
										</div>

										<p class="text-center buttons">
											<button type="submit" name="product_id" value="${product.id}"
												class="btn btn-primary">
												<i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
											</button>
										</p>
									</form>
								</div>
								<div data-slider-id="1" class="owl-thumbs">
									<button class="owl-thumb-item">
										<img src="././template/user/img/detailsquare.jpg" alt="" class="img-fluid">
									</button>
									<button class="owl-thumb-item">
										<img src="././template/user/img/detailsquare2.jpg" alt="" class="img-fluid">
									</button>
									<button class="owl-thumb-item">
										<img src="././template/user/img/detailsquare3.jpg" alt="" class="img-fluid">
									</button>
								</div>
							</div>
						</div>
						<h3>Chi tiết sản phẩm</h3>
						<div id="details" class="box">
							<p>${product.description }</p>

						</div>
						<h3>Nhận xét khách hàng</h3>
						<div id="details123" class="box">
							<div class="row">
								<div class="col-md-3 text-center">
									<p>Đánh giá trung bình</p>
									<h1>${avgStar }</h1>
									<p>(${listCommentOfProduct.size() } nhận xét)</p>
								</div>
								<div class="col-md-6 ">
									<div class="row">
										<div class="col-md-2">
											<span class="5star">5 sao</span>
										</div>
										<div class="col-md-10">
											<div class="progress">
												<div class="progress-bar progress-bar-success"
													role="progressbar" aria-valuenow="40" aria-valuemin="0"
													aria-valuemax="100" style="width: ${fiveStar }">${fiveStar }</div>
											</div>
										</div>
									</div>


									<div class="row">
										<div class="col-md-2">
											<span class="5star">4 sao</span>
										</div>
										<div class="col-md-10">
											<div class="progress">
												<div class="progress-bar progress-bar-success"
													role="progressbar" aria-valuenow="40" aria-valuemin="0"
													aria-valuemax="100" style="width: ${fourStar }">${fourStar }</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-2">
											<span class="5star">3 sao</span>
										</div>
										<div class="col-md-10">
											<div class="progress">
												<div class="progress-bar progress-bar-success"
													role="progressbar" aria-valuenow="40" aria-valuemin="0"
													aria-valuemax="100" style="width: ${threeStar }">${threeStar }</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-2">
											<span class="5star">2 sao</span>
										</div>
										<div class="col-md-10">
											<div class="progress">
												<div class="progress-bar progress-bar-success"
													role="progressbar" aria-valuenow="40" aria-valuemin="0"
													aria-valuemax="100" style="width: ${twoStar }">${twoStar }</div>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-2">
											<span class="5star">1 sao</span>
										</div>
										<div class="col-md-10">
											<div class="progress">
												<div class="progress-bar progress-bar-success"
													role="progressbar" aria-valuenow="40" aria-valuemin="0"
													aria-valuemax="100" style="width: ${oneStar }">${oneStar }</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-3 text-center">
									<p>Viết nhận xét của bạn</p>
									<c:choose>
										<c:when test="${user ne null }">
											<button type="button" class="btn btn-info"
												data-toggle="collapse" data-target="#comment">Viết
												nhận xét</button>
										</c:when>
										<c:otherwise>
											<button class="btn btn-info"
												onclick='alert("Bạn phải đăg nhập tài khoản!")'>Viết
												nhận xét</button>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
							<p id="demo" style="color: red;"></p>
							<div id="comment" class="collapse">
								<form action="CommentWithoutBuy" method="post">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="stars">1.Đánh giá sản phẩm</label>
												<div class="stars" id="starszzz" class="form-control">
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
												<textarea rows="5" cols="" id="contentzz" name="content"
													class="form-control"></textarea>

											</div>
										</div>
									</div>
									<!-- /.row-->

									<div class="row">
										<div class="col-md-12 text-center">
											<button type="button" class="btn btn-primary"
												name="productId" value="${product.id }" id="postComment" onclick="myFunction()">
												<i class="fa fa-save"></i> Gửi nhận xét
											</button>
										</div>
									</div>
								</form>
								
								
								<script >
								function myFunction(){
									var prdID = $("#postComment").val();
									var countStar = $("input[name='star']:checked").val();
									var title = $("#title").val();
									var content = $("#contentzz").val();
									
									console.log(prdID);
									console.log(countStar);
									console.log(title);
									console.log(content);
									
									$.get("Ajax/listComment?prdID="+prdID+"&countStar="+countStar+"&title="+title+"&content="+content, function(data){
										$("#details123").html(data);
									});
								}
								</script>
								
								
							</div>
							<hr>

							<div id="DivListComment">
							<c:forEach items="${listCommentOfProduct }" var="commentByUser">
								<div class="row">
									<div class="col-md-3 text-center">
										<p>
											<img src="././template/user/img/${commentByUser.getUserComment().avatar }"
												alt="ảnh đại diện" style="width: 80px; height: 80px;"
												class="rounded-circle img-fluid">
										</p>
										<p>
											<strong>${commentByUser.getUserComment().name }</strong>
										</p>
										<p>${commentByUser.update_at }</p>
									</div>
									<div class="col-md-9">
										<p>số sao : ${commentByUser.star }</p>
										<p>Tiêu đề : ${commentByUser.title }</p>
										<p>Nội dung nhận xét: ${commentByUser.content }</p>
									</div>
								</div>
								<hr>
							</c:forEach>
							</div>
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
												<a href="detail.html"><img src="././template/user/img/product2.jpg" alt=""
													class="img-fluid"></a>
											</div>
											<div class="back">
												<a href="detail.html"><img src="././template/user/img/product2_2.jpg"
													alt="" class="img-fluid"></a>
											</div>
										</div>
									</div>
									<a href="detail.html" class="invisible"><img
										src="././template/user/img/product2.jpg" alt="" class="img-fluid"></a>
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
												<a href="detail.html"><img src="././template/user/img/product2.jpg" alt=""
													class="img-fluid"></a>
											</div>
											<div class="back">
												<a href="detail.html"><img src="././template/user/img/product2_2.jpg"
													alt="" class="img-fluid"></a>
											</div>
										</div>
									</div>
									<a href="detail.html" class="invisible"><img
										src="././template/user/img/product2.jpg" alt="" class="img-fluid"></a>
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
												<a href="detail.html"><img src="././template/user/img/product1.jpg" alt=""
													class="img-fluid"></a>
											</div>
											<div class="back">
												<a href="detail.html"><img src="././template/user/img/product1_2.jpg"
													alt="" class="img-fluid"></a>
											</div>
										</div>
									</div>
									<a href="detail.html" class="invisible"><img
										src="././template/user/img/product1.jpg" alt="" class="img-fluid"></a>
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
												<a href="detail.html"><img src="././template/user/img/product3.jpg" alt=""
													class="img-fluid"></a>
											</div>
											<div class="back">
												<a href="detail.html"><img src="././template/user/img/product3_2.jpg"
													alt="" class="img-fluid"></a>
											</div>
										</div>
									</div>
									<a href="detail.html" class="invisible"><img
										src="././template/user/img/product3.jpg" alt="" class="img-fluid"></a>
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