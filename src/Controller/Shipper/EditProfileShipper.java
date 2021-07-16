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
 * Servlet implementation class EditProfileShipper
 */
@WebServlet("/shipper/editprofile")
public class EditProfileShipper extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrtherDAO dao;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileShipper() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
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
		if(dao.updateProfileShipper(conn, myUser)!=0)
		{
			mess+="Success";
		}
		else 
		{
			mess+="Failed";
		}
		request.setAttribute("mess", mess);
		RequestDispatcher rd = request.getRequestDispatcher("/shipper/profile");
		rd.forward(request, response);
	}

}
