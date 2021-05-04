package Controller.Seller;

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

@WebServlet("/seller/profile")
public class ProfileSeller extends HttpServlet {
	
	private OrtherDAO dao;
	
	private static final long serialVersionUID = 1L;

	public ProfileSeller() {
        super();
    }

	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MyUser myUser =(MyUser) SessionUtil.getInstance().getValue(request, "USERMODEL");
		
		String mess = (String) request.getAttribute("mess");
		Connection conn = DBConnection.creatConnection();
		MyUser myuser = dao.getProfileAdmin(conn, myUser.getId());
		request.setAttribute("myUser", myuser);
		request.setAttribute("mess", mess);
		RequestDispatcher rd = request.getRequestDispatcher("/View/Seller/ProfileSeller.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
