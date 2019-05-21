package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDAO;
import Model.User;
import Tools.MD5;

@WebServlet("/Register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String register = request.getParameter("register");
		if(register.equals("yes")){
//			response.sendRedirect("View/User/register.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("View/User/register.jsp");
			dispatcher.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(password);
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		String name_err = "", email_err = "", password_err = "", address_err = "", phone_err = "";
		if(name.equals("")) {
			name_err = "Vui lòng nhập họ tên của bạn!";
		}
		if(name_err.length() > 0) {
			request.setAttribute("name_err", name_err);
		}
		
		if(email.equals("")) {
			email_err = "Vui lòng nhập email của bạn!";
		}
		if(email_err.length() > 0) {
			request.setAttribute("email_err", email_err);
		}
		
		if(password.equals("")) {
			password_err = "Vui lòng nhập mật khẩu của bạn!";
		}
		if(password_err.length() > 0) {
			request.setAttribute("password_err", password_err);
		}
		
		if(address.equals("")) {
			address_err = "Vui lòng nhập địa chỉ của bạn!";
		}
		if(address_err.length() > 0) {
			request.setAttribute("address_err", address_err);
		}
		
		if(phone.equals("")) {
			phone_err = "Vui lòng nhập SĐT của bạn!";
		}
		if(phone_err.length() > 0) {
			request.setAttribute("phone_err", phone_err);
		}
		
		
		String url = "";
		if((name_err.length() > 0) || (email_err.length() > 0) || (password_err.length() > 0) || (address_err.length() > 0) || (phone_err.length() > 0)) {
			url = "register.jsp";
		}else {
			UserDAO userDAO = new UserDAO();
			try {
				if(userDAO.checkEmail(email)) {
					email_err = "Email đã tồn tại, vui lòng nhập email khác!";
					request.setAttribute("email_err", email_err);
					url = "View/User/register.jsp";
				}else {
					User user = new User(0, name, email, MD5.encryption(password), 1,address, "", phone);
					userDAO.insertUser(user);
					HttpSession session = request.getSession();
					if(session.getAttribute("user") == null) {
						session.setAttribute("user", user);
					}
					url = "View/User/index.jsp";
				}
			} catch (SQLException e) {
				response.sendRedirect("/CN_WEB_DVTT/View/User/404.jsp");
				e.printStackTrace();
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
