package Model;

public class Banner {
	private int id;
	private String title;
	private String descripton;
	private String image;
	public Banner() {}
	public Banner(int id, String title, String descripton, String image) {
		super();
		this.id = id;
		this.title = title;
		this.descripton = descripton;
		this.image = image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescripton() {
		return descripton;
	}
	public void setDescripton(String descripton) {
		this.descripton = descripton;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}
