package Model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Product {
	private int id;
	private String name;
	private int price;
	private String avatar;
	private String description;
	private int category_id;
	private String size;
	private int quantity;
	private List<Size> sizes;
	private Timestamp created_at;
	private Timestamp updated_at;

	public Product() {
	}

	public Product(int id, String name, int price, String avatar, String description, int category_id, String size,int quantity) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.avatar = avatar;
		this.description = description;
		this.category_id = category_id;
		this.size = size;
		this.quantity = quantity;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
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

	public Timestamp getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Timestamp create_at) {
		this.created_at = create_at;
	}

	public Timestamp getUpdated_at() {
		return updated_at;
	}

	public void setUpdate_at(Timestamp updated_at) {
		this.updated_at = updated_at;
	}

	public List<Size> getSizes() {
		return sizes;
	}

	public void setSizes(List<Size> sizes) {
		this.sizes = sizes;
	}

}
