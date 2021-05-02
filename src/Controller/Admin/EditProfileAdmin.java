package Controller.Admin;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.MyUser;
import DAO.OrtherDAO;
import DB.DBConnection;
import SessionUtils.SessionUtil;

@WebServlet("/admin/editprofile")
public class EditProfileAdmin extends HttpServlet {
	
	private OrtherDAO dao;
	
	private static final long serialVersionUID = 1L;
       
    public EditProfileAdmin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getCharacterEncoding()==null) {
			request.setCharacterEncoding("UTF-8");
		}
		
		Connection conn = DBConnection.creatConnection();
		String name = request.getParameter("fullName");
		String phone =request.getParameter("phone");
		String address = request.getParameter("address");
		MyUser myUser = new MyUser();
		myUser.setFullName(name);
		myUser.setAddress(address);
		myUser.setPhone(phone);
		MyUser myUser_temp =(MyUser) SessionUtil.getInstance().getValue(request, "USERMODEL");
		myUser.setId(myUser_temp.getId());
		String mess = "";
		if(dao.updateProfileAdmin(conn, myUser)!=0)
		{
			mess+="Success";
		}
		else 
		{
			mess+="Failed";
		}
		request.setAttribute("mess", mess);
		RequestDispatcher rd = request.getRequestDispatcher("/admin/profile");
		rd.forward(request, response);
	}

}
