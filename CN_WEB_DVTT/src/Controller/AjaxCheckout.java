package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Item;
import Model.Order;

@WebServlet("/Ajax/Checkout")
public class AjaxCheckout extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		Order order = (Order) session.getAttribute("order");
		
		System.out.println(req.getParameter("id"));
		
		
		
		for (Item itemTemp :order.getItems()) {
			System.out.println(itemTemp.getId());
			
			if (itemTemp.getProduct().getId() == Integer.parseInt(req.getParameter("id")) ){
			itemTemp.setQuantity(Integer.parseInt(req.getParameter("quantity")));
			System.out.println(itemTemp.getQuantity());
			}
		}
		out.print(order.total() + " VND");
	}
}
