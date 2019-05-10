package Controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DAO.ProductDAO;
import Model.Product;

/**
 * Servlet implementation class AdminProductController
 */
@WebServlet("/AdminProductController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String UPDATE_INSERT = "View/Admin/Product.jsp";
	private static String LIST = "View/Admin/ListProduct.jsp";
	public static final String SAVE_DIRECTORY = "uploadDir";
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminProductController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String path = "";
		String action = "";
		if (request.getParameter("action") != null) {
			action = request.getParameter("action");
		}
		if (action.equalsIgnoreCase("edit")) {
			path = UPDATE_INSERT;
			int id = Integer.parseInt(request.getParameter("prId"));

			try {
				request.setAttribute("product", new ProductDAO().getProductById(id));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			

		} else if (action.equalsIgnoreCase("insert")) {
			path = UPDATE_INSERT;
		} else if (action.equalsIgnoreCase("remove")) {
			path = LIST;
			int prID = Integer.parseInt(request.getParameter("prId"));
			new ProductDAO().deleteProduct(prID);
			request.setAttribute("list", new ProductDAO().getListProduct());
		} else {
			path = LIST;
			List<Product> list = new ArrayList<Product>();
			list = new ProductDAO().getListProduct();
			request.setAttribute("list", list);
		}
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 Product pr = new Product();
		 try {
	          
	 
	  
	           // Đường dẫn tuyệt đối tới thư mục gốc của web app.
	           String appPath = request.getServletContext().getRealPath("");
	           appPath = appPath.replace('\\', '/');
	 
	  
	           // Thư mục để save file tải lên.
	           String fullSavePath = null;
	           if (appPath.endsWith("/")) {
	               fullSavePath = appPath + SAVE_DIRECTORY;
	           } else {
	               fullSavePath = appPath + "/" + SAVE_DIRECTORY;
	           }
	 
	  
	           // Tạo thư mục nếu nó không tồn tại.
	           File fileSaveDir = new File(fullSavePath);
	           if (!fileSaveDir.exists()) {
	               fileSaveDir.mkdir();
	           }
	  
	           // Danh mục các phần đã upload lên (Có thể là nhiều file).
	           for (Part part : request.getParts()) {
	               String fileName = extractFileName(part);
	               if (fileName != null && fileName.length() > 0) {
	                   String filePath = fullSavePath + File.separator + fileName;
	                   System.out.println("Write attachment to file: " + filePath);
	  
	                   pr.setAvatar(fileName);
	                   part.write(filePath);
	               }
	           }
	       } catch (Exception e) {
	           e.printStackTrace();
	       }
		  
		 	String mes = "";
			pr.setName(request.getParameter("name"));
			pr.setDescription(request.getParameter("description"));
			pr.setPrice(Integer.parseInt(request.getParameter("price")));
			pr.setCategory_id(8);
			String id = request.getParameter("id");
			if (id == null || id.isEmpty()) {
				new ProductDAO().addProduct(pr);
				mes = "Thêm sản phẩm thành công";
				request.setAttribute("mes", mes);
			} else {
				mes = "Cập nhật sản phẩm thành công";
				pr.setId(Integer.parseInt(id));
				new ProductDAO().update(pr);
				request.setAttribute("mes", mes);
			}
			request.setAttribute("list",new ProductDAO().getListProduct());
			RequestDispatcher rd = request.getRequestDispatcher("View/Admin/ListProduct.jsp");
			rd.forward(request, response);
	   }
	 
	   private String extractFileName(Part part) {
	       String contentDisp = part.getHeader("content-disposition");
	       String[] items = contentDisp.split(";");
	       for (String s : items) {
	           if (s.trim().startsWith("filename")) {
	               String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
	               clientFileName = clientFileName.replace("\\", "/");
	               int i = clientFileName.lastIndexOf('/');
	               return clientFileName.substring(i + 1);
	           }
	       }
	       return null;
	   }
		
	

}
