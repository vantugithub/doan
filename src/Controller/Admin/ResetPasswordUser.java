package Controller.Admin;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import DB.DBConnection;

@WebServlet("/admin/resetpassword")
public class ResetPasswordUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserDAO dao;
	
    public ResetPasswordUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String passWord1 = request.getParameter("newPassword1");
		String passWord2 = request.getParameter("newPassword2");
		String idUser = request.getParameter("id");
		String mess = "";
		Connection conn = DBConnection.creatConnection();
		if( passWord1.equals(passWord2) ) 
		{
			if( dao.resetPasswordOfUser(conn, Integer.parseInt(idUser), passWord2) > 0 ) 
			{
				mess+="Success";
			}
			else 
			{
				mess+="Failed";
			}
		}
		request.setAttribute("mess", mess);
		request.setAttribute("id", idUser);
		RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/Message.jsp");
		rd.forward(request, response);
		
	}

}
