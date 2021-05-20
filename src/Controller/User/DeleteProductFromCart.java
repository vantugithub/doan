package Controller.User;

import java.io.IOException;
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

@WebServlet("/deleteproduct")
public class DeleteProductFromCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteProductFromCart() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String idStr = request.getParameter("idProduct");
		HttpSession httpSession = request.getSession(false);
		Order order  = (Order) httpSession.getAttribute("cart");
		List<ListItem> items = new ArrayList<ListItem>();
		items = order.getItems();
		try {
			for(ListItem item : items) {
				if(item.getProduct().getId()==Long.parseLong(idStr)) 
				{
					items.remove(item);
					break;
				}
			}
		}
			catch (Exception e) {
				System.out.println(e.toString());
			}

			order.setItems(items);
			httpSession.setAttribute("cart", order);
			request.setAttribute("list", order.getItems());
			request.getSession().setAttribute("quantity",items.size());
			RequestDispatcher rd = request.getRequestDispatcher("/View/Web/ListProduct.jsp");
			rd.forward(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}

	}
