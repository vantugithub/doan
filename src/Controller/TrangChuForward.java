package Controller;

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
import BEAN.Product;
import DAO.CategoryDAO;
import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/Home")
public class TrangChuForward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ProductDAO dao;
	private CategoryDAO categoryDAO;
	
    public TrangChuForward() {
        super();
    }

	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection conn = DBConnection.creatConnection();
		List<Product>list = dao.getAllOfProducts(conn);
		
		request.setAttribute("list", list);
		List<Category> listCategory = categoryDAO.getAllOfCategory(conn);
		request.setAttribute("listCategory", listCategory);
		RequestDispatcher rd = request.getRequestDispatcher("View/Web/TrangChu.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
