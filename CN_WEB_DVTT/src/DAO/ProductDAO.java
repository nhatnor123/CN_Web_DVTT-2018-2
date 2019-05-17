package DAO;
import java.util.ArrayList;
import java.util.Date;

import Model.Category;
import Model.Product;
import Model.ProductColor;

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
		String sql = "UPDATE products SET pr_name = ?,price = ?,description = ? WHERE product_id = ?;";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setString(1,pr.getName() );
			ps.setInt(2, pr.getPrice());
			ps.setString(3, pr.getDescription());
			ps.setInt(4, pr.getId());
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
	
	
	
	public ArrayList<ProductColor> getListProductInWarehouse(int productId){
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT * FROM `database`.product_color natural join `database`.productsize where product_id = '"+productId+"';";
		ArrayList<ProductColor> listProductColor_Size = new ArrayList<ProductColor>();
		try {
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ProductColor pr = new ProductColor();
				pr.setProductColor_id(rs.getInt("idproduct_color"));
				pr.setProduct_id(rs.getInt("product_id"));
				pr.setColor(rs.getString("color"));
				pr.setImage(rs.getString("image"));
				pr.setSize_id(rs.getInt("size_id"));
				pr.setSize(rs.getString("size"));
				pr.setQuantity(rs.getInt("quantity"));
				listProductColor_Size.add(pr);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listProductColor_Size;
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
	
	public int addColorProduct(ProductColor prColor) {
		Connection conn = DBConnection.getConnection();
		String sql = "INSERT INTO `database`.`product_color` (`product_id`, `color`) VALUES (?, ?);";
		try {
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			ps.setInt(1, prColor.getProduct_id());
			ps.setString(2, prColor.getColor());
			ps.executeUpdate();
			
			ResultSet lastId = ps.getGeneratedKeys();
			if (lastId.next()) {
	            return lastId.getInt(1);
	        }
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return 0;
	}
	
	public boolean importQuantityProductSize(ProductColor prColor , int productColor_id) {
		Connection conn = DBConnection.getConnection();
		String sql = "INSERT INTO `database`.`productsize` (`quantity`, `size`, `idproduct_color`) VALUES (?, ?, ?);";
		try {
			PreparedStatement ps = (PreparedStatement) conn.prepareStatement(sql);
			ps.setInt(1, prColor.getQuantity());
			ps.setString(2, prColor.getSize());
			ps.setInt(3, productColor_id);
			ps.executeUpdate();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}
	
	public static void main(String[] args) throws SQLException {
		ProductColor prc = new ProductColor();
		ProductDAO productDAO = new ProductDAO();
		ArrayList<Product> listProductMale = new ArrayList<Product>();
		ArrayList<Product> listProductFeMale = new ArrayList<Product>();
		ArrayList<Category> listCategory = new CategoryDAO().getListCategory();
		for(Category c : listCategory) {
			if(c.getSex().equals("1")) {
				ArrayList<Product> listProduct = (ArrayList<Product>) productDAO.getListProductHot(c.getId());
				listProductMale.addAll(listProduct);
			}else {
				ArrayList<Product> listProduct = (ArrayList<Product>) productDAO.getListProductHot(c.getId());
				listProductFeMale.addAll(listProduct);
			}
		}
//		prc.setProduct_id(50);
//		prc.setColor("Blue")
//		prc.setQuantity(5);
//		prc.setSize("M");
//		int product_color_id = new ProductDAO().addColorProduct(prc);
//		System.out.println(product_color_id);
//		System.out.println(new ProductDAO().importQuantityProductSize(prc, product_color_id));
		for(Product p : listProductMale) {
			System.out.println(p.getName()+"-"+p.getId()+"-"+p.getAvatar());
		}
	}
	
	
}
