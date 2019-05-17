package Product.Controller;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Engine.ObjectIdFactory;
import Engine.Thumbnail;
import Function.Action;
import Function.ActionForward;
import Member.TableModel.MemberDAO;
import Member.TableModel.Memberbean;
import Product.TableModel.ProductDAO;
import Product.TableModel.Productbean;

public class ProductRegAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		HttpSession httpsession = req.getSession(false); //현수
		String id = (String) httpsession.getAttribute("id"); //현수
		if(id == null) { // 만약 로그인 상태가 아니라면 (비정상적인 접근) 
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>");
			out.println("alert('로그인후 이용가능 합니다.);");
			out.println("location.href='./MemberLogin.me'");
			out.println("</script>");
			out.close();
			return null; // 리턴 
		}
		String root = req.getSession().getServletContext().getRealPath("/");
		// root 경로는 현재이클립스상의 D:\work_teamproject\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\TeamProject\product_images
		// 주소로 세팅되어있음.
		// 임시로 절대경로로 설정하여 확인.
		// String root = "C:/Users/HyeongJun/Documents/Java/Jsp/TeamProject/WebContent/"; // 일단 본인 워크스페이스 프로젝트 경로 써주세요 오류나면~~~~
		// String root = "C:/WORK_PROJECT/TeamProject/WebContent/"; // 현수꺼
		// String root = "D:/work_teamproject/TeamProject/WebContent/"; // 현수꺼  
		//String root = "D:/TeamProject/TeamProject/WebContent/"; //장군
		
		
		String path_original = root + "product_images";
		String path_detail =  root + "product_images_detail"; // 상품 상세 이미지가 저장될경로(썸네일로 원본이미지를 크기조절)
		String path_list = root + "product_images_list";
		String path_category = root + "product_images_category";
		String path_slide = root + "product_images_slide";
		
		String encType = "UTF-8";
		int maxFilesize = 5 * 1024 * 1024; // 5메가 제한
		MultipartRequest multi = new MultipartRequest(req, path_original, maxFilesize, encType, new DefaultFileRenamePolicy());
		String product_mainimg = multi.getFilesystemName("product_mainimg");
		
		String original = path_original + "/" + product_mainimg;
		String tetail = path_detail + "/" + product_mainimg;
		String list = path_list + "/" + product_mainimg;
		String cate = path_category + "/" + product_mainimg;
		String slide = path_slide + "/" + product_mainimg;
		Thumbnail.createImageThumbnail(original, tetail, 450, 450); // 여기서 상품상세 이미지 생성
		Thumbnail.createImageThumbnail(original, list, 325, 300); // 여기서 상품상세 이미지 생성
		Thumbnail.createImageThumbnail(original, cate, 100, 100); // 여기서 상품상세 이미지 생성
		Thumbnail.createImageThumbnail(original, slide, 400, 400); // 여기서 상품슬라이드 이미지 생성
		// 회원가입 폼(pro_upload.jsp)에서 입력한 내용을 한글처리
		req.setCharacterEncoding("UTF-8");
		Productbean pb = new Productbean();
		int objid = ObjectIdFactory.getInstance().nextId(); // 상품번호 생성
		int category = Integer.parseInt(multi.getParameter("catenum")); // 소분류값 현수
		int maincate = Integer.parseInt(multi.getParameter("maincate")); // 대분류값 현수
		int subcate = Integer.parseInt(multi.getParameter("subcate")); // 중분류값 현수
		String product_name = multi.getParameter("product_name"); // 상품명
		int price_action = Integer.parseInt(multi.getParameter("price_action")); // 경매 시작가
		int price_promptly = Integer.parseInt(multi.getParameter("price_promptly")); // 즉시 구매가
		int s_year = Integer.parseInt(multi.getParameter("s_year"));
		int s_month = Integer.parseInt(multi.getParameter("s_month"));
		int s_day = Integer.parseInt(multi.getParameter("s_day"));
		int s_hour = Integer.parseInt(multi.getParameter("s_hour"));
		int s_minute = Integer.parseInt(multi.getParameter("s_minute"));
		LocalDateTime s_time = LocalDateTime.of(s_year, s_month, s_day, s_hour, s_minute); // 경매 시작시간
		int e_year = Integer.parseInt(multi.getParameter("e_year"));
		int e_month = Integer.parseInt(multi.getParameter("e_month"));
		int e_day = Integer.parseInt(multi.getParameter("e_day"));
		int e_hour = Integer.parseInt(multi.getParameter("e_hour"));
		int e_minute = Integer.parseInt(multi.getParameter("e_minute"));
		String search_keyword = multi.getParameter("search_keyword"); // 검색키워드
		LocalDateTime e_time = LocalDateTime.of(e_year, e_month, e_day, e_hour, e_minute); // 경매 종료시간
		int end_option = Integer.parseInt(multi.getParameter("end_option")); // 연상 옵션
		int commission = Integer.parseInt(multi.getParameter("commission")); // 수수료 옵션
		
		String product_contend = multi.getParameter("smarteditor"); // 상품 상세
		int seller_no = Integer.parseInt(multi.getParameter("seller_no")); // 판매자 번호
		pb.setProduct_no(objid);
		pb.setProduct_name(product_name);
		pb.setPrice_action(price_action);
		pb.setPrice_promptly(price_promptly);
		pb.setPrice_end(price_action); // 처음등록시 현재입찰가격과 시작가격을 동일하게 세팅하기위하여
		pb.setS_time(Timestamp.valueOf(s_time));
		pb.setE_time(Timestamp.valueOf(e_time));
		pb.setEnd_option(end_option);
		pb.setCommission(commission);
		pb.setProduct_contend(product_contend);
		pb.setProduct_mainimg(product_mainimg);
		pb.setState(1);
		pb.setSeller_no(seller_no);
		pb.setCategory(category); //현수
		pb.setMaincate(maincate); //현수
		pb.setSubcate(subcate); //현수
		pb.setSearch_keyword(search_keyword); //검색키워드 -장군

		MemberDAO mdao = new MemberDAO(); //현수
		Memberbean mbean = new Memberbean(); //현수
		mbean = mdao.userInfo(id); //현수
		pb.setName(mbean.getName()); //현수

		boolean result = false;
		ProductDAO pdao = new ProductDAO();
		result = pdao.insertProduct(pb);
		if (result == false) {
			return null;
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("./index.pro");
		return forward;
	}
}