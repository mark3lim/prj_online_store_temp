package buy.vo;

public class BuyingCartVO {
	
	private String name;
	private int amount, price;
	
	public BuyingCartVO() {
	}
	public BuyingCartVO(String name, int amount, int price) {
		this.name = name;
		this.amount = amount;
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "BuyingCartVO [name=" + name + ", amount=" + amount + ", price=" + price + "]";
	}
}