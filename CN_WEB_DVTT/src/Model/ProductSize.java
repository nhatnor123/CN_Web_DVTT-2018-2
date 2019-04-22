package Model;

public class ProductSize {
	private int id;
	private int productID;
	private String size;
	public ProductSize() {
		
	}
	public ProductSize(int id, int productID, String size) {
		super();
		this.id = id;
		this.productID = productID;
		this.size = size;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	
}
