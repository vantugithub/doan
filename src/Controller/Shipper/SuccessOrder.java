package Controller.Shipper;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.MyUser;
import DAO.OrderDAO;
import DB.DBConnection;

/**
 * Servlet implementation class SuccessOrder
 */
@WebServlet("/shipper/successOrder")
public class SuccessOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuccessOrder() {
        super();
        // TODO Auto-generated constructor stub
    }
    private OrderDAO dao;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idStr = request.getParameter("orderId");
		long idOfOrder = Long.parseLong(idStr);
		Connection conn = DBConnection.creatConnection();
		
		HttpSession httpSession = request.getSession(false);
		MyUser user = (MyUser) httpSession.getAttribute("USERMODEL");
		int idShipper = user.getId();

		dao.successShip(conn, idOfOrder, idShipper);
//		request.setAttribute("list", list);
//		RequestDispatcher rd = request.getRequestDispatcher("/View/Seller/OrderItem.jsp");
//		rd.forward(request, response);
		 response.sendRedirect("http://localhost:8080/Laptop/shipper/shipping");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
