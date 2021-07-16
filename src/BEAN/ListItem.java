package BEAN;


public class ListItem {
	private long orderId;
	private int quantity;
	private Product product;
	private int price;
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public ListItem(int quantity, Product product, long orderId) {
		super();
		this.quantity = quantity;
		this.product = product;
		this.orderId = orderId;
	}
	public ListItem() {
		super();
	}
	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	
}
