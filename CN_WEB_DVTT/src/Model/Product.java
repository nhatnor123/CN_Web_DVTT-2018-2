package Model;
import java.util.List;
public class Product {
	private int id;
	private String name;
	private int price;
	private String description;
	private List<ProductImage> listImage;
	private List<ProductSize> listSize;
	private List<ProductColor> listColor;
	private Category category;
	
	public Product() {
		
	}
	public Product(int id, String name, int price, String description, List<ProductImage> listImage,
			List<ProductSize> listSize, List<ProductColor> listColor, Category category) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.description = description;
		this.listImage = listImage;
		this.listSize = listSize;
		this.listColor = listColor;
		this.category = category;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<ProductImage> getListImage() {
		return listImage;
	}
	public void setListImage(List<ProductImage> listImage) {
		this.listImage = listImage;
	}
	public List<ProductSize> getListSize() {
		return listSize;
	}
	public void setListSize(List<ProductSize> listSize) {
		this.listSize = listSize;
	}
	public List<ProductColor> getListColor() {
		return listColor;
	}
	public void setListColor(List<ProductColor> listColor) {
		this.listColor = listColor;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
	
	
	
}
