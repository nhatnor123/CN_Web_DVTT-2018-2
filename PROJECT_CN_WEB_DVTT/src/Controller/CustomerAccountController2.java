package Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;

import DAO.UserDAO;
import Model.User;
import Tools.MD5;

@WebServlet("/CustomerAccount2")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class CustomerAccountController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String SAVE_DIRECTORY = "template/user/img";

	public CustomerAccountController2() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String change_account = request.getParameter("change_account");
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		UserDAO userDAO = new UserDAO();
		if (u != null) {
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			
			u.setName(name);
			u.setPhone(phone);
			u.setAddress(address);
			
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
						if(fileName != null)
						u.setAvatar(fileName);
						part.write(filePath);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			

			if (userDAO.updateOtherInfo(u) == true) {
				session.setAttribute("user", u);
				request.setAttribute("messageInfo", "thay đổi thông tin thành công!");
			} else {
				request.setAttribute("checkUpdateOtherInfo_err", "Đã có lỗi");
			}
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("View/User/customer-account.jsp");
		dispatcher.forward(request, response);

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