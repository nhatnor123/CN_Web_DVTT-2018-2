package DAO;

import java.sql.SQLException;

import Model.Item;
import Model.Order;
import Model.Product;
import Model.Size;

public class test {

	public static void main(String[] args) throws SQLException {
		// TODO A method stub
//		try {
//			System.out.println("hello");
//			Order order =  new OrderDao().getOrderByOrderIdID(8);
//			System.out.println(order.getUser().getName());
//			for(Item x:order.getItems()) {
//				System.out.println(x.getQuantity());
//				System.out.println(x.getPrice());
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	//	List<Product> list = new ProductDAO().getListProduct();
		Product pr = new ProductDAO().getProductById(51);
		for(Size size:pr.getSizes()) {
			System.out.println(size.getSize());
		}
			
	}

}
