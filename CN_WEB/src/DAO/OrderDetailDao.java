package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

//import com.mysql.jdbc.PreparedStatement;
import java.sql.PreparedStatement;

import DBConnection.DBConnection;
import Model.Item;
import Model.Order;
import Model.OrderDetail;
import Model.Product;
import Model.User;

public class OrderDetailDao {
	
	public boolean insertOrderDetail(OrderDetail orderDetail) {
		Connection cons = DBConnection.getConnection();
		Date now = new Date();
		String sql = "INSERT INTO `database`.`order_details` (`product_id`, `quantity`, `order_id`,`commented`) VALUES (?,?,?,?);";
		try {
			PreparedStatement ps = (PreparedStatement) cons.prepareCall(sql);
			ps.setInt(1, orderDetail.getProduct_id());
			ps.setInt(2, orderDetail.getQuantity());
			ps.setInt(3, orderDetail.getOrder_id());
			ps.setInt(4, 0);
			ps.executeUpdate();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}
	
	public ArrayList<Item> getOrderDetail(int order_id) throws SQLException {
		Connection cons = DBConnection.getConnection();
		String sql = "SELECT * FROM order_details join products WHERE order_details.product_id = products.product_id and order_id = '"+order_id+"';";
		PreparedStatement ps = (PreparedStatement) cons.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Item> items = new ArrayList<Item>();
		while (rs.next()) {
			Product product = new Product();
			Item item = new Item();
			product.setId(rs.getInt("product_id"));
			product.setName(rs.getString("pr_name"));;
			product.setAvatar(rs.getString("avatar"));
			item.setProduct(product);
			item.setQuantity(rs.getInt("quantity"));
			item.setPrice(rs.getInt("price"));
			items.add(item);
		}
		return items;
		
	}
	
	public ArrayList<OrderDetail> getOrderDetailNotComment(int user_id ) throws SQLException {
		Connection cons = DBConnection.getConnection();
		String sql = "SELECT * FROM `database`.order_details natural join `database`.orders WHERE commented = '0' and user_id = '"+user_id+"';";
		PreparedStatement ps = (PreparedStatement) cons.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<OrderDetail> listOrderDetailNotComment = new ArrayList<OrderDetail>();
		while (rs.next()) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder_id(rs.getInt("order_id"));
			orderDetail.setProduct_id(rs.getInt("product_id"));
			orderDetail.setOrderDetail_id(rs.getInt("order_detail_id"));
			orderDetail.setCommented(rs.getInt("commented"));
			listOrderDetailNotComment.add(orderDetail);
		}
		return listOrderDetailNotComment;
		
	}
	
	public boolean updateCommentOrderDetail(int orderDetail_id) {
		Connection cons = DBConnection.getConnection();
		String sql = "UPDATE `database`.`order_details` SET `commented` = '1' WHERE (`order_detail_id` = '"+orderDetail_id+"');";
		try {
            PreparedStatement ps = (PreparedStatement) cons.prepareCall(sql);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
		
	}
	public boolean deleteByOrderId(int orderId) {
		Connection cons = DBConnection.getConnection();
		String sql = "DELETE FROM order_details WHERE product_id = ?";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, orderId);
			ps.execute();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	}
	

