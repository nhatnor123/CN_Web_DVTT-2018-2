package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ProductDAO;
import Model.Item;
import Model.Order;
import Model.Product;
import Model.User;

@WebServlet("/User/AddToCart")
public class AddToCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	
	private ProductDAO productDAO;

    public AddToCartController() {
        super();
        productDAO = new ProductDAO();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int quantity = 1;
		int id;
		if(request.getParameter("product_id") != null) {
			id = Integer.parseInt(request.getParameter("product_id"));
			try {
				Product product = productDAO.getProductById(id);
				if (product != null) {
					if (request.getParameter("quantity") != null) {
						quantity = Integer.parseInt(request.getParameter("quantity"));
					}
					HttpSession session = request.getSession();
					if(session.getAttribute("order") == null) {
						Order order = new Order();
						ArrayList<Item> listItems = new ArrayList<Item>();
						Item item = new Item();
						item.setQuantity(quantity);
						item.setProduct(product);
						item.setPrice(product.getPrice());
						listItems.add(item);
						order.setItems(listItems);
						session.setAttribute("order", order);
					}else {
						Order order = (Order) session.getAttribute("order");
						ArrayList<Item> listItems = order.getItems();
						boolean check = false;
						for(Item item : listItems) {
							if(item.getProduct().getId() == product.getId()) {
								item.setQuantity(item.getQuantity() + quantity);
								check = true;
							}
						}
						
						if(check == false) {
							Item item = new Item();
							item.setQuantity(quantity);
							item.setProduct(product);
							item.setPrice(product.getPrice());
							listItems.add(item);
						}
						
						session.setAttribute("order", order);
					}
					
				}
				response.sendRedirect(request.getContextPath()+"/User/index.jsp");
			} catch (SQLException e) {
				response.sendRedirect("/CN_WEB_DVTT/User/404.jsp");
				e.printStackTrace();
			}
		}else {
			response.sendRedirect(request.getContextPath()+"/User/404.jsp");
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
