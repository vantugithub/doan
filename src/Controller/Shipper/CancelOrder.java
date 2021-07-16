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
import javax.servlet.http.HttpSession;

import BEAN.ListItem;
import BEAN.MyUser;
import DAO.OrderDAO;
import DB.DBConnection;

/**
 * Servlet implementation class AcceptOrder
 */
@WebServlet("/shipper/cancelOrder")
public class CancelOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelOrder() {
        super();
        // TODO Auto-generated constructor stub
    }
    private OrderDAO dao;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("orderId");
		long idOfOrder = Long.parseLong(idStr);
		Connection conn = DBConnection.creatConnection();
		
		HttpSession httpSession = request.getSession(false);
		MyUser user = (MyUser) httpSession.getAttribute("USERMODEL");
		int idShipper = user.getId();

		dao.cancelShip(conn, idOfOrder, idShipper);
//		request.setAttribute("list", list);
//		RequestDispatcher rd = request.getRequestDispatcher("/View/Seller/OrderItem.jsp");
//		rd.forward(request, response);
		 response.sendRedirect("http://localhost:8080/Laptop/shipper/orders?page=1");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
