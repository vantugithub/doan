package Controller.User;

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

import BEAN.Category;
import BEAN.Order;
import DAO.CategoryDAO;
import DB.DBConnection;


@WebServlet("/Cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CategoryDAO categoryDAO;

    public Cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession httpSession = request.getSession(false);
		 
		 if(httpSession.getAttribute("cart") != null ) {
			 	Order order  = (Order) httpSession.getAttribute("cart");
				request.setAttribute("list", order.getItems());
			}
		 Connection conn = DBConnection.creatConnection();
		 List<Category> listCategory = categoryDAO.getAllOfCategory(conn);
			request.setAttribute("listCategory", listCategory);
		RequestDispatcher rd = request.getRequestDispatcher("/View/Web/Cart.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
