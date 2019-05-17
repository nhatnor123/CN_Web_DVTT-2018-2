package Controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import DAO.BannnerDAO;
import Model.Banner;
import Model.Product;
import Model.User;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
/**
 * Servlet implementation class AdminBannerController
 */
@WebServlet("/bannermanage")
public class AdminBannerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String SAVE_DIRECTORY = "img";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminBannerController() {
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
			String path = "View/Admin/ListBanner.jsp";
			request.setCharacterEncoding("utf-8");
			String action = "";
			String mes = "";
			if (request.getParameter("action") != null) {
				action = request.getParameter("action");
			}
			if (action.equalsIgnoreCase("remove")) {
				int id = Integer.parseInt(request.getParameter("banId"));
				if (new BannnerDAO().delete(id)) {
					mes = "Xóa thành công banner";
				} else
					mes = "Xóa banner thất bại";
				request.setAttribute("mes", mes);
			} else if (action.equalsIgnoreCase("insert")) {
				path = "View/Admin/Banner.jsp";
			}
			request.setAttribute("list", new BannnerDAO().getListBanner());
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("View/Admin/Login.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Banner ban = new Banner();
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
					ban.setImage(fileName);
					part.write(filePath);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		ban.setTitle(request.getParameter("title"));
		ban.setDescripton(request.getParameter("description"));
		String mes = "";
		if (new BannnerDAO().add(ban)) {
			mes = "Thêm banner thành công";
		} else
			mes = "Thêm banner thất bại";
		request.setAttribute("list", new BannnerDAO().getListBanner());
		request.setAttribute("mes", mes);
		RequestDispatcher rd = request.getRequestDispatcher("View/Admin/ListBanner.jsp");
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
