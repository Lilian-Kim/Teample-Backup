package Product.TableModel;

import java.sql.Timestamp;

public class Productbean {
	private int product_no; // 상품번호
	private String product_name; // 상품명
	private int price_action; // 경매 시작가
	private int price_promptly; // 즉시 구매가
	private int price_end; // 경매 입찰가
	private Timestamp s_time; // 경매 시작일자
	private Timestamp e_time; // 경매 종료일자
	private int end_option; // 종료 연장옵션 0:연장x 1:연장o
	private String product_mainimg; // 상품 메인이미지
	private String product_contend; // 상품 내용
	private int commission; // 상품 수수료 선택
	private int state; //현수
	// state 1 : 판매자-경매중, 입찰자-입찰중
	// state 2 : 판매자-배송대기, 입찰자-배송대기
	// state 3 : 판매자-발송완료, 입찰자-배송중
	// state 4 : 판매자-거래완료, 입찰자-구매확정
	private int seller_no; // 판매자 아이디
	private int end_buyer_no; // 최종 구매자 아이디
	private String name;
	private int maincate;
	private int subcate;
	private int category;
	private int grade;
	private String search_keyword; //검색 키워드 -장군
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getPrice_action() {
		return price_action;
	}
	public void setPrice_action(int price_action) {
		this.price_action = price_action;
	}
	public int getPrice_promptly() {
		return price_promptly;
	}
	public void setPrice_promptly(int price_promptly) {
		this.price_promptly = price_promptly;
	}
	public int getPrice_end() {
		return price_end;
	}
	public void setPrice_end(int price_end) {
		this.price_end = price_end;
	}
	public Timestamp getS_time() {
		return s_time;
	}
	public void setS_time(Timestamp s_time) {
		this.s_time = s_time;
	}
	public Timestamp getE_time() {
		return e_time;
	}
	public void setE_time(Timestamp e_time) {
		this.e_time = e_time;
	}
	public int getEnd_option() {
		return end_option;
	}
	public void setEnd_option(int end_option) {
		this.end_option = end_option;
	}
	public String getProduct_mainimg() {
		return product_mainimg;
	}
	public void setProduct_mainimg(String product_mainimg) {
		this.product_mainimg = product_mainimg;
	}
	public String getProduct_contend() {
		return product_contend;
	}
	public void setProduct_contend(String product_contend) {
		this.product_contend = product_contend;
	}
	public int getCommission() {
		return commission;
	}
	public void setCommission(int commission) {
		this.commission = commission;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getSeller_no() {
		return seller_no;
	}
	public void setSeller_no(int seller_no) {
		this.seller_no = seller_no;
	}
	public int getEnd_buyer_no() {
		return end_buyer_no;
	}
	public void setEnd_buyer_no(int end_buyer_no) {
		this.end_buyer_no = end_buyer_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMaincate() {
		return maincate;
	}
	public void setMaincate(int maincate) {
		this.maincate = maincate;
	}
	public int getSubcate() {
		return subcate;
	}
	public void setSubcate(int subcate) {
		this.subcate = subcate;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getSearch_keyword() {
		return search_keyword;
	}
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}
	
}