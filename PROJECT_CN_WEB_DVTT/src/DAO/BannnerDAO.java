package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBConnection.DBConnection;
import Model.Banner;

public class BannnerDAO {
	public boolean add(Banner ban) {
		String sql  = "INSERT INTO banner(title,description,images) VALUES(?,?,?)";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ban.getTitle());
			ps.setString(2, ban.getDescripton());
			ps.setString(3, ban.getImage());
			
			ps.execute();
			conn.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return false;
	}
	public boolean update(Banner ban) {
		String sql  = "UPDATE banner SET title  = ? WHERE id = ?";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, ban.getTitle());
			ps.setInt(2, ban.getId());
			ps.executeUpdate();
			conn.close();
			return true;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	public boolean delete(int id) {
		String sql = "DELETE FROM banner WHERE id =?";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.execute();
			conn.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	public List<Banner> getListBanner() {
		List<Banner> list = new ArrayList<Banner>();
		String sql = "SELECT * FROM banner";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Banner ban = new Banner();
				ban.setId(rs.getInt(1));
				ban.setTitle(rs.getString(4));
				ban.setDescripton(rs.getString(5));
				ban.setImage(rs.getString(6));
				list.add(ban);
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public Banner getBannerById(int id) {
		Banner ban = new Banner();
		String sql = "SELECT * FROM banner WHERE id = ?";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ban.setId(rs.getInt("id"));
				ban.setTitle(rs.getString("title"));
				ban.setDescripton(rs.getString("description"));
				ban.setImage(rs.getString("images"));
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ban;
	}
}
