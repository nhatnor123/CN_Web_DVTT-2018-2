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

					<div id="basket" class="col-lg-12">
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
											<th>Size</th>
											<th>Số lượng</th>
											<th>Đơn giá</th>
											<th>Tổng</th>
											<th></th>
										</tr>
									</thead>
									<tbody id = "bodyTable">
	
										<c:forEach items="${order.items}" var="item">
											<tr>
												<td><a href="productController?product_id=${item.product.id}"><img src="././template/user/img/${item.product.avatar}"
														alt=""></a></td>
												<td><a href="productController?product_id=${item.product.id}"">${item.product.name }</a></td>
												<td>${item.product.size }</td>
												<td><input type="number" value="${item.quantity }"
													class="form-control quantityProduct" name="quantityProduct" id="quantity${item.product.id }" min  = "1"  onchange="change(this.id)" style="width:70px;"></td>
												<td ><span id="price${item.product.id }">${item.product.price }</span> VND</td>
												<td id="total${item.product.id }">${item.quantity*item.product.price } VND</td>
												<td><a href="RemoveItemCart?product_id=${item.product.id }"><i class="fa fa-trash-o"></i></a></td>
											</tr>
											
										</c:forEach>
										<script>
												function change(a){
													var ind=a.substr(8);
													var a=$("#quantity"+ind).val()*$("#price"+ind).text();
													$("#total"+ind).html(a+" VND");
													$.get("Ajax/Checkout?id="+ind+"&quantity="+$("#quantity"+ind).val(), function(data){
														$("#totalPrice").html(data);
														$("#totalCart").html(data);
													});
												}							
										</script>
									</tbody>
									<tfoot>
										<tr>
											<th colspan="5">Tổng các mặt hàng</th>
											<th colspan="3" id = "totalPrice">${order.total()} VND</th>
										</tr>
									</tfoot>
								</table>
						
							</div>
							
							<hr>
							<form action="Checkout" method="post">
							
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
										<a href="index" class="btn btn-outline-secondary"><i
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>