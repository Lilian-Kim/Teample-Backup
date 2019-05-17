package TradeList.TableModel;

import java.sql.Timestamp;

public class TradeListbean {

	private int seller_no; // 판매자 id
	private int product_no; // 상품번호
	private String product_name; // 상품명
	private String product_mainimg; // 상품 이미지
	private Timestamp e_time; // 경매 종료시각
	private int price_end; // 최종낙찰가
	private int buyer_no; // 최종낙찰자의 번호

	public int getSeller_no() {
		return seller_no;
	}

	public void setSeller_no(int seller_no) {
		this.seller_no = seller_no;
	}

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

	public String getProduct_mainimg() {
		return product_mainimg;
	}

	public void setProduct_mainimg(String product_mainimg) {
		this.product_mainimg = product_mainimg;
	}
	
	public Timestamp getE_time() {
		return e_time;
	}

	public void setE_time(Timestamp e_time) {
		this.e_time = e_time;
	}

	public int getPrice_end() {
		return price_end;
	}

	public void setPrice_end(int price_end) {
		this.price_end = price_end;
	}

	public int getBuyer_no() {
		return buyer_no;
	}

	public void setBuyer_no(int buyer_no) {
		this.buyer_no = buyer_no;
	}
}