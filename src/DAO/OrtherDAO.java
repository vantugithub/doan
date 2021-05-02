package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import BEAN.MyUser;

public class OrtherDAO {
	public static MyUser getProfileAdmin(Connection conn,int id){
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
				myUser.setActive(rs.getInt("active"));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return myUser;
	}
	
	public static int updateProfileAdmin(Connection conn, MyUser myUser) {
		String sql = "UPDATE users SET fullname = ?, address = ? , phone = ? WHERE iduser = ?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setNString(1, myUser.getFullName());
			ps.setNString(2, myUser.getAddress());
			ps.setNString(3, myUser.getPhone());
			ps.setInt(4, myUser.getId());
			
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
}
