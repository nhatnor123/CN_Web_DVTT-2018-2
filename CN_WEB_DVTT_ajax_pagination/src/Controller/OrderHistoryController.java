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
import DAO.UserDAO;
import Model.Order;
import Model.User;

/**
 * Servlet implementation class OrderHistoryController
 */
@WebServlet("/User/OrderHistory")
public class OrderHistoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderHistoryController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("user");
		
		OrderDao orderDAO = new OrderDao();
		try {
			ArrayList<Order> listOrder = orderDAO.getListBillByUserID(user.getId());
			request.setAttribute("listOrder", listOrder);
			RequestDispatcher dispacher = request.getRequestDispatcher("customer-orders-history.jsp");
			dispacher.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
