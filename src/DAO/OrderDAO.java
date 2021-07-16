package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import BEAN.Order;
import BEAN.Product;

public class OrderDAO {
	public static long insertOrder(Connection conn, int userId, String orderDate, String fullname, String phone,
			String address, int total) {

		String sql = "INSERT INTO orders (IdUser,OrderDate,Status,Name,Phone,Address, Total) value(?,?,?,?,?,?,?)";
		try {
			String status = "Receiving";
			PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, userId);
			ps.setString(2, orderDate);
			ps.setString(3, status);
			ps.setString(4, fullname);
			ps.setString(5, phone);
			ps.setString(6, address);
			ps.setInt(7, total);
			ps.addBatch();
			ps.executeBatch();

			ResultSet res = ps.getGeneratedKeys();
			while (res.next()) {
				System.out.println(res.getString(1));
				String orderidStr = res.getString(1);
				int orderid = Integer.parseInt(orderidStr);
				return orderid;
			}

			if (ps.executeUpdate() != 0) {
				ps.close();
			}
			ps.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return 0;
	}

	public static int countRowOfOrders(Connection conn) {
		String sql = "SELECT count(*) FROM orders";
		int count = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public static List<Order> paginationOrders(Connection conn, int start, int count) {
		List<Order> list = new ArrayList<Order>();
		String sql = "SELECT * FROM orders WHERE status='Receiving' limit " + (start - 1) + ", " + count + "";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getLong("Id"));
				order.setStatus(rs.getString("Status"));
				order.setAddress(rs.getString("Address"));
				order.setName(rs.getString("Name"));
				order.setPhone(rs.getString("Phone"));
				order.setOrderDate(rs.getString("OrderDate"));
				order.setIdUser(rs.getString("IdUser"));
				order.setIdSale(rs.getString("IdSale"));
				order.setIdShip(rs.getString("IdShipper"));
				order.setTotal(rs.getInt("Total"));
				list.add(order);
			}
			ps.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static boolean changeStatus(Connection conn, long idOrder, int idSale) {
		String sql = "UPDATE orders SET Status = 'Pending', IdSale = ? WHERE (`Id` = ?);";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idSale);
			ps.setLong(2, idOrder);
			int rs = ps.executeUpdate();
			ps.close();
		} catch (

		SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public static List<Order> pending(Connection conn) {
		List<Order> list = new ArrayList<Order>();
		String sql = "SELECT * FROM orders WHERE Status = 'Pending'";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getLong("Id"));
				order.setStatus(rs.getString("Status"));
				order.setAddress(rs.getString("Address"));
				order.setName(rs.getString("Name"));
				order.setPhone(rs.getString("Phone"));
				order.setOrderDate(rs.getString("OrderDate"));
				order.setIdUser(rs.getString("IdUser"));
				order.setIdSale(rs.getString("IdSale"));
				order.setIdShip(rs.getString("IdShipper"));
				order.setTotal(rs.getInt("Total"));
				list.add(order);
			}
			ps.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static boolean cancelOrder(Connection conn, long idOrder, int idSale) {
		String sql = "UPDATE orders SET Status = 'Reject', IdSale = ? WHERE (`Id` = ?);";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idSale);
			ps.setLong(2, idOrder);
			int rs = ps.executeUpdate();
			ps.close();
		} catch (

		SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	public static List<Order> historyUser(Connection conn, int idUser) {
		List<Order> list = new ArrayList<Order>();
		String sql = "SELECT * FROM orders WHERE IdUser = ? ";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idUser);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				Order order = new Order();
				order.setId(rs.getLong("Id"));
				order.setStatus(rs.getString("Status"));
				order.setAddress(rs.getString("Address"));
				order.setName(rs.getString("Name"));
				order.setPhone(rs.getString("Phone"));
				order.setOrderDate(rs.getString("OrderDate"));
				order.setIdUser(rs.getString("IdUser"));
				order.setIdSale(rs.getString("IdSale"));
				order.setIdShip(rs.getString("IdShipper"));
				order.setTotal(rs.getInt("Total"));
				list.add(order);
				
				String sql2 = "SELECT * FROM orderitems WHERE OrderId = " + rs.getLong("Id");
				PreparedStatement ps2 = conn.prepareStatement(sql2);
				ResultSet rs2 = ps2.executeQuery();
				
				Product prod = new Product();
				if(rs2.next()){
				prod.setName(rs2.getString("Name"));
				prod.setImage(rs2.getString("Image"));
				}
			}
			ps.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Order> history(Connection conn, int idSale) {
		List<Order> list = new ArrayList<Order>();
		String sql = "SELECT * FROM orders WHERE IdSale = ? AND Status != 'Pending'";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idSale);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getLong("Id"));
				order.setStatus(rs.getString("Status"));
				order.setAddress(rs.getString("Address"));
				order.setName(rs.getString("Name"));
				order.setPhone(rs.getString("Phone"));
				order.setOrderDate(rs.getString("OrderDate"));
				order.setIdUser(rs.getString("IdUser"));
				order.setIdSale(rs.getString("IdSale"));
				order.setIdShip(rs.getString("IdShipper"));
				order.setTotal(rs.getInt("Total"));
				list.add(order);
			}
			ps.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Order> historyShip(Connection conn, int idShipper) {
		List<Order> list = new ArrayList<Order>();
		String sql = "SELECT * FROM orders WHERE IdShipper = ? AND Status != 'Shipping' AND Status != 'Pending'";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idShipper);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getLong("Id"));
				order.setStatus(rs.getString("Status"));
				order.setAddress(rs.getString("Address"));
				order.setName(rs.getString("Name"));
				order.setPhone(rs.getString("Phone"));
				order.setOrderDate(rs.getString("OrderDate"));
				order.setIdUser(rs.getString("IdUser"));
				order.setIdSale(rs.getString("IdSale"));
				order.setIdShip(rs.getString("IdShipper"));
				order.setTotal(rs.getInt("Total"));
				list.add(order);
			}
			ps.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Order> paginationOrdersShip(Connection conn, int start, int count) {
		List<Order> list = new ArrayList<Order>();
		String sql = "SELECT * FROM orders WHERE status='Pending' limit " + (start - 1) + ", " + count + "";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getLong("Id"));
				order.setStatus(rs.getString("Status"));
				order.setAddress(rs.getString("Address"));
				order.setName(rs.getString("Name"));
				order.setPhone(rs.getString("Phone"));
				order.setOrderDate(rs.getString("OrderDate"));
				order.setIdUser(rs.getString("IdUser"));
				order.setIdSale(rs.getString("IdSale"));
				order.setIdShip(rs.getString("IdShipper"));
				order.setTotal(rs.getInt("Total"));
				list.add(order);
			}
			ps.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Order> getOrderByID(Connection conn, long id) {
		List<Order> list = new ArrayList<Order>();
		String sql = "SELECT * FROM orders WHERE Id = ? ";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getLong("Id"));
				order.setStatus(rs.getString("Status"));
				order.setAddress(rs.getString("Address"));
				order.setName(rs.getString("Name"));
				order.setPhone(rs.getString("Phone"));
				order.setOrderDate(rs.getString("OrderDate"));
				order.setIdUser(rs.getString("IdUser"));
				order.setIdSale(rs.getString("IdSale"));
				order.setIdShip(rs.getString("IdShipper"));
				order.setTotal(rs.getInt("Total"));
				list.add(order);
			}
			ps.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static boolean acceptShip(Connection conn, long idOrder, int idShipper) {
		String sql = "UPDATE orders SET Status = 'Shipping', IdShipper = ? WHERE (`Id` = ?);";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idShipper);
			ps.setLong(2, idOrder);
			int rs = ps.executeUpdate();
			ps.close();
		} catch (

		SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public static boolean successShip(Connection conn, long idOrder, int idShipper) {
		String sql = "UPDATE orders SET Status = 'Success', IdShipper = ? WHERE (`Id` = ?);";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idShipper);
			ps.setLong(2, idOrder);
			int rs = ps.executeUpdate();
			ps.close();
		} catch (

		SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public static boolean cancelShip(Connection conn, long idOrder, int idShipper) {
		String sql = "UPDATE orders SET Status = 'Reject', IdShipper = ? WHERE (`Id` = ?);";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idShipper);
			ps.setLong(2, idOrder);
			int rs = ps.executeUpdate();
			ps.close();
		} catch (

		SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	public static List<Order> shipping(Connection conn, int idShipper) {
		List<Order> list = new ArrayList<Order>();
		String sql = "SELECT * FROM orders WHERE IdShipper = ? AND Status = 'Shipping'";

		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idShipper);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getLong("Id"));
				order.setStatus(rs.getString("Status"));
				order.setAddress(rs.getString("Address"));
				order.setName(rs.getString("Name"));
				order.setPhone(rs.getString("Phone"));
				order.setOrderDate(rs.getString("OrderDate"));
				order.setIdUser(rs.getString("IdUser"));
				order.setIdSale(rs.getString("IdSale"));
				order.setIdShip(rs.getString("IdShipper"));
				order.setTotal(rs.getInt("Total"));
				list.add(order);
			}
			ps.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
