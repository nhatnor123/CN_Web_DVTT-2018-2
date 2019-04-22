package Model;

public class Category {
	private int id;
	private int productID;
	private String name;
	
	
	public Category() {
		
	}
	public Category(int id, int productID, String name) {
		super();
		this.id = id;
		this.productID = productID;
		this.name = name;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
