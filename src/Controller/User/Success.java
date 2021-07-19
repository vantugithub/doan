package Controller.User;

import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
import SessionUtils.SessionUtil;

/**
 * Servlet implementation class Success
 */
@WebServlet("/success")
public class Success extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Success() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		Connection conn = DBConnection.creatConnection();

		HttpSession httpSession = request.getSession(false);
	 	Order order  = (Order) httpSession.getAttribute("cart");
		
		MyUser user = (MyUser) httpSession.getAttribute("USERMODEL");
		int userId = user.getId();
		
		String fullName = request.getParameter("fullname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		String totalStr = (String)httpSession.getAttribute("total");
		int total =Integer.parseInt(totalStr);  

		LocalDate orderDate = java.time.LocalDate.now();  
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd LLLL yyyy");
		String orderDateFormated = orderDate.format(formatter);

		List<ListItem> listProd = order.getItems();
		OrderItems hi = new OrderItems();
		
		long orderId = OrderDAO.insertOrder(conn, userId, orderDateFormated, fullName, phone, address, total );
		for(ListItem item: listProd) {
			int quantity = item.getQuantity();
			Product prod = item.getProduct();
			long prodId = prod.getId();
			long price = prod.getPrice();
			hi.insertOrderItems(conn, orderId, prodId, quantity, price);
		}
		
		if(httpSession.getAttribute("cart") != null) {
			SessionUtil.getInstance().removeValue(request,"cart" );
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/View/Web/Success.jsp");
		dispatcher.forward(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
