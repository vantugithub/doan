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

@WebServlet("/admin/UpdateActiveOfUser")
public class UpdateActiveOfUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserDAO dao;
	
    public UpdateActiveOfUser() {
        super();
    }

	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		String status = request.getParameter("active");
		int id = Integer.parseInt(idStr);
		Connection conn = DBConnection.creatConnection();
		if(status.equals("true"))
		{
			dao.updateStatusOfUser(conn, id, false);
		}
		else 
		{
			dao.updateStatusOfUser(conn, id, true);
		}
		
		response.sendRedirect(request.getContextPath()+"/admin/user?id="+idStr);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
