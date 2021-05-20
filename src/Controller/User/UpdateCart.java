package Controller.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BEAN.ListItem;
import BEAN.Order;

/**
 * Servlet implementation class UpdateCart
 */
@WebServlet("/updatecart")
public class UpdateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateCart() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idStr = request.getParameter("idProduct");
		String quantityStr =  request.getParameter("quantityProduct");
		HttpSession httpSession = request.getSession(false);
		Order order  = (Order) httpSession.getAttribute("cart");
		List<ListItem> items = new ArrayList<ListItem>();
		items = order.getItems();
		try {
			for(ListItem item : items) {
				if(item.getProduct().getId()==Long.parseLong(idStr)) {
					if(Integer.parseInt(quantityStr) == 0)
					{
						items.remove(item);
						break;
					}
					if(Integer.parseInt(quantityStr) > 0)
					{
						item.setQuantity(Integer.parseInt(quantityStr));
						break;
					}
				}
			}
		}
		catch (Exception e) {
			System.out.println(e.toString());
		}
		
		order.setItems(items);
		httpSession.setAttribute("cart", order);
		request.getSession().setAttribute("quantity",items.size());
		response.sendRedirect(request.getContextPath()+"/Cart");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
