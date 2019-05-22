<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chi tiết đơn hàng</title>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">

					<jsp:include page="customer-menu.jsp"></jsp:include>

					<div id="customer-order" class="col-lg-8">
						<div class="box" style="min-height: 473px;">
							<h1>Đơn hàng #${orderHistory.id }</h1>
							<p class="lead">
								đơn hàng #${orderHistory.id } đã đặt vào ngày <strong>${orderHistory.create_at }</strong>
								và hiện tại <strong>${orderHistory.status }</strong>.
							</p>
							<c:if test="${orderHistory.status eq 'Chờ xử lý'}">
								<p>Bạn có muộn hủy đơn hàng 
								<form action="OrderDetail">
									<input type="hidden" name="order_id" value="${orderHistory.id }">
									<input type="hidden" name="action" value="cancel">
									<input type="submit" class="btn btn-danger" value="Hủy đơn hàng">
								</form> </p>
							</c:if>
							
							<p class="text-muted">
							<hr>
							<div class="row ">
							
								<div class="col-lg-6">
									<h4>Địa chỉ nhận hàng</h4>
									<p>
										${orderHistory.address }
									</p>
								</div>
								
								<div class="col-lg-6">
									<h4>Số điện thoại liên hệ</h4>
									<p>
										${orderHistory.phone }
									</p>
								</div>
							</div>
							<div class="table-responsive mb-4">
								<table class="table">
									<thead>
										<tr>
											<th colspan="3">Sản phẩm</th>
											<th>Số lượng</th>
											<th>Đơn giá</th>
											<th>Tổng</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${items }" var="item">
											<tr>
												<td colspan="2"><a href="productController?product_id=${item.product.id}""><img
														src="././template/user/img/${item.product.avatar }" alt="White Blouse Armani"></a></td>
												<td><a href="productController?product_id=${item.product.id}"">${item.product.name }</a></td>
												<td>${item.quantity }</td>
												<td>${item.getProduct().price } vnđ</td>
												<td>${item.quantity * item.product.price } vnđ</td>
											</tr>
										</c:forEach>

									</tbody>
									<tfoot>
										<tr>
											<th colspan="5" class="text-right">Tổng giá các mặt hàng</th>
											<th>${orderHistory.total() } VNĐ</th>
										</tr>
										<tr>
											<th colspan="5" class="text-right">Vận chuyển và xử lý</th>
											<th>30000 VNĐ</th>
										</tr>
										<tr>
											<th colspan="5" class="text-right">Tổng hóa đơn</th>
											<th>${orderHistory.pay } VNĐ</th>
										</tr>
									</tfoot>
								</table>
							</div>
							<!-- /.table-responsive-->
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>