package DAO;
import java.util.ArrayList;
import java.util.Date;

import Model.Category;
import Model.Product;
import Model.Size;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.mysql.jdbc.PreparedStatement;

import DBConnection.DBConnection;

import java.sql.*;
import Model.Product;
 
public class ProductDAO {

	
	public boolean addProduct(Product pr) {
		String sql = "INSERT INTO products(pr_name,price,avatar,description,category_id,created_at,updated_at) VALUES(?,?,?,?,?,?,?)";
		Connection conn  = DBConnection.getConnection();
		Date now = new Date();
		try {
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
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
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setInt(1, prID);
			ps.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean update(Product pr) {
		String sql = "UPDATE products SET pr_name = ?,price = ?,description = ?,avatar = ? WHERE product_id = ?;";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setString(1,pr.getName() );
			ps.setInt(2, pr.getPrice());
			ps.setString(3, pr.getDescription());
			ps.setString(4,pr.getAvatar());
			ps.setInt(5, pr.getId());
			ps.executeUpdate();
			conn.close();
			return true;
		} catch (SQLException e) {
			System.out.println("Có lỗi update sản phẩm");
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean importProduct() {
		return false;
		
	}
	
	public ArrayList<Product> getListProductByCategory(long category_id) throws SQLException {
			Connection connection = DBConnection.getConnection();
	        String sql = "SELECT * FROM `database`.products WHERE category_id = '" + category_id + "'";
	        PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
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
        PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
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
	
	public Product getProductById(long product_id) throws SQLException {
		Connection connection = DBConnection.getConnection();
        String sql = "SELECT * FROM `database`.products WHERE product_id = '" + product_id + "'";
        PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Product product = new Product();
        while (rs.next()) {
            product.setId(rs.getInt("product_id"));
            product.setName(rs.getString("pr_name"));
            product.setPrice(rs.getInt("price"));
            product.setAvatar(rs.getString("avatar"));
            product.setDescription(rs.getString("description"));
            product.setCategory_id(rs.getInt("category_id"));
            
        }
        return product;
    }
	
	public List<Product> getListProduct(){
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT * FROM `database`.products;";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product pr = new Product();
				pr.setId(rs.getInt("product_id"));
				pr.setName(rs.getString("pr_name"));
				pr.setPrice(rs.getInt("price"));
				pr.setAvatar(rs.getString("avatar"));
				pr.setDescription(rs.getString("description"));
				pr.setCategory_id(rs.getInt("category_id"));
				pr.setUpdate_at(rs.getTimestamp("updated_at"));
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
	
	public List<Product> getListProductHot(int category_id){
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT * FROM `database`.order_details natural join `database`.products \r\n" + 
				"where category_id = '"+category_id+"'\r\n" + 
				"group by `product_id`\r\n" + 
				"order by quantity desc\r\n" + 
				"limit 10;";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product pr = new Product();
				pr.setId(rs.getInt("product_id"));
				pr.setName(rs.getString("pr_name"));
				pr.setPrice(rs.getInt("price"));
				pr.setAvatar(rs.getString("avatar"));
				pr.setDescription(rs.getString("description"));
				pr.setCategory_id(rs.getInt("category_id"));
				pr.setUpdate_at(rs.getTimestamp("updated_at"));
				list.add(pr);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Product> getListProductNew(){
		List<Product> list = new ArrayList<Product>();
		String sql = "SELECT * FROM `database`.products order by product_id desc limit 10;";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Product pr = new Product();
				pr.setId(rs.getInt("product_id"));
				pr.setName(rs.getString("pr_name"));
				pr.setPrice(rs.getInt("price"));
				pr.setAvatar(rs.getString("avatar"));
				pr.setDescription(rs.getString("description"));
				pr.setCategory_id(rs.getInt("category_id"));
				pr.setUpdate_at(rs.getTimestamp("updated_at"));
				list.add(pr);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
	
	public int getQuantityBySize(int size_id) throws SQLException {
		int quantity = 0;
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT quantity FROM `database`.productsize where size_id = '"+size_id+"';";
		PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		 while (rs.next()) {
			quantity =  rs.getInt("quantity");
		 }
		return quantity;
		
	}
	
	public boolean importQuantityBySize(int size_id, int quantity) {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE `database`.`productsize` SET `quantity` = '"+quantity+"' WHERE (`size_id` = '"+size_id+"');";
		try {
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.executeUpdate();
			conn.close();
			return true;
		} catch (SQLException e) {
			System.out.println("Có lỗi thêm số lượng sản phẩm");
			e.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<Product> getListProductByCategoryAndPage(int category_id, int page, int maxInEachPage,
			int modeSort) throws SQLException {
		Connection connection = DBConnection.getConnection();
//		String sql2 = "SELECT * FROM `database`.products WHERE category_id = '" + category_id + "' LIMIT '"
//				+ page * maxInEachPage + "' , '" + maxInEachPage + "'";
		String sql1 = "SELECT * FROM `database`.products WHERE category_id = '" + category_id + "' ORDER BY price ASC";
		String sql2 = "SELECT * FROM `database`.products WHERE category_id = '" + category_id + "' ORDER BY price DESC";
		String sql3 = "SELECT * FROM `database`.products WHERE category_id = '" + category_id
				+ "' ORDER BY pr_name ASC";
		String sql4 = "SELECT * FROM `database`.products WHERE category_id = '" + category_id
				+ "' ORDER BY pr_name DESC";
		String sql5 = "SELECT * FROM `database`.products WHERE category_id = '" + category_id + "' ORDER BY price ASC";

		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql1);
		if (modeSort == 2) {
			ps = (PreparedStatement) connection.prepareCall(sql2);
		} else if (modeSort == 3) {
			ps = (PreparedStatement) connection.prepareCall(sql3);
		} else if (modeSort == 4) {
			ps = (PreparedStatement) connection.prepareCall(sql4);
		} else if (modeSort == 5) {
			ps = (PreparedStatement) connection.prepareCall(sql5);
		}
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		ArrayList<Product> listByPage = new ArrayList<>();
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
		int count = 0;
		for (Product prd : list) {
			count++;
			if (count > (page - 1) * maxInEachPage && count <= (page) * maxInEachPage) {
//				System.out.println(prd.getName());
				listByPage.add(prd);
			}
		}

		return listByPage;
	}

	public int getNumberOfPageListProductByCategory(long category_id, int maxInEachPage) throws SQLException {
		Connection connection = DBConnection.getConnection();
//		String sql2 = "SELECT * FROM `database`.products WHERE category_id = '" + category_id + "' LIMIT '"
//				+ page * maxInEachPage + "' , '" + maxInEachPage + "'";
		String sql = "SELECT * FROM `database`.products WHERE category_id = '" + category_id + "'";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		ArrayList<Product> listByPage = new ArrayList<>();
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
		return (list.size()) / maxInEachPage + 1;
	}
	
	public ArrayList<Product> searchListProductByCategoryAndPage(String str, int page, int maxInEachPage, int modeSort)
			throws SQLException {
		Connection connection = DBConnection.getConnection();
//		String sql2 = "SELECT * FROM `database`.products WHERE category_id = '" + category_id + "' LIMIT '"
//				+ page * maxInEachPage + "' , '" + maxInEachPage + "'";
		String sql1 = "SELECT * FROM `database`.products WHERE pr_name 	LIKE '%" + str + "%' ORDER BY price ASC";
		String sql2 = "SELECT * FROM `database`.products WHERE pr_name 	LIKE '%" + str + "%' ORDER BY price DESC";
		String sql3 = "SELECT * FROM `database`.products WHERE pr_name 	LIKE '%" + str + "%' ORDER BY pr_name ASC";
		String sql4 = "SELECT * FROM `database`.products WHERE pr_name 	LIKE '%" + str + "%' ORDER BY pr_name DESC";
		String sql5 = "SELECT * FROM `database`.products WHERE pr_name 	LIKE '%" + str + "%' ORDER BY price ASC";

		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql1);
		if (modeSort == 2) {
			ps = (PreparedStatement) connection.prepareCall(sql2);
		} else if (modeSort == 3) {
			ps = (PreparedStatement) connection.prepareCall(sql3);
		} else if (modeSort == 4) {
			ps = (PreparedStatement) connection.prepareCall(sql4);
		} else if (modeSort == 5) {
			ps = (PreparedStatement) connection.prepareCall(sql5);
		}
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		ArrayList<Product> listByPage = new ArrayList<>();
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
		int count = 0;
		for (Product prd : list) {
			count++;
			if (count > (page - 1) * maxInEachPage && count <= (page) * maxInEachPage) {
//				System.out.println(prd.getName());
				listByPage.add(prd);
			}
		}

		return listByPage;
	}

	public int getSizeListProductBySearchCategory(String str, int maxInEachPage) throws SQLException {
		Connection connection = DBConnection.getConnection();
//		String sql2 = "SELECT * FROM `database`.products WHERE category_id = '" + category_id + "' LIMIT '"
//				+ page * maxInEachPage + "' , '" + maxInEachPage + "'";
		String sql = "SELECT * FROM `database`.products WHERE pr_name LIKE '%" + str + "%'";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Product> list = new ArrayList<>();
		ArrayList<Product> listByPage = new ArrayList<>();
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
		return (list.size()) ;
	}
	
	public ArrayList<Product> searchProduct(String str) throws SQLException {
		Connection connection = DBConnection.getConnection();
		String sql = "SELECT * FROM `database`.products where pr_name LIKE '%" + str + "%';";
		PreparedStatement ps = (PreparedStatement) connection.prepareCall(sql);
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
	
	
	
	public static void main(String[] args) throws SQLException {
		ProductDAO productDAO = new ProductDAO();
		ArrayList<Product> listProducSearch = new ArrayList<Product>();
		listProducSearch = productDAO.searchProduct("áo nỉ");
		for(Product p : listProducSearch) {
			System.out.println(p.getName());
		}

	}
	
	
	
	
	
}
