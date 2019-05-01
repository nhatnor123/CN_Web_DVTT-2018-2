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
					
					<div class="col-lg-12">
						<div class="box">
							<c:choose>
								<c:when test="${sexCategory eq '1'}">  
									<h1>Quần áo nam</h1> 
    							</c:when>

								<c:otherwise>  
									<h1>Quần áo nữ</h1> 
    							</c:otherwise>
							</c:choose>
						</div>
						<div class="box info-bar">
							<div class="row">
								<div class="col-md-12 col-lg-4 products-showing">
									Showing <strong>12</strong> of <strong>25</strong> products
								</div>
								<div class="col-md-12 col-lg-7 products-number-sort">
									<form
										class="form-inline d-block d-lg-flex justify-content-between flex-column flex-md-row">
										<div class="products-number">
											<strong>Show</strong><a href="#"
												class="btn btn-sm btn-primary">12</a><a href="#"
												class="btn btn-outline-secondary btn-sm">24</a><a href="#"
												class="btn btn-outline-secondary btn-sm">All</a><span>products</span>
										</div>
										<div class="products-sort-by mt-2 mt-lg-0">
											<strong>Sort by</strong> <select name="sort-by"
												class="form-control">
												<option>Price</option>
												<option>Name</option>
												<option>Sales first</option>
											</select>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="row products">
						
						<c:forEach items="${listProductByCategory}" var="product">
						
							<div class="col-lg-3 col-md-6">
								<div class="product">
									<div class="flip-container">
										<div class="flipper">
											<div class="front">
												<a href="/CN_WEB_DVTT/User/ProductController?product_id=${product.id}"><img src="img/${product.avatar}" alt=""
													class="img-fluid"></a>
											</div>
											<div class="back">
												<a href="/CN_WEB_DVTT/User/ProductController?product_id=${product.id}"><img src="img/${product.avatar}"
													alt="" class="img-fluid"></a>
											</div>
										</div>
									</div>
									<a href="/CN_WEB_DVTT/User/ProductController?product_id=${product.id}" class="invisible"><img
										src="img/${product.avatar}" alt="" class="img-fluid"></a>
									<div class="text">
										<h3>
											<a href="/CN_WEB_DVTT/User/ProductController?product_id=${product.id}">${product.name}</a>
										</h3>
										<p class="price">
											<del></del>
											${product.price}VND
										</p>
										<p class="buttons">
											<a href="/CN_WEB_DVTT/User/ProductController?product_id=${product.id}" class="btn btn-outline-secondary">View
												detail</a>
										</p>
									</div>
									<!-- /.text-->
								</div>
								<!-- /.product            -->
							</div>
							
							</c:forEach>

						</div>
						<div class="pages">
							<p class="loadMore">
								<a href="#" class="btn btn-primary btn-lg"><i
									class="fa fa-chevron-down"></i> Load more</a>
							</p>
							<nav aria-label="Page navigation example"
								class="d-flex justify-content-center">
								<ul class="pagination">
									<li class="page-item"><a href="#" aria-label="Previous"
										class="page-link"><span aria-hidden="true">«</span><span
											class="sr-only">Previous</span></a></li>
									<li class="page-item active"><a href="#" class="page-link">1</a></li>
									<li class="page-item"><a href="#" class="page-link">2</a></li>
									<li class="page-item"><a href="#" class="page-link">3</a></li>
									<li class="page-item"><a href="#" class="page-link">4</a></li>
									<li class="page-item"><a href="#" class="page-link">5</a></li>
									<li class="page-item"><a href="#" aria-label="Next"
										class="page-link"><span aria-hidden="true">»</span><span
											class="sr-only">Next</span></a></li>
								</ul>
							</nav>
						</div>
					</div>
					<!-- /.col-lg-9-->
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>