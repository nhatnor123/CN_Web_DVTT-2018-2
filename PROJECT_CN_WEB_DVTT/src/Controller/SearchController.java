package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.ProductDAO;
import Model.Product;

@WebServlet("/ajax/search")
public class SearchController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
//		resp.setHeader("Content-Language", "vn");
		String str = req.getParameter("str");
		System.out.println(str);
		ProductDAO productDAO = new ProductDAO();
		ArrayList<Product> listPrd ;
		try {
			listPrd = productDAO.searchProduct(str);
		} catch (SQLException e) {
			listPrd = null;
			e.printStackTrace();
		}
		if (listPrd != null) {
			int count = 0;
			for (Product product : listPrd) {
				System.out.println(product.getName());
				out.print(" <a style='text-align:left;'  href='productController?product_id="+product.getId()+"' class=\"list-group-item list-group-item-action  list-group-item-light\">"+product.getName()+" - "+product.getPrice()+" VND</a>");
				System.out.println(product.getName());
				count++;
				if (count == 6) {
					break;
				}
			}
		}
//		Gson gson = (new GsonBuilder()).create();
//		String result = gson.toJson(listPrd);
//		out.print(result);

	}
}