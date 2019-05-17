package Product.TableModel;

import java.sql.Timestamp;

public class Tenderbean {

	private int product_no;
	private String product_name;
	private String product_mainimg;
	private int seller_no;
	private int buyer_no;
	private String buyer_id;
	private Timestamp tender_time;
	private Timestamp end_time;
	private int tender_price;
	private int count;
	private int state;

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
	
	public int getSeller_no() {
		return seller_no;
	}

	public void setSeller_no(int seller_no) {
		this.seller_no = seller_no;
	}

	public int getBuyer_no() {
		return buyer_no;
	}

	public void setBuyer_no(int buyer_no) {
		this.buyer_no = buyer_no;
	}

	public String getBuyer_id() {
		return buyer_id;
	}

	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	
	public Timestamp getTender_time() {
		return tender_time;
	}

	public void setTender_time(Timestamp tender_time) {
		this.tender_time = tender_time;
	}

	public Timestamp getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Timestamp end_time) {
		this.end_time = end_time;
	}
	
	public int getTender_price() {
		return tender_price;
	}

	public void setTender_price(int tender_price) {
		this.tender_price = tender_price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
}