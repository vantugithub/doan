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

@WebServlet("/profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserDAO dao;
	
    public Profile() {
        super();
    }
    
	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding()==null) {
			request.setCharacterEncoding("UTF-8");
		}
		
		Connection conn = DB.DBConnection.creatConnection();
		MyUser myUser_temp =(MyUser) SessionUtil.getInstance().getValue(request, "USERMODEL");
		MyUser myUser = dao.getProfileUser(conn, myUser_temp.getId());
		request.setAttribute("myUser", myUser);
		RequestDispatcher rd = request.getRequestDispatcher("/View/Web/ProfileUser.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
