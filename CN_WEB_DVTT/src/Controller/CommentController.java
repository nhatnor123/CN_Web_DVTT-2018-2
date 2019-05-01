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
import Model.User;

/**
 * Servlet implementation class CommentController
 */
@WebServlet("/User/CommentProduct")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CommentDAO commentDAO = new CommentDAO();
		OrderDetailDao orderDetailDao = new OrderDetailDao();

		User u = (User) session.getAttribute("user");

		int user_id = u.getId();
		int product_id = (int) session.getAttribute("product_id");
//		int productId = Integer.parseInt(request.getParameter("productId"));
//		System.out.println(productId);
		int star = Integer.parseInt(request.getParameter("star"));
		String title = (String) request.getParameter("title");
		String content = (String) request.getParameter("content");
		int orderDetail_id = (int) session.getAttribute("orderDetail_id");
		Comment comment = new Comment(0, title, content, star, user_id, product_id, null, null);

		if (commentDAO.insertComment(comment)) {
			orderDetailDao.updateCommentOrderDetail(orderDetail_id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("404.jsp");
			dispatcher.forward(request, response);
		}

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
