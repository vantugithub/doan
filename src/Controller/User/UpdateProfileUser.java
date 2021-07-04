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
import SessionUtils.SessionUtil;

@WebServlet("/profile/update")
public class UpdateProfileUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserDAO dao;
	
    public UpdateProfileUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding()==null) {
			request.setCharacterEncoding("UTF-8");
		}
		
		Connection conn = DB.DBConnection.creatConnection();
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String fullName = request.getParameter("fullname");
		MyUser myUser_temp = (MyUser) SessionUtil.getInstance().getValue(request, "USERMODEL");
		myUser_temp.setFullName(fullName);
		myUser_temp.setPhone(phone);
		myUser_temp.setAddress(address);
		MyUser myUser = new MyUser();
		myUser.setAddress(address);
		myUser.setPhone(phone);
		myUser.setFullName(fullName);
		myUser.setId(myUser_temp.getId());
		int i = dao.updateProfileOfUser(conn, myUser);
		SessionUtil.getInstance().putValue(request, "USERMODEL" , myUser_temp);
		if(i==1) {
			request.setAttribute("message", "success");
		}
		request.setAttribute("myUser", myUser_temp);
		RequestDispatcher rd = request.getRequestDispatcher("/View/Web/UpdateInfoUser.jsp");
		rd.forward(request, response);
	}

}
