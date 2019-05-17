<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">

					<jsp:include page="customer-menu.jsp"></jsp:include>

					<div id="customer-order" class="col-lg-8">
						<div class="box">
							<h1>Đơn hàng #${orderHistory.id }</h1>
							<p class="lead">
								đơn hàng #${orderHistory.id } đã đặt vào ngày <strong>${orderHistory.create_at }</strong>
								và hiện tại <strong>${orderHistory.status }</strong>.
							</p>
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
														src="img/${item.product.avatar }" alt="White Blouse Armani"></a></td>
												<td><a href="productController?product_id=${item.product.id}"">${item.product.name }</a></td>
												<td><input type="number" value="${item.quantity }"
													class="form-control"></td>
												<td>${item.price }</td>
												<td>${item.quantity * item.price }</td>
											</tr>
										</c:forEach>

									</tbody>
									<tfoot>
										<tr>
											<th colspan="5" class="text-right">Tổng giá các mặt hàng</th>
											<th>${orderHistory.total() }</th>
										</tr>
										<tr>
											<th colspan="5" class="text-right">Vận chuyển và xử lý</th>
											<th>30000</th>
										</tr>
										<tr>
											<th colspan="5" class="text-right">Tổng hóa đơn</th>
											<th>${orderHistory.pay }</th>
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