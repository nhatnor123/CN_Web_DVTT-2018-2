package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import DBConnection.DBConnection;
import Model.Category;

public class CategoryDAO {
	
	public ArrayList<Category> getListCategory() throws SQLException {
		Connection cons = DBConnection.getConnection();
		String sql = "SELECT * FROM `database`.categories;";
		ArrayList<Category> list = new ArrayList<>();
		try {
			PreparedStatement ps = (PreparedStatement) cons.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Category category = new Category();
				category.setId(rs.getInt("category_id"));
				category.setName(rs.getString("name"));
				category.setSex(rs.getString("sex"));
				list.add(category);
			}
			cons.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static void main(String[] args) throws SQLException {
		ArrayList<Category> listCategory = new CategoryDAO().getListCategory();
		for(Category c : listCategory) {
			System.out.println(c.getName());
		}
	}
	
}

