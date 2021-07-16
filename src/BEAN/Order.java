package BEAN;

import java.util.List;


public class Order {
	private long id;
	private String idUser;
	private String orderDate;
	private String status;
	private List<ListItem> items;
	private int total;
	private String name;
	private String address;
	private String phone;
	private String idSale;
	private String idShip;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public String getIdUser() {
		return idUser;
	}
	public void setIdUser(String idUser) {
		this.idUser = idUser;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String isStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public List<ListItem> getItems() {
		return items;
	}
	public void setItems(List<ListItem> items) {
		this.items = items;
	}
	

	public String getIdSale() {
		return idSale;
	}
	
	public Order(long id, String idUser, String orderDate, String status, List<ListItem> items, int total, String name,
			String address, String phone, String idSale, String idShip) {
		super();
		this.id = id;
		this.idUser = idUser;
		this.orderDate = orderDate;
		this.status = status;
		this.items = items;
		this.total = total;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.idSale = idSale;
		this.idShip = idShip;
	}
	public void setIdSale(String idSale) {
		this.idSale = idSale;
	}
	public String getIdShip() {
		return idShip;
	}
	public void setIdShip(String idShip) {
		this.idShip = idShip;
	}
	public Order() {
		super();
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStatus() {
		return status;
	}
	
	
}
