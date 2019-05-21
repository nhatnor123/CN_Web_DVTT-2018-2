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

@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String logout = request.getParameter("logout");
		if (logout.equals("yes")) {
			HttpSession session = request.getSession();
			session.invalidate();
			RequestDispatcher dispatcher = request.getRequestDispatcher("View/User/index.jsp");
			dispatcher.forward(request, response);

		}
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
			password_login_err = "Vui lòng nhập mật khẩu cho tài khoản!";
		}
		if (password_login_err.length() > 0) {
			request.setAttribute("password_login_err", password_login_err);
		}

		String url = "";

		if ((email_login_err.length() > 0) || (password_login_err.length() > 0)) {
			url = "View/User/register.jsp";
		} else {
			UserDAO userDAO = new UserDAO();
			try {
				if (userDAO.checkLogin(email, MD5.encryption(password))) {
					User user = userDAO.getUserbyEmail(email);
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					url = "View/User/index.jsp";

				} else {
					login_err = "Email hoặc mật khẩu không đúng!";
					request.setAttribute("login_err", login_err);
					url = "View/User/register.jsp";
				}
			} catch (SQLException e) {
				e.printStackTrace();
				response.sendRedirect("/CN_WEB_DVTT/View/User/404.jsp");
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
