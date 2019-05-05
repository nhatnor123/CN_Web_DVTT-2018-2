package Model;

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
	private String color;

	public Product() {
	}

	public Product(int id, String name, int price, String avatar, String description, int category_id, String size,
			String color) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.avatar = avatar;
		this.description = description;
		this.category_id = category_id;
		this.size = size;
		this.color = color;
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

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

}
