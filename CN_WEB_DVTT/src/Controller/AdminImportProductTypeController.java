package Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DAO.ProductDAO;
import Model.Product;
import Model.ProductColor;

/**
 * Servlet implementation class AdminImportProductType
 */
@WebServlet("/Admin/AdminImportProductTypeController")
public class AdminImportProductTypeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String SAVE_DIRECTORY = "imageProduct";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminImportProductTypeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		request.setAttribute("product_id", product_id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("importProduct.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		ProductColor prColor = new ProductColor();

//		try {
//	           // Đường dẫn tuyệt đối tới thư mục gốc của web app.
//	           String appPath = request.getServletContext().getRealPath("");
//	           appPath = appPath.replace('\\', '/');
//	 
//	  
//	           // Thư mục để save file tải lên.
//	           String fullSavePath = null;
//	           if (appPath.endsWith("/")) {
//	               fullSavePath = appPath + SAVE_DIRECTORY;
//	           } else {
//	               fullSavePath = appPath + "/" + SAVE_DIRECTORY;
//	           }
//	 
//	  
//	           // Tạo thư mục nếu nó không tồn tại.
//	           File fileSaveDir = new File(fullSavePath);
//	           if (!fileSaveDir.exists()) {
//	               fileSaveDir.mkdir();
//	           }
//	  
//	           // Danh mục các phần đã upload lên (Có thể là nhiều file).
//	           for (Part part : request.getParts()) {
//	               String fileName = extractFileName(part);
//	               if (fileName != null && fileName.length() > 0) {
//	                   String filePath = fullSavePath + File.separator + fileName;
//	                   System.out.println("Write attachment to file: " + filePath);
//	  
//	                   prColor.setImage(fileName);
//	                   part.write(filePath);
//	               }
//	           }
//	       } catch (Exception e) {
//	           e.printStackTrace();
//	       }
		
		
		String size = request.getParameter("size");
		System.out.println(size);
		String color = request.getParameter("color");
		System.out.println(color);
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		System.out.println(quantity);
		int product_id = Integer.parseInt(request.getParameter("prId"));
		System.out.println(product_id);
		prColor.setColor(color);
		prColor.setQuantity(quantity);
		prColor.setSize(size);
		prColor.setProduct_id(product_id);
		
		int productColor_id = productDAO.addColorProduct(prColor);
		if(productDAO.importQuantityProductSize(prColor, productColor_id)) {
			System.out.println("thành công");
			ArrayList<ProductColor> listProductColor_Size = productDAO.getListProductInWarehouse(product_id);
			request.setAttribute("listColor_Size", listProductColor_Size);
			RequestDispatcher dispatcher = request.getRequestDispatcher("importProduct.jsp");
			dispatcher.forward(request, response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("404.jsp");
			dispatcher.forward(request, response);
		}
		
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
