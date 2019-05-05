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
	
	<%
		int maxInEachPage = Integer.parseInt(request.getParameter("maxInEachPage"));
	%>
	
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
											<strong>Show</strong><a
												href="/CN_WEB_DVTT/User/CategoryController?category_id=<%=request.getParameter("category_id")%>&sex=<%=request.getParameter("sex")%>&page=1&maxInEachPage=5"
												class="btn btn-sm <% if (maxInEachPage == 5) out.print("btn-primary"); else out.print("btn-outline-secondary"); %>">5</a><a
												href="/CN_WEB_DVTT/User/CategoryController?category_id=<%=request.getParameter("category_id")%>&sex=<%=request.getParameter("sex")%>&page=1&maxInEachPage=20"
												class="btn btn-sm <% if (maxInEachPage == 20) out.print("btn-primary"); else out.print("btn-outline-secondary"); %> ">20</a><a
												href="/CN_WEB_DVTT/User/CategoryController?category_id=<%=request.getParameter("category_id")%>&sex=<%=request.getParameter("sex")%>&page=1&maxInEachPage=1000"
												class="btn btn-sm <% if (maxInEachPage == 1000) out.print("btn-primary"); else out.print("btn-outline-secondary"); %> ">All</a><span>products</span>
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
													<a
														href="/CN_WEB_DVTT/User/ProductController?product_id=${product.id}"><img
														src="img/${product.avatar}" alt="" class="img-fluid"></a>
												</div>
												<div class="back">
													<a
														href="/CN_WEB_DVTT/User/ProductController?product_id=${product.id}"><img
														src="img/${product.avatar}" alt="" class="img-fluid"></a>
												</div>
											</div>
										</div>
										<a
											href="/CN_WEB_DVTT/User/ProductController?product_id=${product.id}"
											class="invisible"><img src="img/${product.avatar}" alt=""
											class="img-fluid"></a>
										<div class="text">
											<h3>
												<a
													href="/CN_WEB_DVTT/User/ProductController?product_id=${product.id}">${product.name}</a>
											</h3>
											<p class="price">
												<del></del>
												${product.price}VND
											</p>
											<p class="buttons">
												<a
													href="/CN_WEB_DVTT/User/ProductController?product_id=${product.id}"
													class="btn btn-outline-secondary">View detail</a>
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
								
											
									<%
										int totalPage = ((Integer) request.getAttribute("numberOfPage")).intValue();
										int currentPage = Integer.parseInt(request.getParameter("page"));
										if (currentPage ==1){
											out.print("<li class='page-item'><a href='/CN_WEB_DVTT/User/CategoryController?category_id="+ request.getParameter("category_id")+"&sex="+request.getParameter("sex")+"&page=1&maxInEachPage="+request.getParameter("maxInEachPage")+"' aria-label='Previous' class='page-link'><span aria-hidden='true'>«</span><span class='sr-only'>Previous</span></a></li>");
										} else {
											out.print("<li class='page-item'><a href='/CN_WEB_DVTT/User/CategoryController?category_id="+ request.getParameter("category_id")+"&sex="+request.getParameter("sex")+"&page="+(currentPage-1)+"&maxInEachPage="+request.getParameter("maxInEachPage")+"' aria-label='Previous' class='page-link'><span aria-hidden='true'>«</span><span class='sr-only'>Previous</span></a></li>");
										}
										for (int i = 1; i <= totalPage; i++) {
											if (i!= currentPage){
												out.print("<li class='page-item'><a href='/CN_WEB_DVTT/User/CategoryController?category_id="+ request.getParameter("category_id")+"&sex="+request.getParameter("sex")+"&page="+i+"&maxInEachPage="+request.getParameter("maxInEachPage")+"' class='page-link'>" + i + "</a></li>");
											} else {
												out.print("<li class='page-item'><a href='/CN_WEB_DVTT/User/CategoryController?category_id="+ request.getParameter("category_id")+"&sex="+request.getParameter("sex")+"&page="+i+"&maxInEachPage="+request.getParameter("maxInEachPage")+"' class='page-link' style='color:red;' >" + i + "</a></li>");
											}
										}
										if (currentPage ==totalPage){
											out.print("<li class='page-item'><a href='/CN_WEB_DVTT/User/CategoryController?category_id="+ request.getParameter("category_id")+"&sex="+request.getParameter("sex")+"&page="+(currentPage)+"&maxInEachPage="+request.getParameter("maxInEachPage")+"' aria-label='Previous' class='page-link'><span aria-hidden='true'>»</span><span class='sr-only'>Next</span></a></li>");
										} else {
											out.print("<li class='page-item'><a href='/CN_WEB_DVTT/User/CategoryController?category_id="+ request.getParameter("category_id")+"&sex="+request.getParameter("sex")+"&page="+(currentPage+1)+"&maxInEachPage="+request.getParameter("maxInEachPage")+"' aria-label='Previous' class='page-link'><span aria-hidden='true'>»</span><span class='sr-only'>Next</span></a></li>");
										}
										
									%>

									
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