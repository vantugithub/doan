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

import BEAN.Category;
import BEAN.Product;
import DAO.CategoryDAO;
import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/Brands")
public class ProductsByModels extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ProductDAO dao;
	private CategoryDAO categoryDAO;
    public ProductsByModels() {
        super();
    }

	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String brand = request.getParameter("brand");
		Connection conn = DBConnection.creatConnection();
		List<Product> list = dao.getAllProductsByBrands(conn, brand);
		List<Category> listCategory = categoryDAO.getAllOfCategory(conn);
		request.setAttribute("listCategory", listCategory);
		request.setAttribute("list", list);
		RequestDispatcher rd  = request.getRequestDispatcher("/View/Web/ProductsByModel.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
