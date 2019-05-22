package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.RoundingMode;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CommentDAO;
import DAO.ProductDAO;
import DAO.UserDAO;
import Model.Comment;
import Model.Product;
import Model.User;


@WebServlet("/productController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NumberFormat numEN = NumberFormat.getPercentInstance();
	private NumberFormat numf = NumberFormat.getNumberInstance();
       

    public ProductController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO productDAO = new ProductDAO();
		CommentDAO commentDAO = new CommentDAO();
		UserDAO userDAO = new UserDAO();
		HashMap<User, Comment> hashMapComment = new HashMap<User, Comment>();
		ArrayList<Comment> listCommentOfProduct = new ArrayList<Comment>();
		Product product = new Product();
		int productId;
		if(request.getParameter("product_id")!= null) {
			productId = Integer.parseInt(request.getParameter("product_id"));
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
					User u = userDAO.getUserbyId(c.getUser_id());
					c.setUserComment(u);
				}
				if(listCommentOfProduct.size() > 0) {
					numf.setRoundingMode(RoundingMode.UP);
					avg = Double.parseDouble(numf.format(totalStar/listCommentOfProduct.size()));
				}
				
				Collections.reverse(listCommentOfProduct);
				
				countStar = oneStar + twoStar + threeStar + fourStar + fiveStar;
				request.setAttribute("oneStar", numEN.format(oneStar/countStar));
				request.setAttribute("twoStar", numEN.format(twoStar/countStar));
				request.setAttribute("threeStar", numEN.format(threeStar/countStar));
				request.setAttribute("fourStar", numEN.format(fourStar/countStar));
				request.setAttribute("fiveStar", numEN.format(fiveStar/countStar));
				request.setAttribute("avgStar", avg);
				request.setAttribute("listCommentOfProduct", listCommentOfProduct);
				RequestDispatcher dispatcher = request.getRequestDispatcher("View/User/productDetail.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				response.sendRedirect(request.getContextPath()+"/View/User/404.jsp");
				e.printStackTrace();
			}
			
		}else {
			response.sendRedirect(request.getContextPath()+"/View/User/404.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	

}