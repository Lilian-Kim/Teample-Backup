package Member.TableModel;

import java.sql.Timestamp;

public class Memberbean {

	private int seller_no;
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private int zipcode;
	private String addr;	
	private String detailaddr;
	private int money;
	private int deduction_money; // 차감대기 금액
	private Timestamp regdate;
//	private int infomail;
	
	private int sell_complete; // 판매 완료(낙찰자가 수취확인 버튼을 누름) 횟수
	private int sell_cancel; // 판매 취소 횟수
	private int buy_complete; // 구매 완료(수취확인 버튼 눌러서 거래를 마침) 횟수
	private int buy_cancel; // 구매 취소 횟수
	private int grade;
	// 등급 산정 기준
	// 0 - NEW (sell_complete 0건)
	// 1 - SILVER (sell_complete 1건 이상)
	// 2 - GOLD (sell_complete 5건 이상)
	// 3 - VIP (sell_complete 20건 이상)
	// 4 - VVIP (sell_complete 50건 이상)
	// 5 - THE FIRST (sell_complete 100건 이상)
	

	
	
	
	
	public int getSell_complete() {
		return sell_complete;
	}
	public void setSell_complete(int sell_complete) {
		this.sell_complete = sell_complete;
	}
	public int getSell_cancel() {
		return sell_cancel;
	}
	public void setSell_cancel(int sell_cancel) {
		this.sell_cancel = sell_cancel;
	}
	public int getBuy_complete() {
		return buy_complete;
	}
	public void setBuy_complete(int buy_complete) {
		this.buy_complete = buy_complete;
	}
	public int getBuy_cancel() {
		return buy_cancel;
	}
	public void setBuy_cancel(int buy_cancel) {
		this.buy_cancel = buy_cancel;
	}
	public int getSeller_no() {
		return seller_no;
	}
	public void setSeller_no(int seller_no) {
		this.seller_no = seller_no;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetailaddr() {
		return detailaddr;
	}
	public void setDetailaddr(String detailaddr) {
		this.detailaddr = detailaddr;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getDeduction_money() {
		return deduction_money;
	}
	public void setDeduction_money(int deduction_money) {
		this.deduction_money = deduction_money;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}