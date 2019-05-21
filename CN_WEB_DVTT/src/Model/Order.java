package Model;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Order {

	private int id;
	private User user;
	private ArrayList<Item> items;
	private String address;
	private String phone;
	private int pay;
	private Timestamp create_at;
	private Timestamp update_at;
	private String status;

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(int id, User user, ArrayList<Item> items, String address, String phone, int pay, Timestamp create_at,
			Timestamp update_at, String status) {
		super();
		this.id = id;
		this.user = user;
		this.items = items;
		this.address = address;
		this.phone = phone;
		this.pay = pay;
		this.create_at = create_at;
		this.update_at = update_at;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ArrayList<Item> getItems() {
		return items;
	}

	public void setItems(ArrayList<Item> items) {
		this.items = items;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int countItem() {
		return items.size();
	}

	public int countProductInItem() {
		int count = 0;
		for (Item item : items) {
			count += item.getQuantity();
		}
		return count;
	}

	public long total() {
		int count = 0;
		for (Item item : items) {
			count += item.getQuantity() * item.getProduct().getPrice();
		}
		return count;
	}
	
	public long totalPay() {
		int totalPay = 0;
		totalPay = (int) (total()) + 30000;
		return totalPay;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

}
