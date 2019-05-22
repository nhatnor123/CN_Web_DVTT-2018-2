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

@WebServlet("/adminlogin")
public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminLoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		RequestDispatcher dispatcher = request.getRequestDispatcher("View/Admin/Login.jsp");
		dispatcher.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		String email_login_err = "", password_login_err = "", login_err = "";
		if (email.equals("")) {
			email_login_err = "Vui lòng nhập email của bạn!";
		}
		if (email_login_err.length() > 0) {
			request.setAttribute("email_login_err", email_login_err);
		}

		if (password.equals("")) {
			password_login_err = "Vui lòng nhập mật khẩu của bạn!";
		}
		if (password_login_err.length() > 0) {
			request.setAttribute("password_login_err", password_login_err);
		}


		String url = "";

		if ((email_login_err.length() > 0) || (password_login_err.length() > 0)) {
			url = "View/Admin/Login.jsp";
		} else {
			UserDAO userDAO = new UserDAO();
			try {
				
				if (userDAO.isAdmin(email, MD5.encryption(password))) {
					User user = userDAO.getUserbyEmail(email);
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					RequestDispatcher dispatcher = request.getRequestDispatcher("View/Admin/Home.jsp");
					dispatcher.forward(request, response);

				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher("View/Admin/Login.jsp");
					dispatcher.forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				response.sendRedirect("/CN_WEB_DVTT/User/404.jsp");
			}
		}
		
	}

}
