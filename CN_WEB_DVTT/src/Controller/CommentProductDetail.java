package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CommentDAO;
import DAO.OrderDetailDao;
import Model.Comment;
import Model.OrderDetail;
import Model.User;

@WebServlet("/User/CommentProductDetail")
public class CommentProductDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CommentProductDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int orderDetail_id = Integer.parseInt(request.getParameter("orderDetail_id"));
		
		HttpSession session = request.getSession();
		session.setAttribute("product_id", product_id);
		session.setAttribute("orderDetail_id", orderDetail_id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("commentProduct.jsp");
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
