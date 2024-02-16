package com.basic.rentcar.vo;

public class RentcarVO {

	private int no;
	private String name;
	private int category;
	private int price;
	private int usepeople;
	private int totalQty;
	private String company;
	private String img;
	private String info;
	public RentcarVO() {}
	public RentcarVO(int no, String name, int category, int price, int usepeople, int totalQty, String company,
			String img, String info) {
		super();
		this.no = no; // 고유번호
		this.name = name; //차량이름
		this.category = category; //차종
		this.price = price; // 가격
		this.usepeople = usepeople; // 승차인원
		this.totalQty = totalQty; // 차량대수
		this.company = company; //제조회사
		this.img = img; // 차 이미지
		this.info = info; //차량 정보
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getUsepeople() {
		return usepeople;
	}
	public void setUsepeople(int usepeople) {
		this.usepeople = usepeople;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getTotalQty() {
		return totalQty;
	}
	public void setTotalQty(int totalQty) {
		this.totalQty = totalQty;
	}
	@Override
	public String toString() {
		return "RentcarVO [no=" + no + ", name=" + name + ", category=" + category + ", price=" + price + ", usepeople="
				+ usepeople + ", totalQty=" + totalQty + ", company=" + company + ", img=" + img + ", info=" + info
				+ "]";
	}
	
	
	
}
