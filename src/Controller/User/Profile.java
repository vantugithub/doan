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
import BEAN.ListItem;
import BEAN.MyUser;
import BEAN.Order;
import DAO.CategoryDAO;
import DAO.OrderDAO;
import DAO.OrderItems;
import DB.DBConnection;
import SessionUtils.SessionUtil;

@WebServlet("/profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	private CategoryDAO categoryDAO;
	private OrderItems orderItemDAO; 
	private OrderDAO dao;
    public Profile() {
        super();
    }
    
	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding()==null) {
			request.setCharacterEncoding("UTF-8");
		}
		Connection conn = DBConnection.creatConnection();
		List<Category> listCategory = categoryDAO.getAllOfCategory(conn);
		request.setAttribute("listCategory", listCategory);
		MyUser myUser_temp =(MyUser) SessionUtil.getInstance().getValue(request, "USERMODEL");

		request.setAttribute("myUser", myUser_temp);
				
		HttpSession httpSession = request.getSession(false);
		MyUser user = (MyUser) httpSession.getAttribute("USERMODEL");
		int idUser = user.getId();
		
		List<ListItem> list = orderItemDAO.historyUser(conn, idUser);
		List<Order> list2 = dao.historyUser(conn, idUser);

		request.setAttribute("list", list);
		request.setAttribute("list2", list2);

		RequestDispatcher rd = request.getRequestDispatcher("/View/Web/ProfileUser.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
