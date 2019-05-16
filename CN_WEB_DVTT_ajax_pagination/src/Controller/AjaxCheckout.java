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

@WebServlet("/User/Ajax/Checkout")
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
//			out.print("<tr>\r\n" + 
//					"												<td><a href=\"/CN_WEB_DVTT/User/ProductController?product_id="+itemTemp.getId()+"\"><img src=\"img/"+itemTemp.getProduct().getAvatar()+"\"\r\n" + 
//					"														alt=\"\"></a></td>\r\n" + 
//					"												<td><a href=\"/CN_WEB_DVTT/User/ProductController?product_id="+itemTemp.getId()+"\"\">"+itemTemp.getProduct().getName()+"</a></td>\r\n" + 
//					"												<td><input type=\"number\" value=\""+itemTemp.getQuantity()+"\"\r\n" + 
//					"													class=\"form-control quantityProduct\" name=\"quantityProduct\" id=\"quantity"+itemTemp.getProduct().getId()+"\" min  = \"0\"  onchange=\"change(this.id)\"></td>\r\n" + 
//					"												<td id=\"price"+itemTemp.getProduct().getId()+"\">"+itemTemp.getPrice()+"đ</td>\r\n" + 
//					"												<td id=\"total"+itemTemp.getProduct().getId()+"\">"+(itemTemp.getPrice()*itemTemp.getQuantity())+" đ</td>\r\n" + 
//					"												<td><a href=\"#\"><i class=\"fa fa-trash-o\"></i></a></td>\r\n" + 
//					"											</tr>");
		}
		}
		out.print(order.total() + " VND");
	}
}
