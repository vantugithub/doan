package Controller.Admin;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import BEAN.Product;
import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/admin/addimages")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class AddMutilImages extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO dao;
    
    public AddMutilImages() {
        super();
    }

	
	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn  = DB.DBConnection.creatConnection();
		String id = request.getParameter("id");
		Product product = dao.findProductByIdd(conn, Long.parseLong(id));
		request.setAttribute("product", product);
		
		RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/MuiltiImage.jsp");
		rd.forward(request, response);
	}

	
	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idOfProductStr = request.getParameter("id");
		//System.out.println(idOfProductStr);
		String all_name = "";
		try {
			   Connection conn = DBConnection.creatConnection();
			   long id = Long.parseLong(idOfProductStr);
	           String appPath = request.getServletContext().getRealPath("/image");
	         //  System.out.println(appPath);
	           for (Part part : request.getParts()) {
	        	   String fileName = extractFileName(part);
	        	 //  System.out.println(fileName);
	               if (fileName != null && fileName.length() > 0) {
	                   String filePath = appPath + File.separator + fileName;
	                   all_name+=(fileName+";");
	                 //  System.out.println("Write attachment to file: " + filePath);
	                   part.write(filePath);
	               }
	           }
	          // System.out.println(all_name);
	           int check = dao.insertAllNameImages(conn, id, all_name);
	           response.sendRedirect(request.getContextPath()+"/admin/addimages?id="+idOfProductStr);
	       } catch (Exception e) {
	           e.printStackTrace();
	           request.setAttribute("errorMessage", "Error: " + e.getMessage());
	           response.sendRedirect(request.getContextPath()+"/admin/addimages?id="+idOfProductStr);
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
