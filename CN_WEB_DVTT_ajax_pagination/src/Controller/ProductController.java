package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
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


@WebServlet("/User/ProductController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

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
				int oneStar=0, twoStar=0, threeStar=0, fourStar=0, fiveStar=0, totalStar=0;
				float avg = 0;
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
					avg = totalStar/listCommentOfProduct.size();
				}
				
				Collections.reverse(listCommentOfProduct);
				
				System.out.println(listCommentOfProduct);
				
				request.setAttribute("oneStar", oneStar);
				request.setAttribute("twoStar", twoStar);
				request.setAttribute("threeStar", threeStar);
				request.setAttribute("fourStar", fourStar);
				request.setAttribute("fiveStar", fiveStar);
				request.setAttribute("avgStar", avg);
				request.setAttribute("hashMapComment", listCommentOfProduct);
				
				
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("productDetail.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				response.sendRedirect("/CN_WEB_DVTT/User/404.jsp");
				e.printStackTrace();
			}
			
		}else {
			response.sendRedirect("/CN_WEB_DVTT/User/404.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	

}
