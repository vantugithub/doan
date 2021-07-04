package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.MyUser;
import BEAN.Role;
import Service.DecodeAndDecrypt;

public class UserDAO {
	
	public static MyUser getProfileUser(Connection conn,int id){
		String sql = "SELECT * FROM users WHERE iduser = ? ";
		MyUser myUser = new MyUser();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				myUser.setId(rs.getInt("iduser"));
				myUser.setFullName(rs.getNString("fullname"));
				myUser.setAddress(rs.getNString("address"));
				myUser.setPhone(rs.getNString("phone"));
				myUser.setUsername(rs.getNString("username"));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return myUser;
	}
	
	
	public static List<MyUser> getAllOfUsers(Connection conn,String role,int start,int count)
	{
		List<MyUser> list = new ArrayList<MyUser>();
		String sql = "SELECT * FROM users WHERE users.iduser IN (SELECT roles_users.user FROM roles_users "
				+ "WHERE roles_users.role IN (SELECT roles.idrole FROM roles WHERE roles.name = ?)) LIMIT " +(start - 1)+", "+count+"";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, role);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MyUser user  = new MyUser();
				user.setActive(rs.getInt("active"));
				user.setAddress(rs.getNString("address"));
				user.setFullName(rs.getNString("fullname"));
				user.setId(rs.getInt("iduser"));
				user.setPassword(rs.getNString("password"));
				user.setPhone(rs.getNString("phone"));
				user.setUsername(rs.getNString("username"));
				list.add(user);
			}
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Role> getAllOfRoles(Connection conn)
	{
		List<Role> list = new ArrayList<Role>();
		String sql = "SELECT * FROM roles";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Role role  = new Role();
				role.setId(rs.getInt("idrole"));
				role.setRoleName(rs.getNString("name"));
				list.add(role);
			}
			
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public static int countRowOfUsers(Connection conn,String role) 
	{
		String sql="SELECT count(*) FROM users WHERE users.iduser IN (SELECT roles_users.user FROM roles_users "
				+ "WHERE roles_users.role IN (SELECT roles.idrole FROM roles WHERE roles.name = ?))";
		int count = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setNString(1, role);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return count;
	}
	
	public static Role roleOfUser(Connection conn,int id) 
	{
		String sql="SELECT * FROM roles WHERE roles.idrole IN "
				+ "(SELECT roles_users.role FROM roles_users WHERE roles_users.user IN "
				+ "(SELECT users.iduser FROM users WHERE users.iduser = ?))";
		Role role  = new Role();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				role.setId(rs.getInt("idrole"));
				role.setRoleName(rs.getNString("name"));
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return role;
	}
	
	public static int updateRoleOfUser(Connection conn,int idRole,int idUser) {
		String sql = "UPDATE roles_users SET roles_users.role = ? WHERE roles_users.user = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idRole);
			ps.setInt(2, idUser);
			if(ps.executeUpdate()!=0) {
				ps.close();
				return 1;
			}
			ps.close();
			return 0;
		}
		catch (Exception e) {
			System.out.println(e.toString());
		}
		return 0;
	}
	
	public static void updateStatusOfUser(Connection conn,int id,boolean status) {
		try {
			String sql= "";
			if(status) 
			{
				sql += "UPDATE users SET active = 1 WHERE iduser = ? ";
			}
			else 
			{
				sql += "UPDATE users SET active = 0 WHERE iduser = ? ";
			}
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			if(ps.executeUpdate()!=0) 
			{
				ps.close();
			}
			ps.close();
		}
		catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	public static int resetPasswordOfUser(Connection conn,int id,String password) {
		try {
			String sql= "UPDATE users SET password = ? WHERE iduser = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setNString(1, DecodeAndDecrypt.hashPassword(password));
			ps.setInt(2, id);
			if(ps.executeUpdate()!=0) 
			{
				ps.close();
				return 1;
			}
			ps.close();
		}
		catch (Exception e) {
			System.out.println(e.toString());
			return 0;
		}
		return 0;
	}
	
	
	public static int updateProfileOfUser(Connection conn,MyUser myUser) {
		try {
			String sql= "UPDATE users SET fullname = ?, address = ?, phone = ? WHERE iduser = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setNString(1, myUser.getFullName());
			ps.setNString(2, myUser.getAddress());
			ps.setNString(3, myUser.getPhone());
			ps.setInt(4, myUser.getId());
			if(ps.executeUpdate()!=0) 
			{
				ps.close();
				return 1;
			}
			ps.close();
		}
		catch (Exception e) {
			System.out.println(e.toString());
			return 0;
		}
		return 0;
	}
	
}
