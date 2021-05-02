package Controller.Admin;

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

import BEAN.MyUser;
import BEAN.Role;
import DAO.UserDAO;
import DB.DBConnection;

@WebServlet("/admin/users")
public class ListOfUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDAO dao;
    public ListOfUsers() {
        super();
    }
    
	@SuppressWarnings({ "static-access",})
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String role = "";
		Connection conn = DBConnection.creatConnection();
		List<MyUser> listOfUser = new ArrayList<MyUser>();
		RequestDispatcher rd = null;
		
		int count = 4;
		String idPageStr = request.getParameter("page");
		int pageId = Integer.parseInt(idPageStr);
		if(pageId == 1) {
		}
		else {
			pageId = pageId - 1;
			pageId = pageId * count + 1;
		}
		
		if(request.getParameter("role")==null) {
			role+="ROLE_ADMIN";
			listOfUser = dao.getAllOfUsers(conn,role,pageId,count);
			rd = request.getRequestDispatcher("/View/Admin/Users.jsp");
		}
		else {
			role += request.getParameter("role");
			listOfUser = dao.getAllOfUsers(conn,role,pageId,count);
			rd = request.getRequestDispatcher("/View/Admin/UsersRole.jsp");
		}
		
		int sumRow = dao.countRowOfUsers(conn,role);
		int maxPageId;
		if((sumRow/count)%2==0) 
		{
			maxPageId = (sumRow/count);
		}
		else 
		{
			maxPageId = (sumRow/count)+1;
		}
		request.setAttribute("role", role);
		request.setAttribute("sum",sumRow);
		request.setAttribute("maxPageId", maxPageId);
		request.setAttribute("numberPage",Integer.parseInt(idPageStr));
		
		List<Role> listOfRole = dao.getAllOfRoles(conn);
		request.setAttribute("list", listOfUser);
		request.setAttribute("listRole",listOfRole);
		
		rd.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
