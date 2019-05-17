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
import javax.servlet.http.HttpSession;

import DAO.OrderDao;
import DAO.OrderDetailDao;
import DAO.ProductDAO;
import Model.Order;
import Model.Product;
import Model.User;

/**
 * Servlet implementation class AdminOrderController
 */
@WebServlet("/ordermanage")
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
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null && (user.getLevel() == 3)) {
		request.setCharacterEncoding("utf-8");
		String path = "";
		String action = "";	
		if (request.getParameter("action") != null) {
			action = request.getParameter("action");
		}
		if(action.equalsIgnoreCase("view")) {
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			try {	
		//		request.setAttribute("items", new OrderDetailDao().getOrderDetail(orderId));
				request.setAttribute("bill",new OrderDao().getOrderByOrderIdID(orderId));
				path = "View/Admin/Bill.jsp";
			} catch (SQLException e) {
				e.printStackTrace();
			}		
		}
		else if(action.equalsIgnoreCase("edit")) {
			int orderId = Integer.parseInt(request.getParameter("orderId"));
			request.setAttribute("id", orderId);
			path = "View/Admin/OrderStatus.jsp";
		}
		else {
			request.setAttribute("list",new OrderDao().getListOrder());
			path = "View/Admin/ListOrder.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("View/Admin/Login.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Order order = new Order();
		order.setId(Integer.parseInt(request.getParameter("orderId")));
		order.setStatus(request.getParameter("status"));
		String mes = "";
		if(new OrderDao().changeStatus(order)) {
			mes = "Cập nhật trạng thái thành công";
		}
		else mes = "Cập nhật trạng thái thất bại";
		request.setAttribute("mes", mes);
		request.setAttribute("list",new OrderDao().getListOrder());
		RequestDispatcher dispatcher = request.getRequestDispatcher("View/Admin/ListOrder.jsp");
		dispatcher.forward(request, response);
	}

}
