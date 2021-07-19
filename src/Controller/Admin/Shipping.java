package Controller.Admin;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.MyUser;
import BEAN.Order;
import DAO.OrderDAO;
import DAO.UserDAO;
import DB.DBConnection;

/**
 * Servlet implementation class Shipping
 */
@WebServlet("/admin/shipping")
public class Shipping extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Shipping() {
		super();
		// TODO Auto-generated constructor stub
	}

	private OrderDAO orderDAO;
	private UserDAO userDAO;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = DBConnection.creatConnection();
		
		HttpSession httpSession = request.getSession(false);
		
		List<Order> list = orderDAO.shippingAdmin(conn);
		
		List<MyUser> shipList = new ArrayList<MyUser>();
		for(Order item : list) {
			String idShipStr = item.getIdShip();
			int idShip = Integer.parseInt(idShipStr);
			MyUser sale = userDAO.getProfileUser(conn,idShip);;
			shipList.add(sale);
		}
		request.setAttribute("list", list);
		request.setAttribute("shipList", shipList);

		RequestDispatcher rd = request.getServletContext().getRequestDispatcher("/View/Admin/Shipping.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
