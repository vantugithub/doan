package Controller.Admin;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import DB.DBConnection;

@WebServlet("/admin/updateroleuser")
public class UpdateRoleOfUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserDAO dao;
	
    public UpdateRoleOfUser() {
        super();
    }

	@SuppressWarnings({ "static-access", "unused" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		String role = request.getParameter("role");
		Connection conn = DBConnection.creatConnection();
		String mess = "";
		if(dao.updateRoleOfUser(conn, Integer.parseInt(role), Integer.parseInt(idStr))>0) {
			mess+="Update Success";
		}else mess+= "Update Faild";
		response.sendRedirect(request.getContextPath()+"/admin/user?id="+idStr);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
