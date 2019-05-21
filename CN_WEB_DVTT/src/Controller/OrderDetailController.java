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
import Model.User;

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
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String action = request.getParameter("action");
		if(user != null) {
			int order_id = Integer.parseInt(request.getParameter("order_id"));
			System.out.println(order_id);
			OrderDao orderDAO = new OrderDao();
			OrderDetailDao orderDetailDAO = new OrderDetailDao();
			
			try {
				Order  order = orderDAO.getOrderByOrderIdID(order_id);
				if(action.equals("cancel")) {
					order.setStatus("Đã hủy");
					if(orderDAO.changeStatus(order)) {
						ArrayList<Item> items = orderDetailDAO.getOrderDetail(order_id);
						Order  orderUpdate = orderDAO.getOrderByOrderIdID(order_id);
						orderUpdate.setItems(items);
						request.setAttribute("orderHistory", orderUpdate);
						request.setAttribute("items", items);
					}
						
				}
				else if(action.equals("view")) {
					ArrayList<Item> items = orderDetailDAO.getOrderDetail(order_id);
					order.setItems(items);
					request.setAttribute("orderHistory", order);
					request.setAttribute("items", items);
				}
				RequestDispatcher dispatcher = request.getRequestDispatcher("View/User/customer-order-detail.jsp");
				dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("cancelOrder");
		int order_id = Integer.parseInt(request.getParameter("order_id"));
		OrderDao orderDAO = new OrderDao();
		OrderDetailDao orderDetailDAO = new OrderDetailDao();
		Order order = new Order();
		if(action.equals("cancel")) {
			try {
				order = orderDAO.getOrderByOrderIdID(order_id);
				order.setStatus("Đã hủy");
				if(orderDAO.changeStatus(order)) {
					ArrayList<Item> items = orderDetailDAO.getOrderDetail(order_id);
					Order  orderUpdate = orderDAO.getOrderByOrderIdID(order_id);
					orderUpdate.setItems(items);
					request.setAttribute("orderHistory", orderUpdate);
					request.setAttribute("items", items);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("View/User/customer-order-detail.jsp");
			dispatcher.forward(request, response);
		}
	}

}
