package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnection.DBConnection;
import Model.Size;

public class SizeDAO {
	public boolean insert(Size size) {
		String sql = "INSERT INTO productsize(product_id,name,quantity) VALUE(?,?,?)";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, size.getProductId());
			ps.setString(2, size.getSize());
			ps.setInt(3, size.getQuantity());
			ps.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean update(Size size) {
		String sql = "UPDATE productsize SET name = ?, quantity = ? WHERE id = ?";
		Connection conn = DBConnection.getConnection();
		PreparedStatement ps;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, size.getSize());
			ps.setInt(2, size.getQuantity());
			ps.setInt(3, size.getId());
			ps.execute();
			conn.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		return false;
	}
	public List<Size> getSizeByPrId(int prId){
		Connection conn = DBConnection.getConnection();
		List<Size> list = new ArrayList<Size>();
		String sql = "SELECT * FROM productsize WHERE product_id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, prId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Size size = new Size();
				size.setId(rs.getInt(1));
				size.setProductId(rs.getInt(2));
				size.setSize(rs.getString(3));
				size.setQuantity(rs.getInt(4));
				list.add(size);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return list;
	}
	public Size getSizeById(int id) {
		Size size = new Size();
		String sql = "SELECT * FROM productsize WHERE id = ?";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				size.setId(rs.getInt(1));
				size.setProductId(rs.getInt(2));
				size.setSize(rs.getString(3));
				size.setQuantity(rs.getInt(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return size;
	}
}
