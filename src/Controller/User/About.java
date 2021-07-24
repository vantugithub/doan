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


@WebServlet("/About")
public class About extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CategoryDAO categoryDAO;

    public About() {
        super();
        // TODO Auto-generated constructor stub
    }

	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession httpSession = request.getSession(false);
		 
		 Connection conn = DBConnection.creatConnection();
		 List<Category> listCategory = categoryDAO.getAllOfCategory(conn);
			request.setAttribute("listCategory", listCategory);
		RequestDispatcher rd = request.getRequestDispatcher("/View/Web/About.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
