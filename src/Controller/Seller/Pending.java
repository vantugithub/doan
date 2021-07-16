package Controller.Seller;

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

import BEAN.MyUser;
import BEAN.Order;
import DAO.OrderDAO;
import DB.DBConnection;

/**
 * Servlet implementation class Pending
 */
@WebServlet("/seller/pending")
public class Pending extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pending() {
        super();
        // TODO Auto-generated constructor stub
    }
	private OrderDAO orderDAO;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	Connection conn = DBConnection.creatConnection();
		
//		HttpSession httpSession = request.getSession(false);
//		MyUser user = (MyUser) httpSession.getAttribute("USERMODEL");
//		int idShipper = user.getId();

		
		List<Order> list = orderDAO.pending(conn);
//		List<Category> listt = categoryDAO.getAllOfCategory(conn);

		request.setAttribute("list", list);
//		request.setAttribute("listt", listt);

		RequestDispatcher rd = request.getServletContext().getRequestDispatcher("/View/Seller/Pending.jsp");
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
