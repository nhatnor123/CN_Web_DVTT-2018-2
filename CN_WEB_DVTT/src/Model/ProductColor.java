package Model;

public class ProductColor {
	private int id;
	private int productID;
	private String color;
	
	public ProductColor() {
		
	}
	public ProductColor(int id, int productID, String color) {
		super();
		this.id = id;
		this.productID = productID;
		this.color = color;
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
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
}
