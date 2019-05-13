package Model;

public class ProductSize {
	
	private int productSize_id;
	private int product_id;
	private String size;
	private int quantity;
	public ProductSize() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductSize(int productSize_id, int product_id, String size, int quantity) {
		super();
		this.productSize_id = productSize_id;
		this.product_id = product_id;
		this.size = size;
		this.quantity = quantity;
	}
	public int getProductSize_id() {
		return productSize_id;
	}
	public void setProductSize_id(int productSize_id) {
		this.productSize_id = productSize_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	

}
