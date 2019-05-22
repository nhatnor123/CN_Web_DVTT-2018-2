package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

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


	public AdminSizeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			request.setCharacterEncoding("utf-8");
			SizeDAO sizeDAO = new SizeDAO();
			ArrayList<Size> listSize = new ArrayList<Size>();
			Size size = new Size();
			
//			size.setId(Integer.parseInt(request.getParameter("id")));
//			size.setProductId();
			int prID = Integer.parseInt(request.getParameter("prID"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			String sizeName = request.getParameter("sizeName");
			System.out.println(sizeName);
			listSize = new SizeDAO().getSizeByPrId(prID);
			boolean checkSizeOld = false;
			String mes = "";
			for(Size s : listSize) {
				if(s.getSize().equals(sizeName)) {
					System.out.println(sizeName);
					try {
						int old_quantitySize;
						old_quantitySize = sizeDAO.getQuantityBySize(s.getId());
						s.setQuantity(old_quantitySize + quantity);
						size = s;
						checkSizeOld = true;
					} catch (SQLException e) {
						e.printStackTrace();
					}
					if (new SizeDAO().importQuantityBySize(size)) {
						mes = "Thêm vào kho thành công";
					} else {
						mes = "Thêm vào kho thất bại";
					}
					request.setAttribute("mes", mes);
					break;
				}
			}
			
			if (!checkSizeOld) {
				size.setSize(sizeName);
				size.setProductId(prID);
				size.setQuantity(quantity);
				if (new SizeDAO().insert(size)) {
					mes = "Thêm Size thành công";
				} else
					mes = "Thêm Size thất bại";
				request.setAttribute("mes", mes);
			}
//			size.setSize(request.getParameter("size"));
//			size.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			
			
//			if (size.getId() == 0) {
				
				
//			} else {
//				if (new SizeDAO().update(size)) {
//					mes = "Cập nhật Size thành công";
//				} else
//					mes = "Cập nhật Size thất bại";
//			}
			request.setAttribute("list", new ProductDAO().getListProduct());
			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/ListProduct.jsp");
			rd.forward(request, response);
		
	}

}
