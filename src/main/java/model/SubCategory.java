package model;

public class SubCategory {
	private int subCategory_ID;
	private int category_ID;
	private String subCategoryName;

	public SubCategory() {
	}

	public SubCategory(int subCategory_ID, int category_ID, String name) {
		this.subCategory_ID = subCategory_ID;
		this.category_ID = category_ID;
		this.subCategoryName = name;
	}

    public int getSubCategory_ID() {
		return subCategory_ID;
	}

	public void setSubCategory_ID(int subCategory_ID) {
		this.subCategory_ID = subCategory_ID;
	}

	public int getCategory_ID() {
		return category_ID;
	}

	public void setCategory_ID(int category_ID) {
		this.category_ID = category_ID;
	}

	public String getSubCategoryName() {
		return subCategoryName;
	}

	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}
}
