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

@WebServlet("/lap")
public class DetailProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductDAO dao;
	private CategoryDAO categoryDAO;
    public DetailProduct() {
        super();
    }

	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nameOfProduct = request.getParameter("name");
		
		Connection conn = DBConnection.creatConnection();
		 List<Category> listCategory = categoryDAO.getAllOfCategory(conn);
			request.setAttribute("listCategory", listCategory);
		
		Product product = dao.getProductByName(conn, nameOfProduct);
		String imageListProduct = dao.getImageListProductById(conn, product.getId());
		
		String []  listImage = imageListProduct.split(";");
		request.setAttribute("listImage", listImage);
		request.setAttribute("product", product);
		request.setAttribute("nTagInDatabase","\n");
		request.setAttribute("brTagInHtml","<br/>");
		RequestDispatcher rd = request.getRequestDispatcher("/View/Web/Single.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
