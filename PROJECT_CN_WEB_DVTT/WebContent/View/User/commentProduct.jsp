<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

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

	<div class="col-lg-12 order-1 order-lg-2">
		<div id="productMain" class="row box">
			<div class="col-md-6">
				<form action="CommentController" method="post">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="stars">1.Đánh giá sản phẩm</label>
								<div class="stars" id="stars" class="form-control">
									<input class="star star-5" id="star-5" type="radio" name="star" value="5" />
									<label class="star star-5" for="star-5"></label> 
									<input
										class="star star-4" id="star-4" type="radio" name="star" value="4" /> 
									<label
										class="star star-4" for="star-4"></label>
									<input
										class="star star-3" id="star-3" type="radio" name="star" value="3" /> 
									<label
										class="star star-3" for="star-3"></label> 
									<input
										class="star star-2" id="star-2" type="radio" name="star"  value="2"/> 
									<label
										class="star star-2" for="star-2"></label> 
									<input
										class="star star-1" id="star-1" type="radio" name="star" value="1" /> 
									<label
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
							<button type="submit" class="btn btn-primary"">
								<i class="fa fa-save"></i> Gửi nhận xét
							</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-6">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-4">
							<a href=""><img alt="img" src="././template/user/img/${product.avatar }"
								style="width: 100%; height: 100%"> </a>
						</div>
						<div class="col-md-8">
							<h1 class="text-center">${product.name }</h1>
							<p class="goToDescription">
								<a href="#details" class="scroll-to">Xem mô tả sản phẩm</a>
							</p>
							<p class="price">${product.price }</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>