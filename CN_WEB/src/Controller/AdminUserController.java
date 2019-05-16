package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ProductDAO;
import DAO.UserDAO;
import Model.Product;
import Model.User;

/**
 * Servlet implementation class AdminUserController
 */
@WebServlet("/usermanage")
public class AdminUserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String LIST = "View/Admin/ListUser.jsp";
	private final String UPDATE = "View/Admin/User.jsp";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminUserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null && (user.getLevel() == 3)) {
		request.setCharacterEncoding("utf-8");
		String path = "";
		String action = "";
		if (request.getParameter("action") != null) {
			action = request.getParameter("action");
		}
		if (action.equalsIgnoreCase("edit")) {
			path = UPDATE;
			int id = Integer.parseInt(request.getParameter("id"));

			try {
				request.setAttribute("user", new UserDAO().getUserbyId(id));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			path = LIST;
			List<User> list = new ArrayList<User>();
			try {
				list = new UserDAO().getListUser();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("list", list);
		}
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/Login.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		User user = new User();
		
		String level = request.getParameter("level");
		int lev = 1;
		if(level.equalsIgnoreCase("Thành viên")) {
			lev = 1;
		}
		else if(level.equalsIgnoreCase("Nhân viên")) {
			lev = 2;
		}
		else if(level.equalsIgnoreCase("Admin")) {
			lev = 3;
		}
		user.setId(Integer.parseInt(request.getParameter("id")));
		user.setLevel(lev);
		String mes = "";
		if (new UserDAO().updateLevel(user)) {
			mes = "Thay đổi thành công";
		} else {
			mes = "Thay đổi thất bại";
		}
		request.setAttribute("mes", mes);

		try {
			request.setAttribute("list", new UserDAO().getListUser());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/ListUser.jsp");
		rd.forward(request, response);
	}

}
