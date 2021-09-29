package model;

public class Category {
	private int category_ID;
	private String categoryName;

	public Category() {

	}

	public Category(int category_ID, String categoryName) {
		super();
		this.category_ID = category_ID;
		this.categoryName = categoryName;
	}

	public int getCategory_ID() {
		return category_ID;
	}

	public void setCategory_ID(int category_ID) {
		this.category_ID = category_ID;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


}
