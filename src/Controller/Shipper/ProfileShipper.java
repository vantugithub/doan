package Controller.Shipper;

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

/**
 * Servlet implementation class ProfileShipper
 */
@WebServlet("/shipper/profile")
public class ProfileShipper extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrtherDAO dao;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileShipper() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MyUser myUser =(MyUser) SessionUtil.getInstance().getValue(request, "USERMODEL");
		
		String mess = (String) request.getAttribute("mess");
		Connection conn = DBConnection.creatConnection();
		MyUser myuser = dao.getProfileShipper(conn, myUser.getId());
		request.setAttribute("myUser", myuser);
		request.setAttribute("mess", mess);
		RequestDispatcher rd = request.getRequestDispatcher("/View/Shipper/ProfileShipper.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
