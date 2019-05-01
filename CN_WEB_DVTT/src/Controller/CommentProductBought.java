package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.OrderDetailDao;
import DAO.ProductDAO;
import Model.OrderDetail;
import Model.Product;
import Model.User;


@WebServlet("/User/Comment")
public class CommentProductBought extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CommentProductBought() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		User u = (User)session.getAttribute("user");
		int user_id = u.getId();
		
		ArrayList<Product> listProductNotComment = new ArrayList<Product>();
		OrderDetailDao orderDetailDAO = new OrderDetailDao();
		ProductDAO productDAO = new ProductDAO();
		HashMap<Integer, Product> hashMapOrderDetail = new HashMap<Integer, Product>();
		
		try {
			
			ArrayList<OrderDetail> listOrderDetailNotComment = orderDetailDAO.getOrderDetailNotComment(user_id);
			for(OrderDetail od : listOrderDetailNotComment) {
				Product product = productDAO.getProductById(od.getProduct_id());
				hashMapOrderDetail.put(od.getOrderDetail_id(), product);
//				listProductNotComment.add(product);
			}
//			request.setAttribute("listProductNotComment", listProductNotComment);
			request.setAttribute("hashMapOrderDetail", hashMapOrderDetail);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("commentProductBought.jsp");
		dispatcher.forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
