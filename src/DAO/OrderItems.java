package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mysql.*;

import BEAN.ListItem;
import BEAN.Order;
import BEAN.Product;
public class OrderItems {
	public void insertOrderItems(Connection conn, long orderId, long productId, int quantity, long price) {
		String sql = "INSERT INTO orderitems (OrderId, ProductId, Quantity, Price) value (?,?,?,?)";
		
		try {
			PreparedStatement prep = conn.prepareStatement(sql);
			prep.setLong(1, orderId);
			prep.setLong(2, productId);
			prep.setInt(3, quantity);
			prep.setLong(4, price);
			if(prep.executeUpdate()!=0) {
				prep.close();
			}
			prep.close();
		}
		catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	public static List<ListItem> historyUser(Connection conn, int idUser) {
		List<ListItem> list = new ArrayList<ListItem>();
		String sql = "SELECT * FROM orders INNER JOIN orderitems ON orders.Id=orderitems.OrderId WHERE IdUser = ? ";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idUser);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
//				Order order = new Order();
//				order.setId(rs.getLong("Id"));
//				order.setStatus(rs.getString("Status"));
//				order.setAddress(rs.getString("Address"));

				
				String sql2 = "SELECT * FROM orderitems INNER JOIN products ON products.Id=orderitems.ProductId WHERE OrderId = " + rs.getLong("Id");
				PreparedStatement ps2 = conn.prepareStatement(sql2);
				ResultSet rs2 = ps2.executeQuery();
				
				Product prod = new Product();
				if(rs2.next()){
				prod.setName(rs2.getString("Name"));
				prod.setImage(rs2.getString("Image"));
				}
				ListItem listItem = new ListItem();
				listItem.setProduct(prod);
				listItem.setQuantity(rs.getInt("Quantity"));
				listItem.setPrice(rs.getInt("Price"));
				listItem.setOrderId(rs.getLong("Id"));
				list.add(listItem);
			}
			ps.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<ListItem> findOrderById(Connection conn,long id){
//		Product x = new Product();
//		String sql = "SELECT * FROM products FROM products INER JOIN orderitems ON products.Id=orderitems.ProductId WHERE products.Id = ?";
//		
		
		List<ListItem> list = new ArrayList<ListItem>();
		String sql = "SELECT * FROM orderitems WHERE OrderId = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				String sql2 = "SELECT * FROM products INNER JOIN orderitems ON products.Id=orderitems.ProductId WHERE products.Id =" + rs.getInt("ProductId");
				PreparedStatement ps2 = conn.prepareStatement(sql2);
				ResultSet rs2 = ps2.executeQuery();
				
				Product prod = new Product();
				if(rs2.next()){
				prod.setName(rs2.getString("Name"));
				prod.setImage(rs2.getString("Image"));
				}
				ListItem listItem = new ListItem();
				listItem.setProduct(prod);
				listItem.setQuantity(rs.getInt("Quantity"));
				listItem.setPrice(rs.getInt("Price"));
				listItem.setOrderId(id);
				list.add(listItem);
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	private static ListItem convertToOrderDetail(ResultSet rs) throws SQLException  {
		ListItem orderD = new ListItem();
		Product prod = new Product();
		
		prod.setId(rs.getLong(2));
		orderD.setOrderId(rs.getLong(1));
		orderD.setProduct(prod);
		orderD.setQuantity(rs.getInt(3));

		return orderD;
	}
	
	public ArrayList<ListItem> getAllOrder() {
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ArrayList<ListItem> orderList = new ArrayList<ListItem>();

		try {
			String sql = "SELECT * FROM orderitems";
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				orderList.add(convertToOrderDetail(resultSet));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderList;
	}
}
