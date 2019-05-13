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

import DAO.ProductDAO;
import Model.ProductColor;

/**
 * Servlet implementation class AdminUpdateProductController
 */
@WebServlet("/Admin/AdminImportProductController")
public class AdminImportProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminImportProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int product_id = Integer.parseInt(request.getParameter("prId"));
		ProductDAO productDAO = new ProductDAO();
		ArrayList<ProductColor> listProductColor_Size = productDAO.getListProductInWarehouse(product_id);
		request.setAttribute("listColor_Size", listProductColor_Size);
		RequestDispatcher dispatcher = request.getRequestDispatcher("importProduct.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int product_id = Integer.parseInt(request.getParameter("prId"));
		int size_id = Integer.parseInt(request.getParameter("size_id"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		ProductDAO productDAO = new ProductDAO();
		try {
			int currentQuantity = productDAO.getQuantityBySize(size_id);
			int total = currentQuantity+quantity;
			if(productDAO.importQuantityBySize(size_id,total )) {
				System.out.println("thành công");
				ArrayList<ProductColor> listProductColor_Size = productDAO.getListProductInWarehouse(product_id);
				request.setAttribute("listColor_Size", listProductColor_Size);
				RequestDispatcher dispatcher = request.getRequestDispatcher("importProduct.jsp");
				dispatcher.forward(request, response);
			}else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("404.jsp");
				dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
