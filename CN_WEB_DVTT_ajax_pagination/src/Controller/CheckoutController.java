package Controller;

import java.io.IOException;

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

@WebServlet("/User/Checkout")
public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckoutController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Order order = (Order) session.getAttribute("order");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String url = "";

		if (order == null || user == null) {
			if (user == null) {
				url = "register.jsp";
				session.setAttribute("login_err", "Bạn phải đăng nhập trước khi thanh toán");
			} else if(order == null){
				String checkout_err = "Vui lòng thêm sản phẩm vào giỏ hàng trước khi thanh toán";
				session.setAttribute("checkout_err", checkout_err);
				url = "shopping-cart.jsp";
			}

		} else {
			OrderDao orderDAO = new OrderDao();
			OrderDetailDao orderDetailDAO = new OrderDetailDao();
			order.setUser(user);
			order.setAddress(address);
			order.setPhone(phone);
			
			int order_id = orderDAO.insertOrder(order);
			for(Item item : order.getItems()) {
				OrderDetail orderDetail = new OrderDetail();
				orderDetail.setOrderDetail_id(0);
				orderDetail.setOrder_id(order_id);
				orderDetail.setProduct_id(item.getProduct().getId());
				orderDetail.setQuantity(item.getQuantity());
				orderDetailDAO.insertOrderDetail(orderDetail);
			
			}
			session.removeAttribute("order");
			session.setAttribute("messageCheckout", "Đơn hàng đang được xử lý!");
			url = "index.jsp";

		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
