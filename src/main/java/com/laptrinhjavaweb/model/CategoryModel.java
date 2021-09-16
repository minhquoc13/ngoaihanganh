package com.laptrinhjavaweb.model;

public class CategoryModel extends AbstractModel<CategoryModel> {

	private String code;
	private String name;
	private float percent;
	private Long view;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getPercent() {
		return percent;
	}
	public void setPercent(float percent) {
		this.percent = percent;
	}
	public Long getView() {
		return view;
	}
	public void setView(Long view) {
		this.view = view;
	}
	
	
}
