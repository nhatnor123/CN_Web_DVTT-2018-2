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

					<div id="customer-orders" class="col-lg-9">
						<div class="box">
							<h1>Đơn hàng của tôi</h1>
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Mã đơn hàng</th>
											<th>Ngày đặt hàng</th>
											<th>Tổng đơn hàng</th>
											<th>Trạng thái</th>
											<th>Tùy chọn</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${listOrder}" var="order">
											<tr>
												<th># ${order.id }</th>
												<td>${order.create_at}</td>
												<td>${order.pay }</td>
												<c:choose>
													<c:when test="${order.status eq 'Chờ xử lý'}">
														<td><span class="badge badge-info">${order.status }</span></td>
													</c:when>

													<c:when test="${param.color eq 'Đã nhận'}">
														<td><span class="badge badge-success">${order.status }</span></td>
													</c:when>
													
													<c:when test="${param.color eq 'Đã hủy'}">
														<td><span class="badge badge-danger">${order.status }</span></td>
													</c:when>
													
													<c:otherwise>
														<td><span class="badge badge-warning">${order.status }</span></td>
													</c:otherwise>
												</c:choose>
												<td><a href="/CN_WEB_DVTT/User/OrderDetail?order_id=${order.id }"
													class="btn btn-primary btn-sm">View</a></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
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