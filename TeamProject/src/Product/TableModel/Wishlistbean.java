package Product.TableModel;

import java.sql.Timestamp;

public class Wishlistbean {
	
	private String id;
	private int product_no;
	private String product_name;
	private Timestamp e_time;
	private int state;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public Timestamp getE_time() {
		return e_time;
	}

	public void setE_time(Timestamp e_time) {
		this.e_time = e_time;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
}