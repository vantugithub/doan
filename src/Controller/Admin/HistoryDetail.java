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

import BEAN.ListItem;
import BEAN.MyUser;
import BEAN.Order;
import DAO.OrderDAO;
import DAO.OrderItems;
import DAO.UserDAO;
import DB.DBConnection;

/**
 * Servlet implementation class HistoryDetail
 */
@WebServlet("/admin/historydetail")
public class HistoryDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HistoryDetail() {
        super();
        // TODO Auto-generated constructor stub
    }
    private OrderItems dao;
	private OrderDAO orderDao;
	private UserDAO userDAO;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		int idOfOrder = Integer.parseInt(idStr);
		Connection conn = DBConnection.creatConnection();
		@SuppressWarnings("static-access")
		List<ListItem> list  = dao.findOrderById(conn, idOfOrder);
		request.setAttribute("list", list);
		
		List<Order> list2  = orderDao.getOrderByID(conn, idOfOrder);
		request.setAttribute("list2", list2);
		
		List<MyUser> shipList = new ArrayList<MyUser>();
		List<MyUser> saleList = new ArrayList<MyUser>();
		
		for(Order item : list2) {
			String idShipStr = item.getIdShip();
			if (item.getIdShip() != null) {
				int idShip = Integer.parseInt(idShipStr);
				MyUser shipper = userDAO.getProfileUser(conn, idShip);
				shipList.add(shipper);
				request.setAttribute("shipList", shipList);
			}
			
			String idSaleStr = item.getIdSale();
			int idSale = Integer.parseInt(idSaleStr);
			MyUser sale = userDAO.getProfileUser(conn,idSale);;
			saleList.add(sale);
		}
		request.setAttribute("shipList", shipList);
		request.setAttribute("saleList", saleList);
		RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/HistoryDetail.jsp");
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
