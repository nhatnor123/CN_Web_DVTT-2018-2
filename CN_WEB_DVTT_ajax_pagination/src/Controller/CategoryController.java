package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import Model.Category;
import Model.Product;

@WebServlet("/User/CategoryController")
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CategoryController() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			getListProductByPage(request, response);
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	private void getListProduct(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		ProductDAO productDAO = new ProductDAO();
		CategoryDAO categoryDAO = new CategoryDAO();
		ArrayList<Category> listCategory = categoryDAO.getListCategory();

//		for (Category ctg : listCategory) {
//			System.out.println(ctg.getId() + " " + ctg.getName() + " " + ctg.getSex());
//		}
		System.out.println("get list prd ");
		request.getServletContext().setAttribute("listCategory", listCategory);
		ArrayList<Product> listProductByCategory = new ArrayList<Product>();
		String category_id = "";
		String sex = "";
		if (request.getParameter("category_id") != null && request.getParameter("sex") != null) {
			category_id = request.getParameter("category_id");
			sex = request.getParameter("sex");
			int idCategory = Integer.parseInt(category_id);
			listProductByCategory = productDAO.getListProductByCategory(idCategory);
			request.setAttribute("listProductByCategory", listProductByCategory);
			request.setAttribute("sexCategory", sex);

			RequestDispatcher dispatcher = request.getRequestDispatcher("category.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		}
	}

	private void getListProductByPage(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		ProductDAO productDAO = new ProductDAO();
		CategoryDAO categoryDAO = new CategoryDAO();
		ArrayList<Category> listCategory = categoryDAO.getListCategory();

		System.out.println("get list prd ");
		request.getServletContext().setAttribute("listCategory", listCategory);
		ArrayList<Product> listProductByCategory = new ArrayList<Product>();
		String category_id = "";
		String sex = "";
		System.out.println("get list prd by page");
		if (request.getParameter("category_id") != null && request.getParameter("sex") != null
				&& request.getParameter("page") != null && request.getParameter("maxInEachPage") != null) {
			category_id = request.getParameter("category_id");
			sex = request.getParameter("sex");
			int page = Integer.parseInt(request.getParameter("page"));
			int maxInEachPage = Integer.parseInt(request.getParameter("maxInEachPage"));
			int idCategory = Integer.parseInt(category_id);
			int modeSort = Integer.parseInt(request.getParameter("sortMode"));
//			System.out.println(page + " " + maxInEachPage);
			listProductByCategory = productDAO.getListProductByCategoryAndPage(idCategory, page, maxInEachPage,
					modeSort);

			Integer numberOfPage = productDAO.getNumberOfPageListProductByCategory(idCategory, maxInEachPage);

			request.setAttribute("numberOfPage", numberOfPage);
			request.setAttribute("listProductByCategory", listProductByCategory);
			request.setAttribute("sexCategory", sex);

			RequestDispatcher dispatcher = request.getRequestDispatcher("category.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		}
	}
}
