package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import BEAN.Product;

public class ProductDAO {
	public static void createCategory(Connection conn,String nameOfCategory)
	{
		String sql = "INSERT INTO catalogs(Name,SiteTitle,Visibility) value(?,?,?)";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, nameOfCategory);
			ps.setString(2, nameOfCategory);
			ps.setInt(3, 1);
			if(ps.executeUpdate()!=0) {
				ps.close();
			}
			ps.close();
		}
		catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	public static long createProduct(Connection conn,Product product,long idCatalog) {
		
		String sql = "INSERT INTO products(CatalogId,Name,Status,DateCreated,UserCreated) values(?,?,?,?,?)";
		try {
			long result = 0;
			PreparedStatement ps = conn.prepareStatement(sql);
			String LAST_INSERT_ID = "SELECT LAST_INSERT_ID()";
			ps.setLong(1,idCatalog);
			ps.setString(2, product.getName());
			ps.setInt(3, 0);
			ps.setNString(4, product.getDateCreated());
			ps.setNString(5, product.getUserCreated());
			if(ps.executeUpdate()!=0) {
				PreparedStatement pss = conn.prepareStatement(LAST_INSERT_ID);
				ResultSet rs = pss.executeQuery();
				while(rs.next()) {
					result = rs.getInt(1);
				}
				ps.close();
			}
			ps.close();
			return result;
		}
		catch (Exception e) {
			System.out.println(e.toString());
		}
		return 0;
	}
	
	public static List<Product> getAllOfProducts(Connection conn){
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT * FROM products WHERE Status = 1";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getLong("Id"));
				product.setName(rs.getString("Name"));
				product.setDescription(rs.getString("Content"));
				product.setContent(rs.getString("Description"));
				product.setPrice(rs.getLong("Price"));
				product.setPromotionPrice(rs.getLong("PromotionPrice"));
				product.setImage(rs.getString("Image"));
				product.setImageList(rs.getString("ImageList"));
				product.setWarranty( rs.getInt("Warranty"));
				product.setStatus(rs.getBoolean("Status"));
				list.add(product);
			}
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public static List<Product> findProductById(Connection conn,long id){
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT * FROM products WHERE Id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getLong("Id"));
				product.setName(rs.getString("Name"));
				product.setDescription(rs.getString("Description"));
				product.setContent(rs.getString("Content"));
				product.setPrice(rs.getLong("Price"));
				product.setPromotionPrice(rs.getLong("PromotionPrice"));
				product.setImage(rs.getString("Image"));
				product.setImageList(rs.getString("ImageList"));
				product.setWarranty( rs.getInt("Warranty"));
				product.setStatus(rs.getBoolean("Status"));
				product.setDateCreated(rs.getNString("DateCreated"));
				product.setUserCreated(rs.getString("UserCreated"));
				product.setUserModified(rs.getString("UserModified"));
				product.setDateModified(rs.getString("DateModified"));
				list.add(product);
			}
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static void updateProductById(Connection conn,Product product) {
		String sql = "UPDATE products SET Name = ?, Price = ?, "
				+ "PromotionPrice = ?, Warranty = ?, "
				+ "DateModified = ? , UserModified = ? WHERE Id = ?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setNString(1, product.getName());
			ps.setLong(2, product.getPrice());
			ps.setLong(3, product.getPromotionPrice());
			ps.setLong(4, product.getWarranty());
			ps.setNString(5, product.getDateModified());
			ps.setNString(6, product.getUserModified());
			ps.setLong(7, product.getId());
			
			if(ps.executeUpdate()!=0) {
				ps.close();
			}
			ps.close();
		}
		catch (Exception e) {
			System.out.println(e.toString());
		}
		
	}
	
	public static void updateImageOfProduct(Connection conn,long idOfProduct,String nameOfImage) {
		String sql = "UPDATE products SET Image = ? WHERE Id = ? ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setNString(1, nameOfImage);
			ps.setLong(2, idOfProduct);
			
			if(ps.executeUpdate()!=0) {
				ps.close();
			}
			ps.close();
		}
		catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	public static int countRowOfProduct(Connection conn) 
	{
		String sql="SELECT count(*) FROM products";
		int count = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
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
	
	public static List<Product> paginationProducts(Connection conn,int start,int count){
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT * FROM products limit "+(start - 1)+", "+count+"";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getLong("Id"));
				product.setName(rs.getString("Name"));
				product.setDescription(rs.getString("Description"));
				product.setContent(rs.getString("Content"));
				product.setPrice(rs.getLong("Price"));
				product.setPromotionPrice(rs.getLong("PromotionPrice"));
				product.setImage(rs.getString("Image"));
				product.setImageList(rs.getString("ImageList"));
				product.setWarranty( rs.getInt("Warranty"));
				product.setStatus(rs.getBoolean("Status"));
				list.add(product);
			}
				ps.close();
				rs.close();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return  list;
	}
	
	public static void updateStatusOfProduct(Connection conn,long id,boolean status) {
		try {
			String sql= "";
			if(status) 
			{
				sql += "UPDATE products SET Status = 1 WHERE Id = ? ";
			}
			else 
			{
				sql += "UPDATE products SET Status = 0 WHERE Id = ? ";
			}
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(1, id);
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
	
	public static int deleteProductById(Connection conn,long id) {
		String sql = "DELETE FROM products WHERE Id = ?;";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(1,id);
			if(ps.executeUpdate()!=0) {
				ps.close();
			}
			ps.close();
			return 1;
		}
		catch (Exception e) {
			System.out.println(e.toString());
		}
		return 0;
	}
	
	
	public static Product  getProductByName(Connection conn,String nameOfProduct){
		Product product  = new Product();
		String sql = "SELECT * FROM products WHERE Name = ?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setNString(1, nameOfProduct);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				product.setId(rs.getLong("Id"));
				product.setName(rs.getString("Name"));
				product.setDescription(rs.getString("Description"));
				product.setContent(rs.getString("Content"));
				product.setPrice(rs.getLong("Price"));
				product.setPromotionPrice(rs.getLong("PromotionPrice"));
				product.setImage(rs.getString("Image"));
				product.setImageList(rs.getString("ImageList"));
				product.setWarranty( rs.getInt("Warranty"));
				product.setStatus(rs.getBoolean("Status"));
			}
				ps.close();
				rs.close();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return  product;
	}
	public static Product findProductByIdd(Connection conn,long id){
		Product product = new Product();
		String sql = "SELECT * FROM products WHERE Id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				product.setId(rs.getLong("Id"));
				product.setName(rs.getString("Name"));
				product.setDescription(rs.getString("Description"));
				product.setContent(rs.getString("Content"));
				product.setPrice(rs.getLong("Price"));
				product.setPromotionPrice(rs.getLong("PromotionPrice"));
				product.setImage(rs.getString("Image"));
				product.setImageList(rs.getString("ImageList"));
				product.setWarranty( rs.getInt("Warranty"));
				product.setStatus(rs.getBoolean("Status"));
				product.setDateCreated(rs.getNString("DateCreated"));
				product.setUserCreated(rs.getString("UserCreated"));
				product.setUserModified(rs.getString("UserModified"));
				product.setDateModified(rs.getString("DateModified"));
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}
	
	public static void updateDescriptionAndContentOfProduct(Connection conn,Long id,String description,String content) {
		try {
				String sql = "UPDATE products SET Description = ?, Content = ? WHERE Id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setNString(1, description);
			ps.setNString(2, content);
			ps.setLong(3, id);
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
	
	
	
	public static List<Product> getAllProductsByBrands(Connection conn,String catalogStr){
		List<Product> list = new ArrayList<Product>();
		String sql = "Select * FROM products WHERE products.CatalogId in (SELECT catalogs.Id FROM catalogs WHERE catalogs.Name = ? ) and products.Status = 1";
		try {
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, catalogStr);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getLong("Id"));
				product.setName(rs.getString("Name"));
				product.setDescription(rs.getString("Content"));
				product.setContent(rs.getString("Description"));
				product.setPrice(rs.getLong("Price"));
				product.setPromotionPrice(rs.getLong("PromotionPrice"));
				product.setImage(rs.getString("Image"));
				product.setImageList(rs.getString("ImageList"));
				product.setWarranty( rs.getInt("Warranty"));
				product.setStatus(rs.getBoolean("Status"));
				list.add(product);
			}
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public static List<Product> findProductsByName(Connection conn,String nameProduct){
		List<Product> list = new ArrayList<Product>();
		String sql="SELECT products.Id,products.Name,products.Price,products.Image,MATCH (Name) "
				+ "AGAINST (?) as score FROM products WHERE products.Status = 1 MATCH(Name) "
				+ "AGAINST (? IN NATURAL LANGUAGE MODE) > 0.1 ORDER BY score DESC";
		try {
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, nameProduct);
			ps.setString(2, nameProduct);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getLong("Id"));
				product.setName(rs.getString("Name"));
				product.setPrice(rs.getLong("Price"));
				product.setImage(rs.getString("Image"));
				list.add(product);
			}
			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
}
