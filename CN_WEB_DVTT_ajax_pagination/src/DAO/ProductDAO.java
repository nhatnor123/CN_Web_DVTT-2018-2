package DAO;

import java.util.ArrayList;
import Model.Product;
import java.util.List;

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

		PreparedStatement ps = connection.prepareCall(sql1);
		if (modeSort == 2) {
			ps = connection.prepareCall(sql2);
		} else if (modeSort == 3) {
			ps = connection.prepareCall(sql3);
		} else if (modeSort == 4) {
			ps = connection.prepareCall(sql4);
		} else if (modeSort == 5) {
			ps = connection.prepareCall(sql5);
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
		PreparedStatement ps = connection.prepareCall(sql);
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

		}
		return product;
	}

	public ArrayList<Product> searchProduct(String str) throws SQLException {
		Connection connection = DBConnection.getConnection();
		String sql = "SELECT * FROM `database`.products where pr_name LIKE '%" + str + "%';";
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

		PreparedStatement ps = connection.prepareCall(sql1);
		if (modeSort == 2) {
			ps = connection.prepareCall(sql2);
		} else if (modeSort == 3) {
			ps = connection.prepareCall(sql3);
		} else if (modeSort == 4) {
			ps = connection.prepareCall(sql4);
		} else if (modeSort == 5) {
			ps = connection.prepareCall(sql5);
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

	public int getNumberOfPageListProductBySearchCategory(String str, int maxInEachPage) throws SQLException {
		Connection connection = DBConnection.getConnection();
//		String sql2 = "SELECT * FROM `database`.products WHERE category_id = '" + category_id + "' LIMIT '"
//				+ page * maxInEachPage + "' , '" + maxInEachPage + "'";
		String sql = "SELECT * FROM `database`.products WHERE pr_name LIKE '%" + str + "%'";
		PreparedStatement ps = connection.prepareCall(sql);
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

}
