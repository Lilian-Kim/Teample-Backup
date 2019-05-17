package Engine;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Product.TableModel.ProductDAO;
import Product.TableModel.Productbean;
import Product.TableModel.TenderDAO;

public class ThreadEndTimeCheck extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static LocalDateTime currentDateTime;
	private static List<Productbean> boardList;
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println("[Thread] - 실시간 경매 종료 확인 스레드 활성화!");
		getEndTimeCheck();
	}

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {

	}

	private void getEndTimeCheck() {
		Runnable r = new Runnable() {
			@Override
			public void run() {
				currentDateTime = LocalDateTime.now();
				//System.out.println(currentDateTime);
				boardList = ProductDAO.getProductList(); // 상품판매 리스트를 갱신한다.
				for (Productbean productbean : boardList) {
					long currtime = Timestamp.valueOf(currentDateTime).getTime(); // 현재 시간을 밀리세컨초로 가져옴
					long protime = productbean.getE_time().getTime(); // 상품판매 리스트의 상품종료시간을 밀리세컨초로 가져옴
					// 현재 시간과 상품종료 시간을 비교
					if((currtime > protime) && (productbean.getState()<2)) { // 만약 현재시간이 크다면? (즉 종료 되었다는 소리)
						
						TenderDAO tdao = new TenderDAO(); //현수
						ProductDAO pdao = new ProductDAO(); //현수
						pdao.setEndBuyerNo(productbean.getProduct_no()); //현수
						tdao.setStateCount(productbean.getProduct_no(), 2); //현수
												
						// 우선 입찰중인 상품이라는 조건은 제외하고 구현
//						ProductDAO.addPurchaseList(productbean); // purchase_list 에 상품 저장
						// ProductDAO.endTimeProductDel(productbean.getProduct_no()); // 상품판매 리스트에서 삭제
					}
				}
			}
		};
		ThreadPool.scheduleAtFixedRate(r, 0, 1);
	}
	
	public static List<Productbean> getProductList() {
		return boardList;
	}
}