package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import java.sql.PreparedStatement;

import DBConnection.DBConnection;
import Model.User;
public class UserDAO {

	
	// kiem tra email ton tai chua
	public boolean checkEmail(String email) throws SQLException {
		Connection cons = DBConnection.getConnection();
		String sql = "SELECT * FROM `database`.users WHERE email = '" + email + "'";
		try {
			PreparedStatement ps = (PreparedStatement) cons.prepareCall(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				return true;
			}
			cons.close();
		} catch (SQLException e) {
			Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
		}

		return false;

	}
	
	
	
	// kiem tra dang nhap
		public boolean checkLogin(String email, String password) throws SQLException {
			Connection cons = DBConnection.getConnection();
			String sql = "SELECT * FROM `database`.users WHERE email = '" + email + "' AND password = '" + password + "'";
			try {
				PreparedStatement ps = (PreparedStatement) cons.prepareCall(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					return true;
				}
				cons.close();
			} catch (SQLException e) {
				Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
			}

			return false;

		}
		public boolean isAdmin(String email, String password) {
				Connection cons = DBConnection.getConnection();
				String sql = "SELECT * FROM `database`.users WHERE email = '" + email + "' AND password = '" + password + "' AND level = 3";
				try {
					PreparedStatement ps = (PreparedStatement) cons.prepareCall(sql);
					ResultSet rs = ps.executeQuery();
					while (rs.next()) {
						return true;
					}
					cons.close();
				} catch (SQLException e) {
					Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
				}

				return false;
		}
	public boolean insertUser(User u) throws SQLException {
		Connection cons = DBConnection.getConnection();
		Date now = new Date();
		String sql = "INSERT INTO `database`.`users` (`name`, `email`, `password`, `level`,`address`, `avatar`, `phone`, `created_at`, `updated_at`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
		try {
			PreparedStatement ps = (PreparedStatement) cons.prepareCall(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setInt(4, u.getLevel());
			ps.setString(5, u.getAddress());
			ps.setString(6, u.getAvatar());
			ps.setString(7, u.getPhone());
			ps.setTimestamp(8, new Timestamp(now.getTime()));
			ps.setTimestamp(9, new Timestamp(now.getTime()));
			ps.executeUpdate();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}

	public User getUserbyEmail(String email) throws SQLException {
		Connection cons = DBConnection.getConnection();
		String sql = "SELECT * FROM `database`.users WHERE email = ?";
		PreparedStatement ps = (PreparedStatement) cons.prepareStatement(sql);
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		User user = new User();
		while (rs.next()) {
			user.setId(rs.getInt("id"));
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setLevel(rs.getInt("level"));
			user.setAddress(rs.getString("address"));
			user.setAvatar(rs.getString("avatar"));
			user.setPhone(rs.getString("phone"));
		}
		return user;

	}
	
	public User getUserbyId(int user_id) throws SQLException {
		Connection cons = DBConnection.getConnection();
		String sql = "SELECT * FROM `database`.users WHERE id = '"+user_id+"'";
		PreparedStatement ps = (PreparedStatement) cons.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		User user = new User();
		while (rs.next()) {
			user.setId(rs.getInt("id"));
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setLevel(rs.getInt("level"));
			user.setAddress(rs.getString("address"));
			user.setAvatar(rs.getString("avatar"));
			user.setPhone(rs.getString("phone"));
		}
		return user;

	}
	public List<User> getListUser() throws SQLException {
		List<User> list = new ArrayList<User>();
		Connection cons = DBConnection.getConnection();
		String sql = "SELECT * FROM `database`.users";
		PreparedStatement ps = (PreparedStatement) cons.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
	
		while (rs.next()) {
			User user = new User();
			user.setId(rs.getInt("id"));
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setLevel(rs.getInt("level"));
			user.setAddress(rs.getString("address"));
			user.setAvatar(rs.getString("avatar"));
			user.setPhone(rs.getString("phone"));
			list.add(user);
		}
		return list;

	}
	
	public User Login(String email, String password) throws SQLException {
		Connection cons = DBConnection.getConnection();
		String sql = "SELECT * FROM `database`.users WHERE email = '" + email + "' AND password = '" + password + "'";
		PreparedStatement ps = (PreparedStatement) cons.prepareStatement(sql);
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		User user = new User();
		while (rs.next()) {
			user.setId(rs.getInt("id"));
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setLevel(rs.getInt("level"));
			user.setAddress(rs.getString("address"));
			user.setAvatar(rs.getString("avatar"));
			user.setPhone(rs.getString("phone"));
		}
		return user;

	}
	
	public boolean updatePassword(String password,String email) throws SQLException {
		Connection cons = DBConnection.getConnection();
        String sql = "UPDATE `database`.`users` SET `password` = ?, `updated_at` = ? WHERE (`email` = ?);";

        try {
            PreparedStatement ps = (PreparedStatement) cons.prepareCall(sql);
            ps.setString(1, password);
            ps.setTimestamp(2,new Timestamp(new Date().getTime()));
            ps.setString(3, email);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
	
	public boolean updateOtherInfo(User u) {
		Connection cons = DBConnection.getConnection();
		String sql = "UPDATE `database`.`users` SET `name` = ?, `address` = ?, `avatar` = ?, `phone` = ?, `updated_at` = ? WHERE (`email` = ?);";
		try {
            PreparedStatement ps = (PreparedStatement) cons.prepareCall(sql);
            ps.setString(1, u.getName());
            ps.setString(2, u.getAddress());
            ps.setString(3, u.getAvatar());
            ps.setString(4, u.getPhone());
            ps.setTimestamp(5,new Timestamp(new Date().getTime()));
            ps.setString(6, u.getEmail());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
		
	}
	public boolean deleteUser(int id) {
		Connection conn = DBConnection.getConnection();
		String sql = "DELETE FROM users WHERE id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			conn.close();
			return true;
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return false;
	}
	public boolean updateLevel(User user) {
		Connection conn = DBConnection.getConnection();
		String sql = "UPDATE users SET level = ? WHERE id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, user.getLevel());
			ps.setInt(2, user.getId());
			ps.executeUpdate();
			conn.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public static void main(String[] args) throws SQLException {
		UserDAO userDAO = new UserDAO();
		User user = new User(0, "nguyen dep ", "hahahaha@gmail.com", "", 1,"Quảng Xương - Thanh Hóa" ,"nguyendeptrai.jpg", "0947060528");
		System.out.println(userDAO.getUserbyId(15).getAvatar());
//		System.out.println(userDAO.updatePassword("11041998bkhn", "sljflksajfklsdjf@gmail.com"));
	}

}
