<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<body>
	<div class="col-lg-3 order-2 order-lg-1">
		<!--
              *** MENUS AND FILTERS ***
              _________________________________________________________
              -->
		<div class="card sidebar-menu mb-4">
			<div class="card-header">
				<h3 class="h4 card-title">Danh mục</h3>
			</div>
			<div class="card-body">
				<ul class="nav nav-pills flex-column category-menu">
					<li><a href="category.html" class="nav-link">Quần áo nam <span
							class="badge badge-secondary">42</span></a> 
					<c:forEach items="${listCategory}" var="category">
						<c:if test="${category.sex eq '1' }">
								<ul class="list-unstyled">
									<li><a href="category.html" class="nav-link">${category.name }</a></li>
								</ul></li>
						</c:if>
					</c:forEach>
					<li><a href="category.html" class="nav-link active">Ladies
							<span class="badge badge-light">123</span></a> 
							
					<c:forEach items="${listCategory}" var="category">
						<c:if test="${category.sex eq '0' }">
								<ul class="list-unstyled">
									<li><a href="category.html" class="nav-link">${category.name }</a></li>
								</ul></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="card sidebar-menu mb-4">
			<div class="card-header">
				<h3 class="h4 card-title">
					Thương hiệu <a href="#" class="btn btn-sm btn-danger pull-right"><i
						class="fa fa-times-circle"></i> Xóa</a>
				</h3>
			</div>
			<div class="card-body">
				<form>
					<div class="form-group">
						<div class="checkbox">
							<label> <input type="checkbox"> Armani (10)
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox"> Versace (12)
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox"> Carlo Bruni (15)
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox"> Jack Honey (14)
							</label>
						</div>
					</div>
					<button class="btn btn-default btn-sm btn-primary">
						<i class="fa fa-pencil"></i> Lưu
					</button>
				</form>
			</div>
		</div>
		<div class="card sidebar-menu mb-4">
			<div class="card-header">
				<h3 class="h4 card-title">
					Màu sắc <a href="#" class="btn btn-sm btn-danger pull-right"><i
						class="fa fa-times-circle"></i> Xóa</a>
				</h3>
			</div>
			<div class="card-body">
				<form>
					<div class="form-group">
						<div class="checkbox">
							<label> <input type="checkbox"><span
								class="colour white"></span> White (14)
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox"><span
								class="colour blue"></span> Blue (10)
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox"><span
								class="colour green"></span> Green (20)
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox"><span
								class="colour yellow"></span> Yellow (13)
							</label>
						</div>
						<div class="checkbox">
							<label> <input type="checkbox"><span
								class="colour red"></span> Red (10)
							</label>
						</div>
					</div>
					<button class="btn btn-default btn-sm btn-primary">
						<i class="fa fa-pencil"></i> Lưu
					</button>
				</form>
			</div>
		</div>
		<!-- *** MENUS AND FILTERS END ***-->
		<div class="banner">
			<a href="#"><img src="././template/user/img/banner.jpg" alt="sales 2014"
				class="img-fluid"></a>
		</div>
	</div>
</body>
</html>