package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.mysql.jdbc.PreparedStatement;

import DBConnection.DBConnection;
import Model.Order;

public class OrderDao {

	public int insertOrder(Order order) {
		Connection cons = DBConnection.getConnection();
		Date now = new Date();
		String sql = "INSERT INTO `database`.`orders` (`user_id`, `address`, `phone`, `pay`, `created_at`, `updated_at`,`email`, `status`) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
		try {
			PreparedStatement ps = (PreparedStatement) cons.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			ps.setInt(1, order.getUser().getId());
			ps.setString(2, order.getAddress());
			ps.setString(3, order.getPhone());
			ps.setLong(4, order.total()+30000);
			ps.setTimestamp(5, new Timestamp(now.getTime()));
			ps.setTimestamp(6, new Timestamp(now.getTime()));
			ps.setString(7, order.getUser().getEmail());
			ps.setString(8, "Chờ xử lý");
			ps.executeUpdate();
			
			ResultSet lastId = ps.getGeneratedKeys();
			if (lastId.next()) {
	            return lastId.getInt(1);
	        }
		} catch (SQLException ex) {
			Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return 0;
	}
	
	public ArrayList<Order> getListBillByUserID(int userID) throws SQLException {
		Connection cons = DBConnection.getConnection();
		String sql = "SELECT * FROM `database`.orders WHERE user_id = '"+userID+"';";
		PreparedStatement ps = (PreparedStatement) cons.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Order> list = new ArrayList<>();
		while (rs.next()) {
			Order order = new Order();
			order.setId(rs.getInt("order_id"));
			order.setAddress(rs.getString("address"));
			order.setPhone(rs.getString("phone"));
			order.setPay(rs.getInt("pay"));
			order.setStatus(rs.getString("status"));
			order.setCreate_at(rs.getTimestamp("created_at"));
			list.add(order);
		}
		return list;

	}
	
	public Order getOrderByOrderIdID(int orderId) throws SQLException {
		Connection cons = DBConnection.getConnection();
		String sql = "SELECT * FROM `database`.orders WHERE order_id = '"+orderId+"';";
		PreparedStatement ps = (PreparedStatement) cons.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Order> list = new ArrayList<>();
		Order order = new Order();
		while (rs.next()) {
			order.setId(rs.getInt("order_id"));
			order.setAddress(rs.getString("address"));
			order.setPhone(rs.getString("phone"));
			order.setPay(rs.getInt("pay"));
			order.setStatus(rs.getString("status"));
			order.setCreate_at(rs.getTimestamp("created_at"));
			order.setUpdate_at(rs.getTimestamp("updated_at"));
		}
		return order;

	}
	
	
}
