package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BannnerDAO;
import DAO.CategoryDAO;
import DAO.ProductDAO;
import Model.Category;
import Model.Product;


@WebServlet("/index")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		CategoryDAO categoryDAO = new CategoryDAO();
		ServletContext servCon = getServletContext();
		try {
			ArrayList<Product> listProductNew = new ArrayList<Product>();
			ArrayList<Product> listProductMale = new ArrayList<Product>();
			ArrayList<Product> listProductFeMale = new ArrayList<Product>();
			ArrayList<Category> listCategory = categoryDAO.getListCategory();
			for(Category c : listCategory) {
				if(c.getSex().equals("1")) {
					ArrayList<Product> listProduct = (ArrayList<Product>) productDAO.getListProductHot(c.getId());
					listProductMale.addAll(listProduct);
				}else {
					ArrayList<Product> listProduct = (ArrayList<Product>) productDAO.getListProductHot(c.getId());
					listProductFeMale.addAll(listProduct);
				}
			}
			
			listProductNew = (ArrayList<Product>) productDAO.getListProductNew();	
			servCon.setAttribute("listProductNew", listProductNew);
			servCon.setAttribute("listProductMale", listProductMale);
			servCon.setAttribute("listProductFeMale", listProductFeMale);
			servCon.setAttribute("listCategory", listCategory);
			servCon.setAttribute("listBanner",new BannnerDAO().getListBanner());
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("View/User/index.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
