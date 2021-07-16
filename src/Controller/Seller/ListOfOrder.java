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

import BEAN.Category;
import BEAN.Order;
import BEAN.Product;
import DAO.OrderDAO;
import DAO.ProductDAO;
import DB.DBConnection;

/**
 * Servlet implementation class ListOfOrder
 */
@WebServlet("/seller/orders")
public class ListOfOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListOfOrder() {
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
		int count = 5;
		String idPageStr = request.getParameter("page");
		System.out.println(request.getParameter("page"));

		int pageId = Integer.parseInt(idPageStr);
		if(pageId == 1 ) {

		}
		else {
			pageId = pageId - 1;
			pageId = pageId * count + 1;
		}
		
		int sumRow = orderDAO.countRowOfOrders(conn);
		
		int maxPageId;
		if((sumRow/count)%2==0) 
		{
			maxPageId = (sumRow/count);
		}
		else 
		{
			maxPageId = (sumRow/count)+1;
		}
		
		request.setAttribute("sum",sumRow);
		request.setAttribute("maxPageId", maxPageId);
		request.setAttribute("numberPage",Integer.parseInt(idPageStr));
		
		List<Order> list = orderDAO.paginationOrders(conn, pageId, count);
//		List<Category> listt = categoryDAO.getAllOfCategory(conn);
		
		request.setAttribute("list", list);
//		request.setAttribute("listt", listt);
		
		RequestDispatcher rd = request.getServletContext().getRequestDispatcher("/View/Seller/Orders.jsp");
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
