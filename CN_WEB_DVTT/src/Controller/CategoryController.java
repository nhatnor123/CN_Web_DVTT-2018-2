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


@WebServlet("/CategoryController")
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CategoryController() {
        super();
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			getListProduct(request, response);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	private void getListProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		ProductDAO productDAO = new ProductDAO();
		CategoryDAO categoryDAO = new CategoryDAO();
		ArrayList<Category> listCategory = categoryDAO.getListCategory();
		
		request.getServletContext().setAttribute("listCategory", listCategory);
		ArrayList<Product> listProductByCategory = new ArrayList<Product>();
		String category_id = "";
		String sex = "";
		if(request.getParameter("category_id") != null && request.getParameter("sex")!=null) {
			category_id = request.getParameter("category_id");
			sex = request.getParameter("sex");
			int idCategory = Integer.parseInt(category_id);
			listProductByCategory = productDAO.getListProductByCategory(idCategory);
			request.setAttribute("listProductByCategory", listProductByCategory);
			request.setAttribute("sexCategory", sex);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("View/User/category.jsp");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("View/User/index.jsp");
			dispatcher.forward(request, response);
		}
	}

}
