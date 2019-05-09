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

import com.google.gson.*;

import DAO.ProductDAO;
import Model.Product;

@WebServlet("/User/ajax/search")
public class SearchController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = resp.getWriter();
		resp.setCharacterEncoding("UTF-8");
		String str = req.getParameter("str");
		System.out.println(str);
		ProductDAO dao = new ProductDAO();
		ArrayList<Product> listPrd ;
		try {
			listPrd = dao.searchProduct(str);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			listPrd = null;
			e.printStackTrace();
		}

		if (listPrd != null) {
			int count = 0;
			for (Product product : listPrd) {
				
				out.print(" <a style='text-align:left;'  href='/CN_WEB_DVTT/User/ProductController?product_id="+product.getId()+"' class=\"list-group-item list-group-item-action  list-group-item-light\">"+product.getName()+" - "+product.getPrice()+" đồng</a>");
				
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

	public static void main(String[] args) {
		Gson gsonBuilder = new GsonBuilder().create();
		// Convert Java Array into JSON
		ArrayList<String> languagesArrayList = new ArrayList();
		languagesArrayList.add("Russian");
		languagesArrayList.add("English");
		languagesArrayList.add("French");
		String jsonFromJavaArrayList = gsonBuilder.toJson(languagesArrayList);
		System.out.println(jsonFromJavaArrayList);
		System.out.println(languagesArrayList);
	}
}
