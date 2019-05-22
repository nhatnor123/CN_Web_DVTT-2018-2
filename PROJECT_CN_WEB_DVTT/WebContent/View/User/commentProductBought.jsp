<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Nhận xét sản phẩm</title>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">

					<jsp:include page="customer-menu.jsp"></jsp:include>

					<div id="customer-order" class="col-lg-8">
						<div class="row same-height-row">
							<div class="col-md-12">
								<h2>Nhận xét sản phẩm đã mua</h2>
							</div>
							<c:if test="${hashMapOrderDetail.size() == 0 }">
								<h4>Bạn đã nhận xét hết hoặc chưa mua sản phẩm nào</h4>
							</c:if>
							<c:forEach items="${hashMapOrderDetail }" var="item">

								<div class="col-md-4 col-sm-6">
									<div class="product">
										<div class="flip-container">
											<div class="flipper">
												<div class="front">
													<a href="productController?product_id=${item.getValue().id}"><img src="././template/user/img/${item.getValue().avatar }"
														alt="" class="img-fluid"></a>
												</div>
												<div class="back">
													<a href="productController?product_id=${item.getValue().id}"><img src="././template/user/img/${item.getValue().avatar }"
														alt="" class="img-fluid"></a>
												</div>
											</div>
										</div>
										<a
											href="productController?product_id=${item.getValue().id}"
											class="invisible"><img src="././template/user/img/${item.getValue().avatar }" alt=""
											class="img-fluid"></a>
										<div class="text">
											<h4><a href="productController?product_id=${item.getValue().id}">${item.getValue().name }<a></h4>
											
											<p class="buttons">
												<a
													href="CommentProductDetail?product_id=${item.getValue().id}&orderDetail_id=${item.getKey()}"
													class="btn btn-outline-secondary">Viết nhận xét</a>
											</p>
										</div>
									</div>
									<!-- /.product-->
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>