package Controller.Admin;

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

@WebServlet("/admin/descriptionproduct")
public class EditDescriptionProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ProductDAO dao;
       
    public EditDescriptionProduct() {
        super();
    }

	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = DBConnection.creatConnection();
		String idProduct  = request.getParameter("id");
		Product product = dao.findProductByIdd(conn, Long.parseLong(idProduct));
		request.setAttribute("product", product);
		RequestDispatcher rd = request.getRequestDispatcher("/View/Admin/DescriptionOfProduct.jsp");
		rd.forward(request, response);
	}

	@SuppressWarnings("static-access")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getCharacterEncoding()==null) {
			request.setCharacterEncoding("UTF-8");
		}
		Connection conn = DBConnection.creatConnection();
		String idProduct = request.getParameter("id");
		String description = request.getParameter("description");
		String content = request.getParameter("content");
		dao.updateDescriptionAndContentOfProduct(conn, Long.parseLong(idProduct), description,content);
		response.sendRedirect(request.getContextPath()+"/admin/products?page=1");
	}

}
