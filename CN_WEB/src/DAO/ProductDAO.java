package DAO;
import java.util.ArrayList;
import java.util.Date;

import Model.Product;
import Model.Size;

import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import DBConnection.DBConnection;

import java.sql.*;
import Model.Product;
 
public class ProductDAO {
//	private Connection conn = null;
//	private Statement statement = null;
//	private PreparedStatement preStatement = null;
//	private ResultSet result = null;
//	
//	public List<Product> getListProduct() throws SQLException {
//		conn = DBConnection.getConnection();
//		List<Product> list = new ArrayList<Product>();
//		String sql = "Select * FROM products";
//		
//		preStatement = conn.prepareStatement(sql);
//		result = preStatement.executeQuery();
//		while(result.next()) {
//			int id = result.getInt(1);
//			Product product = new Product();
//			product.setId(result.getInt(1));
//			product.setName(result.getString(2));
//			product.setPrice(result.getInt(3));
//			product.setDescription(result.getString(4));
//			product.setCategory(new CategoryDAO().getCategory(id));
//			product.setListColor(new ProductColorDAO().getColorbyProductID(id));
//			product.setListImage(new ProductImageDAO().getListImagebyProductID(id));
//			product.setListSize(new ProductSizeDAO().getListSizebyProductID(id));
//			list.add(product);
//		}
//		conn.close();
//		
//		
//		
//		return list;
//	}
	public boolean addProduct(Product pr) {
		String sql = "INSERT INTO products(pr_name,price,avatar,description,category_id,created_at,updated_at) VALUES(?,?,?,?,?,?,?)";
		Connection conn  = DBConnection.getConnection();
		Date now = new Date();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, pr.getName());
			ps.setInt(2, pr.getPrice());
			ps.setString(3, pr.getAvatar());
			ps.setString(4, pr.getDescription());
			ps.setInt(5, pr.getCategory_id());
			ps.setTimestamp(6, new Timestamp(now.getTime()));
			ps.setTimestamp(7, new Timestamp(now.getTime()));
			
			ps.executeUpdate();
			conn.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;	
	}
	public boolean deleteProduct(int prID) {
		String sql = "DELETE FROM products WHERE product_id = ?";
		Connection conn  = DBConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, prID);
			ps.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	public ArrayList<Product> getListProductByCategory(long category_id) throws SQLException {
			Connection connection = DBConnection.getConnection();
	        String sql = "SELECT * FROM `database`.products WHERE category_id = '" + category_id + "'";
	        PreparedStatement ps = connection.prepareCall(sql);
	        ResultSet rs = ps.executeQuery();
	        ArrayList<Product> list = new ArrayList<>();
	        while (rs.next()) {
	            Product product = new Product();
	            product.setId(rs.getInt("product_id"));
	            product.setName(rs.getString("pr_name"));
	            product.setPrice(rs.getInt("price"));
	            product.setAvatar(rs.getString("avatar"));
	            product.setDescription(rs.getString("description"));
	            product.setCategory_id(rs.getInt("category_id"));
	            list.add(product);
	        }
	        return list;
	    }
	
	public ArrayList<Product> getListProductNotComment() throws SQLException {
		Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM `database`.order_details natural join `database`.products WHERE commented = '0'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Product> list = new ArrayList<>();
        while (rs.next()) {
            Product product = new Product();
            product.setId(rs.getInt("product_id"));
            product.setName(rs.getString("pr_name"));
            product.setPrice(rs.getInt("price"));
            product.setAvatar(rs.getString("avatar"));
            product.setDescription(rs.getString("description"));
            product.setCategory_id(rs.getInt("category_id"));
            list.add(product);
        }
        return list;
    }
	public boolean update(Product pr) {
		String sql = "UPDATE products SET pr_name = ?,price = ?,description = ?, category_id = ? WHERE product_id = ?";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,pr.getName() );
			ps.setInt(2, pr.getPrice());
			
			ps.setString(3, pr.getDescription());
			ps.setInt(4, pr.getCategory_id());
			ps.setInt(5, pr.getId());
			ps.executeUpdate();
			conn.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public Product getProductById(long product_id) throws SQLException {
		Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM `database`.products WHERE product_id = '" + product_id + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Product product = new Product();
        while (rs.next()) {
            
            product.setId(rs.getInt("product_id"));
            product.setName(rs.getString("pr_name"));
            product.setPrice(rs.getInt("price"));
            product.setAvatar(rs.getString("avatar"));
            product.setDescription(rs.getString("description"));
            product.setCategory_id(rs.getInt("category_id"));
            product.setCreated_at(rs.getTimestamp("created_at"));
            List<Size> listSize = new SizeDAO().getSizeByPrId(rs.getInt("product_id"));
            product.setSizes(listSize);
            
        }
        return product;
    }
	public List<Product> getListProduct(){
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT * FROM products";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product pr = new Product();
				pr.setId(rs.getInt(1));
				pr.setName(rs.getString(2));
				pr.setPrice(rs.getInt(3));
				pr.setAvatar(rs.getString(4));
				pr.setDescription(rs.getString(5));
				pr.setCategory_id(rs.getInt(6));
				pr.setCreated_at(rs.getTimestamp("created_at"));
				List<Size> listSize = new SizeDAO().getSizeByPrId(rs.getInt("product_id"));
	            pr.setSizes(listSize);
				list.add(pr);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean insert(Product pr) {
		String sql  = "INSERT INTO products(pr_name,price,descripton,category_id,avatar) VALUES(?,?,?,?,?)";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, pr.getName());
			ps.setInt(2, pr.getPrice());
			ps.setString(3, pr.getDescription());
			ps.setInt(4, pr.getCategory_id());
			ps.setString(5, pr.getAvatar());
			ps.execute();
			conn.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
}
