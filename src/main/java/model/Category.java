package model;

public class Category {
	private int category_ID;
	private String name;
	
	public Category() {
		
	}

	public Category(int category_ID, String name) {
		super();
		this.category_ID = category_ID;
		this.name = name;
	}

	public int getCategory_ID() {
		return category_ID;
	}

	public void setCategory_ID(int category_ID) {
		this.category_ID = category_ID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
