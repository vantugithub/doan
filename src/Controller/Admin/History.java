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
 * Servlet implementation class History
 */
@WebServlet("/admin/history")
public class History extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public History() {
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
		// TODO Auto-generated method stub
		Connection conn = DBConnection.creatConnection();

		HttpSession httpSession = request.getSession(false);

		List<Order> list = orderDAO.historyAdmin(conn);
		List<MyUser> shipList = new ArrayList<MyUser>();
		List<MyUser> saleList = new ArrayList<MyUser>();

		for (Order item : list) {
			String idShipStr = item.getIdShip();
			if (item.getIdShip() != null) {
				int idShip = Integer.parseInt(idShipStr);
				MyUser shipper = userDAO.getProfileUser(conn, idShip);
				shipList.add(shipper);
				request.setAttribute("shipList", shipList);
			}

			String idSaleStr = item.getIdSale();
			int idSale = Integer.parseInt(idSaleStr);
			MyUser sale = userDAO.getProfileUser(conn, idSale);
			saleList.add(sale);
		}
		request.setAttribute("list", list);
		request.setAttribute("saleList", saleList);

		RequestDispatcher rd = request.getServletContext().getRequestDispatcher("/View/Admin/History.jsp");
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
