package model;

public class Item {
	private int itemID;
	private int category_ID;
	private int userID;
	private String name;
	private String description;
	private double price;
	private String image;
	private String status;
	
	public Item() {
		
	}

	public Item(int itemID, int category_ID, int userID, String name, String description, double price, String image, String status) {
		this.itemID = itemID;
		this.category_ID = category_ID;
		this.userID = userID;
		this.name = name;
		this.description = description;
		this.price = price;
		this.image = image;
		this.status = status;
	}


	public int getItemID() {
		return itemID;
	}

	public void setItemID(int itemID) {
		this.itemID = itemID;
	}

	public int getCategory_ID() {
		return category_ID;
	}

	public void setCategory_ID(int category_ID) {
		this.category_ID = category_ID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}
