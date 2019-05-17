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

@WebServlet("/CustomerAccount")
public class CustomerAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CustomerAccountController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		User u = (User) session.getAttribute("user");
		if (u != null) {
			if (action.equals("viewInfo")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("View/User/customer-account.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String change_account = request.getParameter("change_account");
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		UserDAO userDAO = new UserDAO();
		if (u != null) {
			// thay đổi mật khẩu
			if (change_account.equals("change_password")) {

				String password_old = MD5.encryption(request.getParameter("password_old"));
				String password_new = request.getParameter("password_new");
				String confrimPassword_new = request.getParameter("confrimPassword_new");

				String checkOldPassord_err = "", checkConfrimPassword = "";

				if (password_old.equals("")) {
					checkOldPassord_err = "Vui lòng nhập mật khẩu hiện tại của bạn!";
				}
				if (checkOldPassord_err.length() > 0) {
					request.setAttribute("echeckOldPassord_err", checkOldPassord_err);
				}

				if (password_new.equals("") || confrimPassword_new.equals("")) {
					checkConfrimPassword = "Vui lòng nhập mật khẩu mới và kiểm tra mật khẩu mới!";
				}
				if (checkConfrimPassword.length() > 0) {
					request.setAttribute("checkConfrimPassword", checkConfrimPassword);
				}

				if ((checkOldPassord_err.length() > 0) || (checkConfrimPassword.length() > 0)) {
					request.setAttribute("message", "Hãy kiểm tra lại các thông tin");
				} else {
					if (password_old.equals(u.getPassword())) {
						if (confrimPassword_new.equals(password_new)) {
							try {
								if (userDAO.updatePassword(MD5.encryption(password_new), u.getEmail())) {
									request.setAttribute("message", "thay đổi mật khẩu thành công!");
								}

							} catch (SQLException e) {
								e.printStackTrace();
							}
						} else {
							checkConfrimPassword = "Mật khẩu nhậu lại sai";
							request.setAttribute("checkConfrimPassword", checkConfrimPassword);
						}
					} else {
						checkOldPassord_err = "Mật khẩu cũ không đúng, vui lòng kiểm tra lại!";
						request.setAttribute("checkOldPassord_err", checkOldPassord_err);
					}
				}

			}

			// thay đổi thông tin khác
			if (change_account.equals("change_ortherInfo")) {

				String name = request.getParameter("name");
				String avatar = request.getParameter("avatar");
				String phone = request.getParameter("phone");
				String address = request.getParameter("address");
				System.out.println(u.getEmail());

				u.setName(name);
				u.setAvatar(avatar);
				u.setPhone(phone);
				u.setAddress(address);

				System.out.println(u.getEmail());

				String checkUpdateOtherInfo_err = "";
				if (userDAO.updateOtherInfo(u) == true) {
					session.setAttribute("user", u);
					request.setAttribute("messageInfo", "thay đổi thông tin thành công!");
				} else {
					checkUpdateOtherInfo_err = "đã có lỗi";
					request.setAttribute("checkUpdateOtherInfo_err", checkUpdateOtherInfo_err);
				}
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("View/User/customer-account.jsp");
		dispatcher.forward(request, response);

	}

}
