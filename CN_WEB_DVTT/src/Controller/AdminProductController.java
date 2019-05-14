package Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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

//import org.apache.commons.fileupload.disk.DiskFileItemFactory;

import DAO.ProductDAO;
import Model.Product;

/**
 * Servlet implementation class AdminProductController
 */
@WebServlet("/Admin/AdminProductController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AdminProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String UPDATE_INSERT = "Product.jsp";
	private static String IMPORT_QUANTITY = "importProduct.jsp";
	private static String LIST = "ListProduct.jsp";
	public static final String SAVE_DIRECTORY = "uploadDir";
	private static final String UPLOAD_DIR = "imageProduct";
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
			if (action.equalsIgnoreCase("edit")) {
				path = UPDATE_INSERT;
				int id = Integer.parseInt(request.getParameter("prId"));

				try {
					request.setAttribute("product", new ProductDAO().getProductById(id));
				} catch (SQLException e) {
					e.printStackTrace();
				}
				

			}if (action.equalsIgnoreCase("importProduct")) {
				path = IMPORT_QUANTITY;
				
			}else if (action.equalsIgnoreCase("insert")) {
				path = UPDATE_INSERT;
			}
		} else {
			path = LIST;
			List<Product> list = new ArrayList<Product>();
			list = new ProductDAO().getListProduct();
			request.setAttribute("list", list);
		}
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}


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
			pr.setColor(request.getParameter("color"));
			pr.setSize(request.getParameter("size"));
			String id = request.getParameter("id");
			if (id == null || id.isEmpty()) {
				if (new ProductDAO().addProduct(pr)) {
					mes = "Thêm sản phẩm thành công";
					request.setAttribute("mes", mes);
				}
				
			} else {
				
				pr.setId(Integer.parseInt(id));
				if (new ProductDAO().update(pr)) {
					mes = "Cập nhật sản phẩm thành công";
					request.setAttribute("mes", mes);
				}
				
			}
			request.setAttribute("list",new ProductDAO().getListProduct());
			RequestDispatcher rd = request.getRequestDispatcher("ListProduct.jsp");
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
	   
//	   private String uploadFile(HttpServletRequest request, String anh) throws IOException, ServletException {
//			String fileName = "";
//			try {
//
//				DiskFileItemFactory factory = new DiskFileItemFactory();
//
//				factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
//
//				Part filePart = request.getPart(anh);
//
//				fileName = (String) getFileName(filePart);
//
//				String applicationPath = getServletContext().getRealPath("");
//
//				// File.separator: \
//				String basePath = applicationPath + File.separator + UPLOAD_DIR + File.separator;
//
//				File uploadDir = new File(basePath);
//				if (!uploadDir.exists()) {
//					uploadDir.mkdir();
//				}
//
//				InputStream inputStream = null;
//				OutputStream outputStream = null;
//				try {
//					File outputFilePath = new File(basePath + fileName);
//					inputStream = filePart.getInputStream();
//					outputStream = new FileOutputStream(outputFilePath);
//					int read = 0;
//					final byte[] bytes = new byte[1024];
//					while ((read = inputStream.read(bytes)) != -1) {
//						outputStream.write(bytes, 0, read);
//					}
//				} catch (Exception e) {
//					e.printStackTrace();
//					fileName = "";
//				} finally {
//					if (inputStream != null) {
//						inputStream.close();
//					}
//					if (outputStream != null) {
//						outputStream.close();
//					}
//				}
//			} catch (Exception e) {
//				fileName = "";
//			}
//			return fileName;
//		}
//
//		private String getFileName(Part part) {
//			final String partHeader = part.getHeader("content-disposition");
//			System.out.println("*****partHeader :" + partHeader);
//			for (String content : part.getHeader("content-disposition").split(";")) {
//				if (content.trim().startsWith("filename")) {
//					return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
//				}
//			}
//			return null;
//		}
		
	

}
