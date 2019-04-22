package Model;

public class ProductImage {
	private int id;
	private int productID;
	private String image;
	public ProductImage() {
		
	}
	public ProductImage(int id, int productID, String image) {
		super();
		this.id = id;
		this.productID = productID;
		this.image = image;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
