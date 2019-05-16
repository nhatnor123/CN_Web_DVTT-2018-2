package Model;

import java.sql.Timestamp;

public class Comment {

	private int id;
	private String title;
	private String content;
	private int star;
	private int user_id;
	private User userComment;
	private int product_id;
	private Timestamp create_at;
	private Timestamp update_at;
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Comment(int id, String title, String content, int star, int user_id, int product_id, Timestamp create_at,
			Timestamp update_at) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.star = star;
		this.user_id = user_id;
		this.product_id = product_id;
		this.create_at = create_at;
		this.update_at = update_at;
	}

	
	
	public User getUserComment() {
		return userComment;
	}



	public void setUserComment(User userComment) {
		this.userComment = userComment;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public Timestamp getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Timestamp create_at) {
		this.create_at = create_at;
	}

	public Timestamp getUpdate_at() {
		return update_at;
	}

	public void setUpdate_at(Timestamp update_at) {
		this.update_at = update_at;
	}

}
