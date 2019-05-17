package Function;

public class ActionForward {
	
	// 페이지 이동 방식 여부값 true일때 -> sendRedrirect()방식
	// 페이지 이동 방식 여부값 false일때 -> forward()방식
	private boolean isRedirect = false;
	// 이동페이지 경로 주소값 저장 변수
	private String path = null;

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
}