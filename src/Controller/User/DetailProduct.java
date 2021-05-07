package Controller.User;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BEAN.Product;
import DAO.ProductDAO;
import DB.DBConnection;

@WebServlet("/lap")
public class DetailProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductDAO dao;
	
    public DetailProduct() {
        super();
    }

	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nameOfProduct = request.getParameter("name");
		Connection conn = DBConnection.creatConnection();
		Product product = dao.getProductByName(conn, nameOfProduct);
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
