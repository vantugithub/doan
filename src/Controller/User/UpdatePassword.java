package Controller.User;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.MyUser;
import DAO.UserDAO;
import Service.DecodeAndDecrypt;
import SessionUtils.SessionUtil;

@WebServlet("/profile/changepass")
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserDAO dao;
	
    public UpdatePassword() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mess = "";
		String oldPassword =  request.getParameter("currentpassword");
		String newPassword = request.getParameter("newpassword");
		Connection conn = DB.DBConnection.creatConnection();
		MyUser myUser = (MyUser) SessionUtil.getInstance().getValue(request, "USERMODEL");
	
		if( DecodeAndDecrypt.hashPassword(oldPassword).equals(myUser.getPassword()) ) 
		{
			myUser.setPassword(DecodeAndDecrypt.hashPassword(newPassword));
			SessionUtil.getInstance().putValue(request, "USERMODEL" , myUser);
			if( dao.updatePasswordOfUser(conn, myUser) > 0 ) 
			{
				mess+="success";
			}
			else 
			{
				mess+="failed";
			}
		}
		request.setAttribute("message", mess);
		RequestDispatcher rd = request.getRequestDispatcher("/View/Web/message.jsp");
		rd.forward(request, response);
	}

}
