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
import javax.servlet.http.HttpSession;

import DAO.CommentDAO;
import DAO.OrderDetailDao;
import DAO.ProductDAO;
import DAO.UserDAO;
import Model.Comment;
import Model.Product;
import Model.User;

@WebServlet("/Ajax/listComment")
public class AjaxComment extends HttpServlet{
	
	private NumberFormat numEN = NumberFormat.getPercentInstance();
	private NumberFormat numf = NumberFormat.getNumberInstance();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("dang vao ajax comment");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		CommentDAO commentDAO = new CommentDAO();
		OrderDetailDao orderDetailDao = new OrderDetailDao();

		User u = (User) session.getAttribute("user");

		int user_id = u.getId();
		int productId = Integer.parseInt(request.getParameter("prdID"));
		System.out.println(productId);
		int star = Integer.parseInt(request.getParameter("countStar"));
		String title = (String) request.getParameter("title");
		String content = (String) request.getParameter("content");
		Comment comment = new Comment(0, title, content, star, user_id, productId, null, null);
		comment.setUserComment(u);
		
		if (commentDAO.insertComment(comment)) {
			
			System.out.println("vao lenh if");
			
			// copy thương tự ProductController
			ProductDAO productDAO = new ProductDAO();
			UserDAO userDAO = new UserDAO();

			ArrayList<Comment> listCommentOfProduct = new ArrayList<Comment>();
			Product product = new Product();

			try {
				System.out.println("vao try");
				
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
					
					User user11 = userDAO.getUserbyId(c.getUser_id());
					c.setUserComment(user11); 
					//System.out.println("for 1 :"+user11.getName());
				}
				if (listCommentOfProduct.size() > 0) {
					numf.setRoundingMode(RoundingMode.UP);
					avg = Double.parseDouble(numf.format(totalStar/listCommentOfProduct.size()));
				}
				countStar = oneStar + twoStar + threeStar + fourStar + fiveStar;
				String String1Star = numEN.format(oneStar/countStar);
				String String2Star = numEN.format(twoStar/countStar);
				String String3Star = numEN.format(threeStar/countStar);
				String String4Star = numEN.format(fourStar/countStar);
				String String5Star = numEN.format(fiveStar/countStar);
				
				System.out.println(String4Star);
				System.out.println(String1Star);
					
				out.print("<div class=\"row\">\r\n" + 
						"								<div class=\"col-md-3 text-center\">\r\n" + 
						"									<p>Đánh giá trung bình</p>\r\n" + 
						"									<h1>"+avg+"</h1>\r\n" + 
						"									<p>("+listCommentOfProduct.size()+" nhận xét)</p>\r\n" + 
						"								</div>\r\n" + 
						"								<div class=\"col-md-6 \">\r\n" + 
						"									<div class=\"row\">\r\n" + 
						"										<div class=\"col-md-2\">\r\n" + 
						"											<span class=\"5star\">5 sao</span>\r\n" + 
						"										</div>\r\n" + 
						"										<div class=\"col-md-10\">\r\n" + 
						"											<div class=\"progress\">\r\n" + 
						"												<div class=\"progress-bar progress-bar-success\"\r\n" + 
						"													role=\"progressbar\" aria-valuenow=\"40\" aria-valuemin=\"0\"\r\n" + 
						"													aria-valuemax=\"100\" style=\"width: "+String5Star+"\">"+String5Star+"</div>\r\n" + 
						"											</div>\r\n" + 
						"										</div>\r\n" + 
						"									</div>\r\n" + 
						"\r\n" + 
						"\r\n" + 
						"									<div class=\"row\">\r\n" + 
						"										<div class=\"col-md-2\">\r\n" + 
						"											<span class=\"5star\">4 sao</span>\r\n" + 
						"										</div>\r\n" + 
						"										<div class=\"col-md-10\">\r\n" + 
						"											<div class=\"progress\">\r\n" + 
						"												<div class=\"progress-bar progress-bar-success\"\r\n" + 
						"													role=\"progressbar\" aria-valuenow=\"40\" aria-valuemin=\"0\"\r\n" + 
						"													aria-valuemax=\"100\" style=\"width: "+String4Star+"\">"+String4Star+"</div>\r\n" + 
						"											</div>\r\n" + 
						"										</div>\r\n" + 
						"									</div>\r\n" + 
						"\r\n" + 
						"									<div class=\"row\">\r\n" + 
						"										<div class=\"col-md-2\">\r\n" + 
						"											<span class=\"5star\">3 sao</span>\r\n" + 
						"										</div>\r\n" + 
						"										<div class=\"col-md-10\">\r\n" + 
						"											<div class=\"progress\">\r\n" + 
						"												<div class=\"progress-bar progress-bar-success\"\r\n" + 
						"													role=\"progressbar\" aria-valuenow=\"40\" aria-valuemin=\"0\"\r\n" + 
						"													aria-valuemax=\"100\" style=\"width: "+String3Star+"\">"+String3Star+"</div>\r\n" + 
						"											</div>\r\n" + 
						"										</div>\r\n" + 
						"									</div>\r\n" + 
						"\r\n" + 
						"									<div class=\"row\">\r\n" + 
						"										<div class=\"col-md-2\">\r\n" + 
						"											<span class=\"5star\">2 sao</span>\r\n" + 
						"										</div>\r\n" + 
						"										<div class=\"col-md-10\">\r\n" + 
						"											<div class=\"progress\">\r\n" + 
						"												<div class=\"progress-bar progress-bar-success\"\r\n" + 
						"													role=\"progressbar\" aria-valuenow=\"40\" aria-valuemin=\"0\"\r\n" + 
						"													aria-valuemax=\"100\" style=\"width: "+String2Star+"\">"+String2Star+"</div>\r\n" + 
						"											</div>\r\n" + 
						"										</div>\r\n" + 
						"									</div>\r\n" + 
						"\r\n" + 
						"									<div class=\"row\">\r\n" + 
						"										<div class=\"col-md-2\">\r\n" + 
						"											<span class=\"5star\">1 sao</span>\r\n" + 
						"										</div>\r\n" + 
						"										<div class=\"col-md-10\">\r\n" + 
						"											<div class=\"progress\">\r\n" + 
						"												<div class=\"progress-bar progress-bar-success\"\r\n" + 
						"													role=\"progressbar\" aria-valuenow=\"40\" aria-valuemin=\"0\"\r\n" + 
						"													aria-valuemax=\"100\" style=\"width: "+String1Star+"\">"+String1Star+"</div>\r\n" + 
						"											</div>\r\n" + 
						"										</div>\r\n" + 
						"									</div>\r\n" + 
						"								</div>\r\n" + 
						"								<div class=\"col-md-3 text-center\">\r\n" + 
						"									<p>Viết nhận xét của bạn</p>\r\n" + 

						"											<button type=\"button\" class=\"btn btn-info\"\r\n" + 
						"												data-toggle=\"collapse\" data-target=\"#comment\">Viết\r\n" + 
						"												nhận xét</button>\r\n" + 

						"\r\n" + 
						"								</div>\r\n" + 
						"							</div>\r\n" + 
						"							<p id=\"demo\" style=\"color: red;\"></p>\r\n" + 
						"							<div id=\"comment\" class=\"collapse\">\r\n" + 
						"								<form action=\"CommentWithoutBuy\" method=\"post\">\r\n" + 
						"									<div class=\"row\">\r\n" + 
						"										<div class=\"col-md-12\">\r\n" + 
						"											<div class=\"form-group\">\r\n" + 
						"												<label for=\"stars\">1.Đánh giá sản phẩm</label>\r\n" + 
						"												<div class=\"stars\" id=\"stars\" class=\"form-control\">\r\n" + 
						"													<input class=\"star star-5\" id=\"star-5\" type=\"radio\"\r\n" + 
						"														name=\"star\" value=\"5\" /> <label class=\"star star-5\"\r\n" + 
						"														for=\"star-5\"></label> <input class=\"star star-4\"\r\n" + 
						"														id=\"star-4\" type=\"radio\" name=\"star\" value=\"4\" /> <label\r\n" + 
						"														class=\"star star-4\" for=\"star-4\"></label> <input\r\n" + 
						"														class=\"star star-3\" id=\"star-3\" type=\"radio\" name=\"star\"\r\n" + 
						"														value=\"3\" /> <label class=\"star star-3\" for=\"star-3\"></label>\r\n" + 
						"													<input class=\"star star-2\" id=\"star-2\" type=\"radio\"\r\n" + 
						"														name=\"star\" value=\"2\" /> <label class=\"star star-2\"\r\n" + 
						"														for=\"star-2\"></label> <input class=\"star star-1\"\r\n" + 
						"														id=\"star-1\" type=\"radio\" name=\"star\" value=\"1\" /> <label\r\n" + 
						"														class=\"star star-1\" for=\"star-1\"></label>\r\n" + 
						"												</div>\r\n" + 
						"											</div>\r\n" + 
						"										</div>\r\n" + 
						"										<div class=\"col-md-12\">\r\n" + 
						"											<div class=\"form-group\">\r\n" + 
						"												<label for=\"title\">2.Tiêu đề của nhận xét</label> <input\r\n" + 
						"													id=\"title\" name=\"title\" type=\"text\" value=\"\"\r\n" + 
						"													class=\"form-control\">\r\n" + 
						"											</div>\r\n" + 
						"										</div>\r\n" + 
						"										<div class=\"col-md-12\">\r\n" + 
						"											<div class=\"form-group\">\r\n" + 
						"												<label for=\"content\">3.Nội dung nhận xét sản phẩm</label>\r\n" + 
						"												<textarea rows=\"5\" cols=\"\" id=\"contentzz\" name=\"content\"\r\n" + 
						"													class=\"form-control\"></textarea>\r\n" + 
						"\r\n" + 
						"											</div>\r\n" + 
						"										</div>\r\n" + 
						"									</div>\r\n" + 
						"									<!-- /.row-->\r\n" + 
						"\r\n" + 
						"									<div class=\"row\">\r\n" + 
						"										<div class=\"col-md-12 text-center\">\r\n" + 
						"											<button type=\"button\" class=\"btn btn-primary\"\r\n" + 
						"												name=\"productId\" value=\""+productId+"\" id=\"postComment\" onclick=\"myFunction()\">\r\n" + 
						"												<i class=\"fa fa-save\"></i> Gửi nhận xét\r\n" + 
						"											</button>\r\n" + 
						"										</div>\r\n" + 
						"									</div>\r\n" + 
						"								</form>\r\n" + 
						"								\r\n" + 
						"								\r\n" + 
						"<script >\r\n" + 
						"								function myFunction(){\r\n" + 
						"									var prdID = $(\"#postComment\").val();\r\n" + 
						"									var countStar = $(\"input[name='star']:checked\").val();\r\n" + 
						"									var title = $(\"#title\").val();\r\n" + 
						"									var content = $(\"#contentzz\").val();\r\n" + 
						"									\r\n" + 
						"									console.log(prdID);\r\n" + 
						"									console.log(countStar);\r\n" + 
						"									console.log(title);\r\n" + 
						"									console.log(content);\r\n" + 
						"									\r\n" + 
						"									$.get(\"Ajax/listComment?prdID=\"+prdID+\"&countStar=\"+countStar+\"&title=\"+title+\"&content=\"+content, function(data){\r\n" + 
						"										$(\"#details123\").html(data);\r\n" + 
						"									});\r\n" + 
						"								}\r\n" + 
						"								</script>"+
						"								\r\n" + 
						"								\r\n" + 
						"							</div>\r\n" + 
						"							<hr>\r\n" + 
						"\r\n" + 
						"							<div id=\"DivListComment\">");
				
				Collections.reverse(listCommentOfProduct);
				
				for (Comment cmt : listCommentOfProduct) {
					out.print("<div class=\"row\">\r\n" + 
							"									<div class=\"col-md-3 text-center\">\r\n" + 
							"										<p>\r\n" + 
							"											<img src=\"img/"+cmt.getUserComment().getAvatar()+"\"\r\n" + 
							"												alt=\"ảnh đại diện\" style=\"width: 80px; height: 80px;\"\r\n" + 
							"												class=\"rounded-circle img-fluid\">\r\n" + 
							"										</p>\r\n" + 
							"										<p>\r\n" + 
							"											<strong>"+cmt.getUserComment().getName()+"</strong>\r\n" + 
							"										</p>\r\n" + 
							"										<p>"+cmt.getUpdate_at()+"</p>\r\n" + 
							"									</div>\r\n" + 
							"									<div class=\"col-md-9\">\r\n" + 
							"										<p>số sao : "+cmt.getStar()+"</p>\r\n" + 
							"										<p>Tiêu đề : "+cmt.getTitle()+"</p>\r\n" + 
							"										<p>Nội dung nhận xét:"+cmt.getContent()+"</p>\r\n" + 
							"									</div>\r\n" + 
							"								</div>\r\n" + 
							"								<hr>");
					
					
					System.out.println(cmt.getUserComment().getName());
					
				}
				
				
				out.print("</div>");
				
				
				
			} catch (SQLException e) {
				response.sendRedirect("View/User/404.jsp");
				e.printStackTrace();
			}
	
		} else {
			
		}
		
		
		
	}
}