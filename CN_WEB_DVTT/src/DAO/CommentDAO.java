package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.mysql.jdbc.PreparedStatement;

import DBConnection.DBConnection;
import Model.Category;
import Model.Comment;
import Model.Order;

public class CommentDAO {

	public boolean insertComment(Comment comment) {
		Connection cons = DBConnection.getConnection();
		Date now = new Date();
		String sql = "INSERT INTO `database`.`comments` ( `title`, `content`, `star`, `user_id`, `product_id`,`created_at`, `updated_at`) VALUES (?, ?, ?, ?, ?, ?, ?);";
		try {
			PreparedStatement ps = (PreparedStatement) cons.prepareStatement(sql,
					PreparedStatement.RETURN_GENERATED_KEYS);
			ps.setString(1, comment.getTitle());
			ps.setString(2, comment.getContent());
			ps.setInt(3, comment.getStar());
			ps.setLong(4, comment.getUser_id());
			ps.setInt(5, comment.getProduct_id());
			ps.setTimestamp(6, new Timestamp(now.getTime()));
			ps.setTimestamp(7, new Timestamp(now.getTime()));
			ps.executeUpdate();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}
	
	public ArrayList<Comment> getListCommentProduct(int product_id) throws SQLException{
		Connection cons = DBConnection.getConnection();
		String sql = "SELECT * FROM `database`.comments WHERE product_id = '"+product_id+"';";
		PreparedStatement ps = (PreparedStatement) cons.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<Comment> listCommentProduct = new ArrayList<Comment>();
		while (rs.next()) {
			Comment comment = new Comment();
			comment.setId(rs.getInt("comment_id"));
			comment.setTitle(rs.getString("title"));
			comment.setContent(rs.getString("content"));
			comment.setStar(rs.getInt("star"));
			comment.setUser_id(rs.getInt("user_id"));
			comment.setProduct_id(rs.getInt("product_id"));
			comment.setCreate_at(rs.getTimestamp("created_at"));
			comment.setUpdate_at(rs.getTimestamp("updated_at"));
			listCommentProduct.add(comment);
		}
		return listCommentProduct;
		
	}


}
