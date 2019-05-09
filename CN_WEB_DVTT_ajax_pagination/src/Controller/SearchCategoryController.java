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

@WebServlet("User/SearchCategoryController")
public class SearchCategoryController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			getListProductByPage(req, resp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void getListProductByPage(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		ProductDAO productDAO = new ProductDAO();
		CategoryDAO categoryDAO = new CategoryDAO();
		ArrayList<Category> listCategory = categoryDAO.getListCategory();

		System.out.println("search list prd ");
		request.getServletContext().setAttribute("listCategory", listCategory);
		ArrayList<Product> listProductByCategory = new ArrayList<Product>();
		String category_id = "";
		String sex = "";
		System.out.println("search list prd by page");
		if (request.getParameter("str") != null && request.getParameter("page") != null
				&& request.getParameter("maxInEachPage") != null && request.getParameter("sortMode") != null) {
			String str = request.getParameter("str");
			int page = Integer.parseInt(request.getParameter("page"));
			int maxInEachPage = Integer.parseInt(request.getParameter("maxInEachPage"));
			
			int modeSort = Integer.parseInt(request.getParameter("sortMode"));
//			System.out.println(page + " " + maxInEachPage);
			listProductByCategory = productDAO.searchListProductByCategoryAndPage(category_id, page, maxInEachPage, modeSort);

			Integer numberOfPage = productDAO.getNumberOfPageListProductBySearchCategory(str, maxInEachPage);

			request.setAttribute("numberOfPage", numberOfPage);
			request.setAttribute("listProductByCategory", listProductByCategory);
			request.setAttribute("sexCategory", sex);

			RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		}
	}
}
