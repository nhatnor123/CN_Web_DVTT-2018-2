package Model;

import java.sql.Timestamp;

public class OrderDetail {

	private int orderDetail_id;
	private int quantity;
	private int product_id;
	private int order_id;
	private int commented;;

	public OrderDetail(int orderDetail_id, int quantity, int product_id, int order_id, int commented) {
		super();
		this.orderDetail_id = orderDetail_id;
		this.quantity = quantity;
		this.product_id = product_id;
		this.order_id = order_id;
		this.commented = commented;
	}

	public OrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getOrderDetail_id() {
		return orderDetail_id;
	}

	public void setOrderDetail_id(int orderDetail_id) {
		this.orderDetail_id = orderDetail_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getCommented() {
		return commented;
	}

	public void setCommented(int commented) {
		this.commented = commented;
	}

}
