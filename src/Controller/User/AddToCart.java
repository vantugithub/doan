package Controller.User;

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

import BEAN.ListItem;
import BEAN.Order;
import BEAN.Product;
import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/add-to-cart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddToCart() {
        super();
    }
    
    private ProductDAO dao;

	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("id");
		long id = Long.parseLong(idStr);
		HttpSession httpSession = request.getSession(false);
		Connection conn = DBConnection.creatConnection();
		Product product = dao.findProductByIdd(conn, id);
		String quantityStr = request.getParameter("quantity");
		int quantity = Integer.parseInt(quantityStr);
		if(httpSession.getAttribute("cart")==null) {
			ListItem item = new ListItem();
			if(quantity != 0) {
				item.setQuantity(quantity);
			}else {
				item.setQuantity(1);
			}
			item.setProduct(product);
			List<ListItem> items = new ArrayList<ListItem>();
			items.add(item);
			Order order = new Order();
			order.setItems(items);
			httpSession.setAttribute("cart"	, order);
			request.getSession().setAttribute("quantity",1);
		}
		else {
			Order order  = (Order) httpSession.getAttribute("cart");
			List<ListItem> items = new ArrayList<ListItem>();
			items = order.getItems();
			boolean temp = true;
			for(ListItem item : items) {
				if(item.getProduct().getId()==id) {
					if(quantity != 0)
					{
						item.setQuantity(item.getQuantity()+quantity);
						temp = false;
						break;
					}
					else {
						item.setQuantity(item.getQuantity()+1);
						temp = false;
						break;
					}
				}
			}
			
			if(temp==true) {
				ListItem item = new ListItem();
				item.setQuantity(1);
				item.setProduct(product);
				items.add(item);
				order.setItems(items);
			}
			
			httpSession.setAttribute("cart", order);
			request.getSession().setAttribute("quantity",items.size());
		}
		RequestDispatcher rd  = request.getRequestDispatcher("/View/Web/Quantity.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
