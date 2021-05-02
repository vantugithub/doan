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
import DAO.UserDAO;
import DB.DBConnection;

@WebServlet("/admin/user")
public class ProfileUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private OrtherDAO dao;
	private UserDAO userDao;
	
    public ProfileUser() {
        super();
    }

	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mess = (String) request.getAttribute("mess");
		String idStr = request.getParameter("id");
		if(idStr == null) {
			idStr = (String) request.getAttribute("id");
		}
		Connection conn = DBConnection.creatConnection();
		MyUser myuser = dao.getProfileAdmin(conn, Integer.parseInt(idStr));
		request.setAttribute("myUser", myuser);
		request.setAttribute("mess", mess);
		request.setAttribute("roleOfUser", userDao.roleOfUser(conn, Integer.parseInt(idStr)));
		request.setAttribute("listRole", userDao.getAllOfRoles(conn));
		RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/ProfileUser.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
