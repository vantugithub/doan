package Controller.User;

import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Iterator;
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
import BEAN.Order;
import BEAN.Product;
import DAO.OrderDAO;
import DAO.OrderItems;
import DB.DBConnection;

/**
 * Servlet implementation class Success
 */
@WebServlet("/checkout")
public class Checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Checkout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = DBConnection.creatConnection();
		HttpSession httpSession = request.getSession(false);
		if(httpSession.getAttribute("cart") != null ) {
		 	Order order  = (Order) httpSession.getAttribute("cart");
			request.setAttribute("list", order.getItems());
		}
		
		MyUser user = (MyUser) httpSession.getAttribute("USERMODEL");
		request.setAttribute("myUser", user);

		String total = request.getParameter("total");
		httpSession.setAttribute("total", total);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/View/Web/Checkout.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
