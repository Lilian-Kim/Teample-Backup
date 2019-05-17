package MemberBoard.TableModel;

import java.sql.Date;

public class MemberBoardbean {

	private int num;
	private int product_no;
	private String id;
	private String pw;
	private String subject; //문의 제목
	private String content; //문의 내용
	private int readcount;
	private Date date;
	private int qnastatus; //답변 상태
	private String reply; //운영자 리플

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public int getQnastatus() {
		return qnastatus;
	}

	public void setQnastatus(int qnastatus) {
		this.qnastatus = qnastatus;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}