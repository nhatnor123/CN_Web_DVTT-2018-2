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
import javax.servlet.http.HttpSession;

import DAO.OrderDao;
import DAO.OrderDetailDao;
import Model.Item;
import Model.Order;
import Model.OrderDetail;

/**
 * Servlet implementation class OrderDetailController
 */
@WebServlet("/OrderDetail")
public class OrderDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int order_id = Integer.parseInt(request.getParameter("order_id"));
		OrderDao orderDAO = new OrderDao();	
		OrderDetailDao orderDetailDAO = new OrderDetailDao();
		try {	
			ArrayList<Item> items = orderDetailDAO.getOrderDetail(order_id);
			Order  order = orderDAO.getOrderByOrderIdID(order_id);
			order.setItems(items);
			request.setAttribute("orderHistory", order);
			request.setAttribute("items", items);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("View/User/customer-order-detail.jsp");
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
