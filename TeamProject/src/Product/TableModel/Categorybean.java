package Product.TableModel;

public class Categorybean {

	private int indexnum; //소분류 판별값
	private int maincate; //대분류 판별값
	private String mainmemo; //대분류 내용
	private int subcate; // 중분류 판별값
	private String submemo; //중분류 내용
	private int sub2cate; //일단 안쓴다
	private String sub2memo; //소분류 내용

	public int getIndexnum() {
		return indexnum;
	}

	public void setIndexnum(int indexnum) {
		this.indexnum = indexnum;
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

	public int getSub2cate() {
		return sub2cate;
	}

	public void setSub2cate(int sub2cate) {
		this.sub2cate = sub2cate;
	}

	public String getMainmemo() {
		return mainmemo;
	}

	public void setMainmemo(String mainmemo) {
		this.mainmemo = mainmemo;
	}

	public String getSubmemo() {
		return submemo;
	}

	public void setSubmemo(String submemo) {
		this.submemo = submemo;
	}

	public String getSub2memo() {
		return sub2memo;
	}

	public void setSub2memo(String sub2memo) {
		this.sub2memo = sub2memo;
	}
}