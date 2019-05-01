<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Giỏ hàng</title>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">

					<div id="basket" class="col-lg-9">
						<div class="box">

							<h1>Giỏ hàng của bạn</h1>
							<p class="text-muted">Bạn hiện có
								${order.countProductInItem() } sản phẩm trong giỏ hàng</p>
							<p style="color: red">${checkout_err }</p>
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th colspan="2">Sản phẩm</th>
											<th>Số lượng</th>
											<th>Đơn giá</th>
											<th>Tổng</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${order.items}" var="item">
											<tr>
												<td><a href="/CN_WEB_DVTT/User/ProductController?product_id=${item.product.id}"><img src="img/${item.product.avatar}"
														alt="White Blouse Armani"></a></td>
												<td><a href="/CN_WEB_DVTT/User/ProductController?product_id=${item.product.id}"">${item.product.name }</a></td>
												<td><input type="number" value="${item.quantity }"
													class="form-control"></td>
												<td>${item.price } đ</td>
												<td>${item.quantity*item.price } đ</td>
												<td><a href="#"><i class="fa fa-trash-o"></i></a></td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<th colspan="4">Tổng các mặt hàng</th>
											<th colspan="3">${order.total()} đ</th>
										</tr>
									</tfoot>
								</table>
							</div>
							<hr>
							<form action="/CN_WEB_DVTT/User/Checkout" method="post">
							
								<div class="content py-3">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="address">Địa chỉ giao hàng</label> <input
													id="address" type="text" name="address" class="form-control">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="phone">số điện thoại liên lạc</label> <input
													id="phone" name="phone" type="text" class="form-control">
											</div>
										</div>
									</div>
								</div>
								<!-- /.table-responsive-->
								<div
									class="box-footer d-flex justify-content-between flex-column flex-lg-row">
									<div class="left">
										<a href="index.jsp" class="btn btn-outline-secondary"><i
											class="fa fa-chevron-left"></i> Tiếp tục mua sắm</a>
									</div>
									<div class="right">

										<button type="submit" class="btn btn-primary">
											Đặt hàng <i class="fa fa-chevron-right"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
						<!-- /.col-lg-9-->
					</div>
					<div class="col-lg-3">
						<div id="order-summary" class="card">
							<div class="card-header">
								<h3 class="mt-4 mb-4">Tổng giá trị đơn hàng</h3>
							</div>
							<div class="card-body">
								<p class="text-muted">Giá trị đơn hàng của bạn sẽ bao gồm tổng giá trị các mặt hàng trong đơn 
								hàng cộng với phí vận chuyển và xử lý</p>
								<div class="table-responsive">
									<table class="table">
										<tbody>
											<tr>
												<td>Tổng các mục</td>
												<th>${order.total()} đ</th>
											</tr>
											<tr>
												<td>Vận chuyển</td>
												<th>30000 đ</th>
											</tr>
											<tr class="total">
												<td>Tổng</td>
												<th>${order.pay} đ</th>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- /.col-lg-3-->
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="row same-height-row">
							<div class="col-lg-3 col-md-6">
								<div class="box same-height">
									<h3>Bạn có thể sẽ thích những sản phẩm này</h3>
								</div>
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

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>