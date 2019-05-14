package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.OrderDao;
import DAO.ProductDAO;
import Model.Product;

/**
 * Servlet implementation class AdminOrderController
 */
@WebServlet("/Admin/AdminOrderController")
public class AdminOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String path = "";
		String action = "";	
		if (request.getParameter("action") != null) {
			action = request.getParameter("action");
			if (action.equalsIgnoreCase("remove")) {
				int orderId = Integer.parseInt(request.getParameter("orderId"));
				new OrderDao().deleteOrderById(orderId);
				path = "ListOrder.jsp";
			}
			else if(action.equalsIgnoreCase("view")) {
				int orderId = Integer.parseInt(request.getParameter("orderId"));
				try {	
					request.setAttribute("bill",new OrderDao().getOrderByOrderIdID(orderId));
					path = "Bill.jsp";
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
		}
		else {
			request.setAttribute("list",new OrderDao().getListOrder());
			path = "ListOrder.jsp";
		}
	
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
