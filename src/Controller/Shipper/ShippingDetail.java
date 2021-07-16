package Controller.Shipper;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.ListItem;
import BEAN.Order;
import DAO.OrderDAO;
import DAO.OrderItems;
import DB.DBConnection;

/**
 * Servlet implementation class ShippingDetail
 */
@WebServlet("/shipper/shippingDetail")
public class ShippingDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShippingDetail() {
        super();
        // TODO Auto-generated constructor stub
    }
	private OrderItems dao;
	private OrderDAO orderDao;


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
		RequestDispatcher rd = request.getRequestDispatcher("/View/Shipper/ShippingDetail.jsp");
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
