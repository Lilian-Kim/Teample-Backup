package Product.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Function.Action;
import Function.ActionForward;


public class ProductFrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestPro(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestPro(req, resp);
	}

	protected void requestPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String RequestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		System.out.println("상품 프론트 : " + command);
		if (command.equals("/index.pro")) { // index 페이지로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp");
			// ------------------------------------------------------------------
		} else if (command.equals("/ProductReg.pro")) { // 상품등록 페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=product/pro_upload.jsp");
		} else if (command.equals("/ProductRegAction.pro")) { // 상품등록
			try {
				action = new ProductRegAction();
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ------------------------------------------------------------------
		} else if (command.equals("/ProductSellList.pro")) { // 판매중인 상품 페이지 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=product/sale.jsp");
		} else if (command.equals("/ProductSellListAction.pro")) { // 판매중인 상품 리스트정보 확인
			try {
				action = new ProductSellListAction(); // 판매리스트 정보를 담아 전송
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ------------------------------------------------------------------
		} else if (command.equals("/ProductDetailView.pro")) { // 상품상세 정보 뷰페이지
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=product/product.jsp");
		} else if (command.equals("/ProductDetail.pro")) {
			try {
				action = new ProductDetailAction(); // 상품상세 정보
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ------------------------------------------------------------------
		} else if (command.equals("/ProductTenderView.pro")) { // 입찰하기 정보 뷰페이지
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./product/product_tender.jsp");
		} else if (command.equals("/ProductTenderFailView.pro")) { // 낙찰중 정보 뷰페이지
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./product/product_fail.jsp");
		} else if (command.equals("/ProductTender.pro")) {
			try {
				action = new ProductTenderAction(); // 입찰하기 정보
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ------------------------------------------------------------------
		} else if (command.equals("/ProductTenderCompleteView.pro")) { // 입찰하기완료시 정보 뷰페이지
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./product/product_tenderview.jsp");
		} else if (command.equals("/ProductTenderComplete.pro")) {
			try {
				action = new ProductTenderCompleteAction(); // 입찰하기완료시 정보
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ------------------------------------------------------------------
		} else if (command.equals("/ProductTenderListView.pro")) { // 마이페이지 입찰중리스트 정보 뷰페이지
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=purchase.jsp");
		} else if (command.equals("/ProductTenderList.pro")) {
			try {
				action = new ProductTenderListAction(); // 마이페이지 입찰중리스트 정보
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// ------------------------------------------------------------------
		} else if (command.equals("/ProductTenderInfoView.pro")) { // 경매기록 정보 뷰페이지
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./product/product_tenderinfo.jsp");
		} else if (command.equals("/ProductTenderInfo.pro")) {
			try {
				action = new ProductTenderInfoAction(); // 경매기록 정보
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// -------------------------------------------------------------------------
		else if (command.equals("/ProductCategoryList.pro")) {
			try {
				action = new ProductCategoryListAction(); // 카테고리 상세페이지 뿌리기
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// --------------------------------------------------------------------------
		} else if (command.equals("/ProductWishlistView.pro")) { // 관심상품 정보 뷰페이지
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./index.jsp?center=wishlist.jsp");
		} else if (command.equals("/ProductWishlistAction.pro")) {
			try {
				action = new ProductWishlistAction(); // 관심상품 정보
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// --------------------------------------------------------------------------
		} else if (command.equals("/ProductSearchListAction.pro")) { // 헤더 검색
            try {
                action = new ProductSearchListAction();
                forward = action.execute(req, resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
		} else if (command.equals("/SearchCompleted.pro")) { // 헤더검색 리스트 뷰페이지 이동
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("./index.jsp?center=./product/search_list.jsp");
            //--------------------------------------------------------------------------
		} else if (command.equals("/ProductTenderStateAction.pro")) { //거래 진행 단계
			try {
				action = new ProductTenderStateAction();
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		// ------------------------------------------------------------------
		}
		
			// 주소 이동
			if (forward != null) {
				if (forward.isRedirect()) { // true -> Response.sendRedirect()
											// 방식
					resp.sendRedirect(forward.getPath());
				} else { // false -> forward()방식
					RequestDispatcher dis = req.getRequestDispatcher(forward.getPath());
					dis.forward(req, resp);
				}
			}
		}
	}

