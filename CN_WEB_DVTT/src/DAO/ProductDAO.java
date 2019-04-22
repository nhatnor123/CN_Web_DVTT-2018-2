package DAO;
import java.util.ArrayList;
import Model.Product;
import java.util.List;

import DBConnection.DBConnection;

import java.sql.*;
import Model.Product;
 
public class ProductDAO {
	private Connection conn = null;
	private Statement statement = null;
	private PreparedStatement preStatement = null;
	private ResultSet result = null;
	
	public List<Product> getListProduct() throws SQLException {
		List<Product> list = new ArrayList<Product>();
		String sql = "Select * FROM products";
		conn = DBConnection.getConnection();
		preStatement = conn.prepareStatement(sql);
		result = preStatement.executeQuery();
		while(result.next()) {
			int id = result.getInt(1);
			Product product = new Product();
			product.setId(result.getInt(1));
			product.setName(result.getString(2));
			product.setPrice(result.getInt(3));
			product.setDescription(result.getString(4));
			product.setCategory(new CategoryDAO().getCategory(id));
			product.setListColor(new ProductColorDAO().getColorbyProductID(id));
			product.setListImage(new ProductImageDAO().getListImagebyProductID(id));
			product.setListSize(new ProductSizeDAO().getListSizebyProductID(id));
			list.add(product);
		}
		conn.close();
		
		
		
		return list;
	}
}
