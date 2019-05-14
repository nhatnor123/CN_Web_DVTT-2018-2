package Model;

import java.util.ArrayList;

public class ProductColor {
	
	private int productColor_id;
	private int product_id;
	private String color;
	private String image;
	private int size_id;
	private String size;
	private int quantity;
	
	public ProductColor() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ProductColor(int productColor_id, int product_id, String color,String image, String size, int quantity, int size_id) {
		super();
		this.productColor_id = productColor_id;
		this.product_id = product_id;
		this.color = color;
		this.image = image ;
		this.size_id = size_id;
		this.size = size;
		this.quantity = quantity;
	}

	public int getProductColor_id() {
		return productColor_id;
	}
	public void setProductColor_id(int productColor_id) {
		this.productColor_id = productColor_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}

	public int getSize_id() {
		return size_id;
	}

	public void setSize_id(int size_id) {
		this.size_id = size_id;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	

}
