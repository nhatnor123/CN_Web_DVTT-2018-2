package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Item;
import Model.Order;

@WebServlet("/RemoveItemCart")
public class RemoveItemCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RemoveItemCartController() {
		super();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ArrayList<Item> listItem = new ArrayList<Item>();
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order");
		listItem = order.getItems();
		for (Item item : order.getItems()) {
			if (item.getProduct().getId() == product_id) {
				listItem.remove(item);
				break;
			}
		}
		order.setItems(listItem);
		session.setAttribute("order", order);
		RequestDispatcher dispatcher = request.getRequestDispatcher("View/User/shopping-cart.jsp");
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
