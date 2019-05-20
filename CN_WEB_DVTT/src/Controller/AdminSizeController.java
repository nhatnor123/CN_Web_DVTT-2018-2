package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ProductDAO;
import DAO.SizeDAO;
import Model.Size;
import Model.User;

/**
 * Servlet implementation class AdminSizeController
 */
@WebServlet("/sizemanage")
public class AdminSizeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminSizeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			request.setCharacterEncoding("utf-8");
			Size size = new Size();
			size.setId(Integer.parseInt(request.getParameter("id")));
			size.setProductId(Integer.parseInt(request.getParameter("prID")));
			size.setSize(request.getParameter("size"));
			size.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			String mes = "";
			if (size.getId() == 0) {
				if (new SizeDAO().insert(size)) {
					mes = "Thêm Size thành công";
				} else
					mes = "Thêm Size thất bại";
				request.setAttribute("mes", mes);
			} else {
				if (new SizeDAO().update(size)) {
					mes = "Cập nhật Size thành công";
				} else
					mes = "Cập nhật Size thất bại";
			}
			request.setAttribute("list", new ProductDAO().getListProduct());
			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/ListProduct.jsp");
			rd.forward(request, response);
		
	}

}
