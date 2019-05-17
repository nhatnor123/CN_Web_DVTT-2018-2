package Controller;

import java.io.IOException;
import java.math.RoundingMode;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CommentDAO;
import DAO.OrderDetailDao;
import DAO.ProductDAO;
import DAO.UserDAO;
import Model.Comment;
import Model.Product;
import Model.User;

/**
 * Servlet implementation class CommentWithoutBuy
 */
@WebServlet("/CommentWithoutBuy")
public class CommentWithoutBuyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NumberFormat numEN = NumberFormat.getPercentInstance();
	private NumberFormat numf = NumberFormat.getNumberInstance();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentWithoutBuyController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		CommentDAO commentDAO = new CommentDAO();
		OrderDetailDao orderDetailDao = new OrderDetailDao();

		User u = (User) session.getAttribute("user");
		if (u != null) {
			int user_id = u.getId();
			int productId = Integer.parseInt(request.getParameter("productId"));
			int star = Integer.parseInt(request.getParameter("star"));
			String title = (String) request.getParameter("title");
			String content = (String) request.getParameter("content");
			Comment comment = new Comment(0, title, content, star, user_id, productId, null, null);

			if (commentDAO.insertComment(comment)) {
				// copy thương tự ProductController
				ProductDAO productDAO = new ProductDAO();
				UserDAO userDAO = new UserDAO();
				HashMap<User, Comment> hashMapComment = new HashMap<User, Comment>();
				ArrayList<Comment> listCommentOfProduct = new ArrayList<Comment>();
				Product product = new Product();

				try {
					product = productDAO.getProductById(productId);
					request.setAttribute("product", product);
					listCommentOfProduct = commentDAO.getListCommentProduct(productId);
					double oneStar=0, twoStar=0, threeStar=0, fourStar=0, fiveStar=0, totalStar=0, countStar = 0;
					double avg = 0;
					for(Comment c : listCommentOfProduct) {
						if(c.getStar()==1) {
							oneStar +=1;
						}
						if(c.getStar()==2) {
							twoStar +=1;
						}
						if(c.getStar()==3) {
							threeStar +=1;
						}
						if(c.getStar()==4) {
							fourStar +=1;
						}
						if(c.getStar()==5) {
							fiveStar +=1;
						}
						
						totalStar += c.getStar();
						User user = userDAO.getUserbyId(c.getUser_id());
						hashMapComment.put(user, c);
					}
					if(hashMapComment.size() > 0) {
						numf.setRoundingMode(RoundingMode.UP);
						avg = Double.parseDouble(numf.format(totalStar/hashMapComment.size()));
					}
					countStar = oneStar + twoStar + threeStar + fourStar + fiveStar;
					request.setAttribute("oneStar", numEN.format(oneStar/countStar));
					request.setAttribute("twoStar", numEN.format(twoStar/countStar));
					request.setAttribute("threeStar", numEN.format(threeStar/countStar));
					request.setAttribute("fourStar", numEN.format(fourStar/countStar));
					request.setAttribute("fiveStar", numEN.format(fiveStar/countStar));
					request.setAttribute("avgStar", avg);
					request.setAttribute("hashMapComment", hashMapComment);
				} catch (SQLException e) {
					response.sendRedirect(request.getContextPath()+"/View/User/404.jsp");
					e.printStackTrace();
				}
				// kết thúc copy
				RequestDispatcher dispatcher = request.getRequestDispatcher("View/User/productDetail.jsp");
				dispatcher.forward(request, response);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher("View/User/404.jsp");
				dispatcher.forward(request, response);
			}
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
