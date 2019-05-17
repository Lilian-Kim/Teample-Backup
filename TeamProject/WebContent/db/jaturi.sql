/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : jaturi

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-02-16 00:43:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `indexnum` int(2) NOT NULL DEFAULT '0',
  `MainCate` int(2) DEFAULT NULL,
  `Mainmemo` varchar(20) DEFAULT NULL,
  `SubCate` int(2) DEFAULT NULL,
  `Submemo` varchar(20) DEFAULT NULL,
  `Sub2Cate` int(2) DEFAULT NULL,
  `Sub2memo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`indexnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '1', '패션/뷰티/잡화', '1', '의류', '1', '여성의류');
INSERT INTO `category` VALUES ('2', '1', '패션/뷰티/잡화', '1', '의류', '2', '남성의류');
INSERT INTO `category` VALUES ('3', '1', '패션/뷰티/잡화', '1', '의류', '3', '캐주얼의류');
INSERT INTO `category` VALUES ('4', '1', '패션/뷰티/잡화', '2', '뷰티', '1', '화장품/향수');
INSERT INTO `category` VALUES ('5', '1', '패션/뷰티/잡화', '2', '뷰티', '2', '바디/헤어');
INSERT INTO `category` VALUES ('6', '1', '패션/뷰티/잡화', '3', '잡화', '1', '신발');
INSERT INTO `category` VALUES ('7', '1', '패션/뷰티/잡화', '3', '잡화', '2', '가방/패션잡화');
INSERT INTO `category` VALUES ('8', '1', '패션/뷰티/잡화', '3', '잡화', '3', '쥬얼리/시계/선글라스');
INSERT INTO `category` VALUES ('9', '2', '가구/생활/유아', '1', '가구/침구/수납', '1', '가구/DIY');
INSERT INTO `category` VALUES ('10', '2', '가구/생활/유아', '1', '가구/침구/수납', '2', '조명/인테리어');
INSERT INTO `category` VALUES ('11', '2', '가구/생활/유아', '1', '가구/침구/수납', '3', '생활/욕실/수납용품');
INSERT INTO `category` VALUES ('12', '2', '가구/생활/유아', '1', '가구/침구/수납', '4', '주방용품');
INSERT INTO `category` VALUES ('13', '2', '가구/생활/유아', '1', '가구/침구/수납', '5', '침구/커튼');
INSERT INTO `category` VALUES ('14', '2', '가구/생활/유아', '2', '생활/취미', '1', '건강/의료용품');
INSERT INTO `category` VALUES ('15', '2', '가구/생활/유아', '2', '생활/취미', '2', '반려동물용품');
INSERT INTO `category` VALUES ('16', '2', '가구/생활/유아', '2', '생활/취미', '3', '악기/취미/키덜트');
INSERT INTO `category` VALUES ('17', '2', '가구/생활/유아', '2', '생활/취미', '4', '디자인/문구/사무용품');
INSERT INTO `category` VALUES ('18', '2', '가구/생활/유아', '2', '생활/취미', '5', '꽃/이벤트용품');
INSERT INTO `category` VALUES ('19', '2', '가구/생활/유아', '3', '유아용품', '1', '기저귀/분유/유아식');
INSERT INTO `category` VALUES ('20', '2', '가구/생활/유아', '3', '유아용품', '2', '출산/유아용품/임부복');
INSERT INTO `category` VALUES ('21', '2', '가구/생활/유아', '3', '유아용품', '3', '장난감/교육완구/인형');
INSERT INTO `category` VALUES ('22', '2', '가구/생활/유아', '3', '유아용품', '4', '유아동의류');
INSERT INTO `category` VALUES ('23', '2', '가구/생활/유아', '3', '유아용품', '5', '유아동신발/가방/잡화');
INSERT INTO `category` VALUES ('24', '3', '가전/디지털/컴퓨터', '1', '가전', '1', '대형가전');
INSERT INTO `category` VALUES ('25', '3', '가전/디지털/컴퓨터', '1', '가전', '2', '계절가전');
INSERT INTO `category` VALUES ('26', '3', '가전/디지털/컴퓨터', '1', '가전', '3', '주방가전');
INSERT INTO `category` VALUES ('27', '3', '가전/디지털/컴퓨터', '1', '가전', '4', '생활/미용가전');
INSERT INTO `category` VALUES ('28', '3', '가전/디지털/컴퓨터', '2', '디지털', '1', '카메라');
INSERT INTO `category` VALUES ('29', '3', '가전/디지털/컴퓨터', '2', '디지털', '2', '음향기기');
INSERT INTO `category` VALUES ('30', '3', '가전/디지털/컴퓨터', '2', '디지털', '3', '게임');
INSERT INTO `category` VALUES ('31', '3', '가전/디지털/컴퓨터', '2', '디지털', '4', '휴대폰');
INSERT INTO `category` VALUES ('32', '3', '가전/디지털/컴퓨터', '2', '디지털', '5', '태블릿');
INSERT INTO `category` VALUES ('33', '3', '가전/디지털/컴퓨터', '3', '컴퓨터', '1', '노트북/PC');
INSERT INTO `category` VALUES ('34', '3', '가전/디지털/컴퓨터', '3', '컴퓨터', '2', '모니터/프린터');
INSERT INTO `category` VALUES ('35', '3', '가전/디지털/컴퓨터', '3', '컴퓨터', '3', 'PC주변기기');
INSERT INTO `category` VALUES ('36', '3', '가전/디지털/컴퓨터', '3', '컴퓨터', '4', '저장장치');
INSERT INTO `category` VALUES ('37', '4', '스포츠/자동차/공구', '1', '스포츠/레저', '1', '휘트니스/수영');
INSERT INTO `category` VALUES ('38', '4', '스포츠/자동차/공구', '1', '스포츠/레저', '2', '스포츠의류/운동화');
INSERT INTO `category` VALUES ('39', '4', '스포츠/자동차/공구', '1', '스포츠/레저', '3', '골프클럽/의류/용품');
INSERT INTO `category` VALUES ('40', '4', '스포츠/자동차/공구', '1', '스포츠/레저', '4', '등산/아웃도어');
INSERT INTO `category` VALUES ('41', '4', '스포츠/자동차/공구', '1', '스포츠/레저', '5', '캠핑/낚시');
INSERT INTO `category` VALUES ('42', '4', '스포츠/자동차/공구', '1', '스포츠/레저', '6', '구기/라켓');
INSERT INTO `category` VALUES ('43', '4', '스포츠/자동차/공구', '1', '스포츠/레저', '7', '자전거/보드');
INSERT INTO `category` VALUES ('44', '4', '스포츠/자동차/공구', '2', '자동차/공구', '1', '자동차용품/블랙박스');
INSERT INTO `category` VALUES ('45', '4', '스포츠/자동차/공구', '2', '자동차/공구', '2', '타이어/오일/부품');
INSERT INTO `category` VALUES ('46', '4', '스포츠/자동차/공구', '2', '자동차/공구', '3', '공구/안전/산업용품');
INSERT INTO `category` VALUES ('47', '5', '도서/음반/DVD', '1', '도서', '1', '국내도서');
INSERT INTO `category` VALUES ('48', '5', '도서/음반/DVD', '1', '도서', '2', '해외도서');
INSERT INTO `category` VALUES ('49', '5', '도서/음반/DVD', '2', '음반', '1', '국내음반');
INSERT INTO `category` VALUES ('50', '5', '도서/음반/DVD', '2', '음반', '2', '해외음반');
INSERT INTO `category` VALUES ('51', '5', '도서/음반/DVD', '3', 'DVD/블루레이', '1', '국내작품');
INSERT INTO `category` VALUES ('52', '5', '도서/음반/DVD', '3', 'DVD/블루레이', '2', '해외작품');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `seller_no` int(20) NOT NULL,
  `id` varchar(20) NOT NULL DEFAULT '',
  `pw` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `zipcode` int(10) NOT NULL,
  `addr` varchar(100) NOT NULL,
  `detailaddr` varchar(100) NOT NULL,
  `money` int(20) DEFAULT '0',
  `deduction_money` int(20) DEFAULT '0',
  `grade` int(1) DEFAULT '0',
  `sell_complete` int(5) DEFAULT '0',
  `sell_cancel` int(5) DEFAULT '0',
  `buy_complete` int(5) DEFAULT '0',
  `buy_cancel` int(5) DEFAULT '0',
  PRIMARY KEY (`id`,`seller_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1348576', 'alsyd52', '1234', '김미뇽', '010-1234-1234', 'alsydsyd@alsyd.com', '59760', '전남 여수시 신월2길 35 (신월동, 대주아파트)', '', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `member` VALUES ('1048580', 'bbb', '111', '오번', '010-5555-5555', 'bbb@hotmail.com', '3659', '서울 서대문구 명지길 5 (홍은동)', '허허', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `member` VALUES ('1148578', 'ccc', '111', '삼번', '010-3333-3333', 'ccc@gmail.com', '47845', '부산 동래구 미남로 11 (사직동)', '흥흥', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `member` VALUES ('1348578', 'flfld', '1234', '김리리', '010-2222-2222', 'ririring@jaturi', '47310', '부산 부산진구 동성로 2 (전포동)', '', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `member` VALUES ('1048576', 'gudwns1', '1234', '형준이', '010-1234-1234', 'test1@test.com', '47327', '부산 부산진구 가야공원로14번길 69 (개금동)', '우리집', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `member` VALUES ('1048579', 'gudwns2', '1234', '도곤이바보', '010-8888-9999', 'baboya@baboya.net', '47327', '부산 부산진구 가야공원로14번길 69 (개금동)', '안녕', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `member` VALUES ('1048583', 'gudwns3', '1234', '성진식당', '010-1222-1111', 'molra@molra.net', '48700', '부산 동구 안창로72번길 10-6 (범일동)', '아이티월', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `member` VALUES ('1048588', 'gudwns4', '1234', '자투리', '010-9797-1112', 'jaturi@jaturi.net', '51751', '경남 창원시 마산합포구 가포로 1 (해운동, 대경상가)', '야호야호', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `member` VALUES ('1048591', 'gudwns5', '1234', '아이티윌', '010-3333-3232', 'itwill@itwill.com', '47326', '부산 부산진구 가야공원로 1 (가야동)', '무슨빌딩이던데', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `member` VALUES ('1348584', 'pipi', '1234', '피고내', '010-9898-7878', 'pipin@ppp.com', '48469', '부산 남구 우암동 77-5', '', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `member` VALUES ('1348580', 'qorhvk', 'qorhvk', '박니노', '010-8888-8989', 'qkqqkqqkq@qkq.com', '48458', '부산 남구 동제당로 167-1 (대연동)', '', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `member` VALUES ('1448594', 'qwe1', 'qwe1', '김장군', '010-1111-2222', 'loveitems@naver.com', '46992', '부산 사상구 백양대로561번길 10 (감전동, 뉴경동빌라)', '102호', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `member` VALUES ('1348582', 'saccyan', '1234', '사사사', '010-6666-7777', 'sasyasya@sss.com', '48458', '부산 남구 대연동 1618-247', '', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `member` VALUES ('1148579', 'vvv', '111', '사번', '010-4444-4444', 'vvv@nate.com', '35200', '대전 서구 만년남로 3 (만년동)', '헿헿', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `member` VALUES ('1148577', 'xxx', '111', '이번', '010-2222-2222', 'xxx@daum.net', '7803', '서울 강서구 강서로 375 (마곡동)', '헤헤', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `member` VALUES ('1148576', 'zzz', '111', '일번', '010-1111-1111', 'zzz@naver.com', '1220', '서울 강북구 월계로 3 (미아동, 덕신빌딩)', '히히', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `member_board`
-- ----------------------------
DROP TABLE IF EXISTS `member_board`;
CREATE TABLE `member_board` (
  `num` int(10) NOT NULL AUTO_INCREMENT,
  `product_no` int(20) DEFAULT NULL,
  `id` varchar(20) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `re_ref` int(10) DEFAULT NULL,
  `re_lev` int(10) DEFAULT NULL,
  `re_seq` int(10) DEFAULT NULL,
  `readcount` int(10) DEFAULT NULL,
  `date` datetime NOT NULL,
  `qnastatus` int(1) NOT NULL DEFAULT '0',
  `reply` varchar(2000) DEFAULT '',
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_board
-- ----------------------------

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_no` int(20) NOT NULL,
  `category` int(10) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `price_action` int(20) DEFAULT NULL,
  `price_promptly` int(20) DEFAULT NULL,
  `price_end` int(20) DEFAULT NULL,
  `s_time` datetime DEFAULT NULL,
  `e_time` datetime DEFAULT NULL,
  `end_option` int(10) DEFAULT '0',
  `product_mainimg` varchar(200) DEFAULT NULL COMMENT '메인 이미지 파일명',
  `product_contend` varchar(4000) DEFAULT NULL,
  `commission` int(10) DEFAULT '0',
  `state` int(10) DEFAULT '1',
  `seller_no` int(20) NOT NULL DEFAULT '0',
  `end_buyer_no` int(20) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `maincate` int(2) DEFAULT NULL,
  `subcate` int(2) DEFAULT NULL,
  `grade` int(1) DEFAULT '0',
  `search_keyword` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`product_no`,`seller_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1048577', '1', '겨울옷 팔아요', '1000', '20000', '1000', '2017-02-15 18:10:00', '2017-02-18 18:10:00', '1', '499915198_front_d4ee8_1486707873production.jpg', '<span style=\"font-size: 36pt; color: rgb(255, 0, 0);\">겨울옷 팝니다.</span>', '5', '1', '1048576', null, '형준이', '1', '1', '0', '겨울옷');
INSERT INTO `product` VALUES ('1048578', '2', '신상 추가  맨투맨/후드/후리스/반팔  깔끔한 베이직 아이템!!', '15000', '35000', '15000', '2017-02-15 18:16:00', '2017-02-22 18:16:00', '1', 'front_a602a.jpg', '<h3 class=\"tit\"><span style=\"font-size: 36pt; color: rgb(255, 108, 0);\">신상 추가</span><br><span style=\"font-size: 36pt; color: rgb(255, 108, 0);\"> 맨투맨/후드/후리스/반팔</span><br><span style=\"font-size: 36pt; color: rgb(255, 108, 0);\"> 깔끔한 베이직 아이템!!</span></h3>', '3', '1', '1048576', null, '형준이', '1', '1', '0', '맨투맨');
INSERT INTO `product` VALUES ('1048580', '3', '귀여운 캐릭터 슬리퍼 모음★ 팬콧 外 실내화/삼디다스', '1000', '8000', '1000', '2017-02-15 18:22:00', '2017-02-20 18:22:00', '0', 'front_e5f8d.jpg', '<div class=\"img_area\"><div class=\"main_img\" id=\"main_img\"><ul class=\"roll\"><div class=\"slides_control\"><li style=\"font-size: 36pt;\"><span style=\"font-size: 36pt;\"><span style=\"color: rgb(255, 0, 0);\">신학기 인기 필수 실내화</span>♥</span>&nbsp;</li></div></ul></div></div><div class=\"ct_area\"><h3 class=\"tit\"><span style=\"font-size: 36pt; color: rgb(0, 117, 200);\">귀여운 캐릭터 슬리퍼 모음★</span><br><span style=\"font-size: 36pt; color: rgb(0, 117, 200);\">팬콧 外 실내화/삼디다스</span><br><span style=\"font-size: 36pt; color: rgb(0, 117, 200);\">★무료배송+꿀쿠폰★</span></h3></div>', '3', '1', '1048579', null, '도곤이바보', '1', '1', '0', '실내화');
INSERT INTO `product` VALUES ('1048581', '4', '남녀 BEST 명품향수 모음', '20000', '50000', '20000', '2017-02-15 18:27:00', '2017-02-22 18:27:00', '1', '407165198_front_3401e_1475135129production.jpg', '<p class=\"stit\"><span style=\"font-size: 18pt; color: rgb(239, 0, 124);\">없는 것 빼고 다 있을 인기향수 총집합!</span></p><h3 class=\"tit\"><span style=\"font-size: 18pt; color: rgb(239, 0, 124);\">최저 1만원대부터 만나는</span><br><span style=\"font-size: 18pt; color: rgb(239, 0, 124);\"> 남녀 BEST 명품향수 모음</span><br><span style=\"font-size: 18pt; color: rgb(239, 0, 124);\">~최대 78% 파격할인대전&nbsp;</span></h3>', '5', '1', '1048579', null, '도곤이바보', '1', '2', '0', '향수');
INSERT INTO `product` VALUES ('1048582', '5', '[바비니] 퍼퓸드   바디샤워 오일워시& 쉐어버터핸드크림', '3900', '12000', '3900', '2017-02-15 18:30:00', '2017-02-18 18:30:00', '1', '480055014_front_6921f_1485829010production.jpg', '<p class=\"stit\"><span style=\"font-size: 36pt; color: rgb(0, 158, 37);\">아름다운 화원의 향기</span></p><h3 class=\"tit\"><span style=\"font-size: 36pt; color: rgb(0, 158, 37);\">[바비니] 퍼퓸드 </span><br><span style=\"font-size: 36pt; color: rgb(0, 158, 37);\"> 바디샤워 오일워시&amp;</span><br><span style=\"font-size: 36pt; color: rgb(0, 158, 37);\">쉐어버터핸드크림</span></h3>', '5', '1', '1048579', null, '도곤이바보', '1', '2', '0', '바비니');
INSERT INTO `product` VALUES ('1048584', '47', '헉,나만 다른 반이라고?', '3000', '20000', '3000', '2017-02-15 18:34:00', '2017-02-18 18:34:00', '1', 'L.jpg', '<p><b><span style=\"font-size: 12pt; color: rgb(0, 0, 0);\">드디어 새 학년이 되었어요!</span><br><br><span style=\"font-size: 12pt; color: rgb(0, 0, 0);\">쥘리에트는 매사에 신중하고 꼼꼼한 성격이에요. 새 학년으로 올라가기 며칠 전에 준비물을 \r\n미리미리 확인해서 책가방에 챙겨 넣을 만큼 야무지기도 하고요. 바야흐로 새 학년이 되는 날! 쥘리에트는 잔뜩 기대에 부푼 채 단짝 친구들과 함께 \r\n신나게 학교로 걸어갔답니다. 그런데 이게 웬 날벼락일까요? 언제나 꼭 붙어 다니던 단짝 친구들과 떨어져 혼자만 다른 반이 되었다지 뭐예요? \r\n게다가 친구들한테 못되게 굴기로 유명한 심술 자매 삼총사와 한 반이 된 거 있지요? 그것도 모자라, 짝꿍 닐스는 여자애라면 질색을 해서 \r\n퉁명스럽기 짝이 없었어요. 더 끔찍한 것은 학교에서 무섭기로 소문난 코클레 선생님이 담임이라는 거예요! </span><br><br><span style=\"font-size: 12pt; color: rgb(0, 0, 0);\">쥘리에트는 한숨이 절로 \r\n새어 나왔어요. 하필이면 왜 자기만 이 반에 딱 걸린 건지 원망스러워 미칠 지경이었지요. 차라리 독감에라도 걸려서 집에 가 버리고만 싶었답니다. \r\n마치 독감에라도 걸린 것처럼 온몸에서 연방 땀이 나기도 하고, 목에 뭐가 콱 걸린 것 같기도 하고, 다리가 후들후들 떨리기도 했어요. 쥘리에트는 \r\n과연 학교생활을 잘할 수 있을까요?&nbsp;</span></b>&nbsp;</p>', '1', '1', '1048583', null, '성진식당', '5', '1', '0', '국내도서');
INSERT INTO `product` VALUES ('1048586', '48', 'Java의 정석', '5000', '22000', '5000', '2017-02-15 18:42:00', '2017-02-18 18:42:00', '1', 'javaaaaa1.jpg', '<p><span class=\"more_contents\"><b><span style=\"font-size: 12pt;\">Chapter 1 자바를 시작하기 전에</span><br><span style=\"font-size: 12pt;\">1. 자바(Java Programming \r\nLanguage) / 2</span><br><span style=\"font-size: 12pt;\">1.1 자바란? / 2</span><br><span style=\"font-size: 12pt;\">1.2 자바의 역사 / 2 </span><br><span style=\"font-size: 12pt;\">1.3 자바언어의 특징 / 3</span><br><span style=\"font-size: 12pt;\">1.4 \r\nJVM(Java Virtual Machine) / 4</span><br><span style=\"font-size: 12pt;\">2. 자바개발환경 구축하기 / 6</span><br><span style=\"font-size: 12pt;\">2.1 자바 개발도구(JDK)설치하기 / \r\n6</span><br><span style=\"font-size: 12pt;\">2.2 Java API문서 설치하기 / 7</span><br><span style=\"font-size: 12pt;\">3. 자바로 프로그램작성하기 / 8</span><br><span style=\"font-size: 12pt;\">3.1 Hello.java / 8</span><br><span style=\"font-size: 12pt;\">3.2 \r\n자주 발생하는 에러와 해결방법 / 11</span><br><span style=\"font-size: 12pt;\">3.3 자바프로그램의 실행과정 / 12</span><br><span style=\"font-size: 12pt;\">3.4 주석(comment) / 13</span><br><span style=\"font-size: 12pt;\">3.5 이 \r\n책으로 공부하는 방법 / 14</span><br><br><span style=\"font-size: 12pt;\">Chapter 2 변수(Variable)</span><br><span style=\"font-size: 12pt;\">1. 변수와 상수 / 20</span><br><span style=\"font-size: 12pt;\">1.1 변수란? / \r\n20</span><br><span style=\"font-size: 12pt;\">1.2 변수의 선언과 초기화 / 20</span><br><span style=\"font-size: 12pt;\">1.3 변수의 명명규칙 /25</span><br><span style=\"font-size: 12pt;\">2. 변수의 타입 / 27</span><br><span style=\"font-size: 12pt;\">2.1 \r\n기본형(primitive type) / 28</span><br><span style=\"font-size: 12pt;\">2.2 상수와 리터럴(constant &amp; literal) / 30</span><br><span style=\"font-size: 12pt;\">2.3 형식화된 \r\n출력 - printf() / 36</span><br><span style=\"font-size: 12pt;\">2.4 화면에서 입력받기 - Scanner / 40</span><br><span style=\"font-size: 12pt;\">3. 진법 / 42</span><br><span style=\"font-size: 12pt;\">3.1 10진법과 \r\n2진법 / 42</span><br><span style=\"font-size: 12pt;\">3.2 비트(bit)와 바이트(byte) / 43</span><br><span style=\"font-size: 12pt;\">3.3 8진법과 16진법 / 44</span><br><span style=\"font-size: 12pt;\">3.4 정수의 진법 변환 / \r\n46</span><br><span style=\"font-size: 12pt;\">3.5 실수의 진법변환 / 48</span><br><span style=\"font-size: 12pt;\">3.6 음수의 2진 표현 - 2의 보수법 / 50</span></b>&nbsp;</span></p>', '3', '1', '1048583', null, '성진식당', '5', '1', '0', 'Java');
INSERT INTO `product` VALUES ('1048587', '49', '내가 좋아하는 아티스트  최신간 베스트 음반', '500', '20000', '500', '2017-02-15 18:43:00', '2017-02-20 18:43:00', '0', 'front_sub_b3293.jpg', '<p class=\"stit\"><span style=\"font-size: 18pt;\"><b><span style=\"color: rgb(255, 0, 0);\">김재중/위너/여자친구/BAP/포미닛 외</span> </b></span></p><h3 class=\"tit\"><span style=\"font-size: 18pt;\">내가 좋아하는 아티스트</span><br><span style=\"font-size: 18pt;\"> 최신간 베스트 음반</span></h3>', '5', '1', '1048583', null, '성진식당', '5', '2', '0', '아이돌');
INSERT INTO `product` VALUES ('1048589', '44', '아이나비 인기   블랙박스 모음', '74500', '120000', '74500', '2017-02-15 18:47:00', '2017-02-22 18:47:00', '0', 'front_94f59.jpg', '<p class=\"stit\"><span style=\"font-size: 36pt; color: rgb(0, 158, 37);\">고객 사은 대축제 !</span></p><h3 class=\"tit\"><span style=\"font-size: 36pt;\">아이나비 인기 </span><br><span style=\"font-size: 36pt;\"> 블랙박스 모음</span></h3>', '5', '1', '1048588', null, '자투리', '4', '2', '0', '아이나비');
INSERT INTO `product` VALUES ('1048590', '41', '[NURIZIA] 땡처리  낚시대 22종', '15000', '29798', '15000', '2017-02-15 18:48:00', '2017-02-18 18:48:00', '1', 'front_05693.jpg', '<p class=\"stit\"><span style=\"font-size: 24pt;\">브랜드 낚시대 균일가전</span></p><h3 class=\"tit\"><span style=\"font-size: 24pt;\">[NURIZIA] 땡처리</span><br><span style=\"font-size: 24pt;\"> 낚시대 22종 29,800원&nbsp;</span></h3>', '5', '1', '1048588', null, '자투리', '4', '1', '0', 'NURIZIA');
INSERT INTO `product` VALUES ('1048592', '33', '더 선명하게 더 생생하게  향상된 퀄리티의 노트북', '220000', '599998', '220000', '2017-02-15 18:51:00', '2017-02-22 18:51:00', '1', 'front_a67c7.jpg', '<p class=\"stit\"><span style=\"font-size: 24pt; color: rgb(255, 170, 0);\">합리적인 구매의 첫걸음</span></p><h3 class=\"tit\"><span style=\"font-size: 24pt;\">더 선명하게 더 생생하게</span><br><span style=\"font-size: 24pt;\"> 향상된 퀄리티의 노트북</span></h3>', '3', '1', '1048591', null, '아이티윌', '3', '3', '0', '노트북');
INSERT INTO `product` VALUES ('1048593', '28', '소니 미러리스 A5000', '100000', '370000', '100000', '2017-02-15 18:53:00', '2017-02-20 18:53:00', '0', '472170826_front_sub_bccf7b5686_c6776.jpg', '<p class=\"stit\"><span style=\"font-size: 18pt;\">알파 렌즈 교환식 카메라!</span></p><h3 class=\"tit\"><span style=\"font-size: 18pt;\">소니 미러리스 A5000</span></h3>', '1', '1', '1048591', null, '아이티윌', '3', '2', '0', '미러리스');
INSERT INTO `product` VALUES ('1248581', '3', '간지나지 맨투맨', '20000', '50000', '20000', '2017-02-15 18:33:00', '2017-02-20 18:33:00', '1', '챔피언_Champion___챔피온__CHAMPION®_SUPER_CREW__OXFORD_GREY_HEATHER___S2210_806____99_000원___무신사_스토어1.png', '<p><span style=\"font-size: 36pt;\">한번입어바 장난아니아</span></p>', '1', '1', '1148576', null, '일번', '1', '1', '0', '맨투맨');
INSERT INTO `product` VALUES ('1248582', '9', '아무리 돈모아도 니는 못사는 릴렉스 체어', '100000000', '100010000', '100000000', '2017-02-15 18:34:00', '2017-02-20 18:34:00', '1', '20101226135011238_jpeg.jpg', '<p><span style=\"font-size: 36pt;\">졸라비싸니까 돈있는놈만 붙어</span></p>', '1', '1', '1148576', null, '일번', '2', '1', '0', '의자');
INSERT INTO `product` VALUES ('1248583', '27', '아침엔 에스프레소지', '70000', '95400', '70000', '2017-02-15 18:36:00', '2017-02-20 18:36:00', '1', '20150920000091_0.jpg', '<p><span style=\"font-size: 36pt;\">사람은 카페인을 섭취해야한다</span></p>', '1', '1', '1148576', null, '일번', '3', '1', '0', '에스프레소머신');
INSERT INTO `product` VALUES ('1248585', '44', '쳐다도 못볼 내 애마', '88888888', '99999999', '88888888', '2017-02-15 18:39:00', '2017-02-20 18:37:00', '0', 'bsdb1-2015111751.png', '<p><span style=\"font-size: 36pt;\">우리집앞에 있으니까 구경이라도 하고가</span></p>', '1', '1', '1148576', null, '일번', '4', '2', '0', '스포츠카');
INSERT INTO `product` VALUES ('1248586', '52', '다모았다 암나 들고가', '500', '1000', '500', '2017-02-15 18:40:00', '2017-02-20 18:40:00', '0', 'IMG_0834.jpg', '<p><span style=\"font-size: 36pt;\">그 동안 즐거웠다</span><span style=\"background-color: rgb(119, 119, 119); font-size: 36pt;\">﻿</span></p>', '5', '1', '1148576', null, '일번', '5', '3', '0', 'DVD');
INSERT INTO `product` VALUES ('1248587', '2', '여자가 번호따가는 바지', '10000', '50000', '10000', '2017-02-15 18:41:00', '2017-02-20 18:41:00', '0', '1903-p2.jpg', '<p><span style=\"font-size: 36pt;\">이거입고 나가면 니가 대빵</span></p>', '5', '1', '1148577', null, '이번', '1', '1', '0', '바지');
INSERT INTO `product` VALUES ('1248588', '11', '여기서 아침먹으면 꿀떡', '600000', '800000', '600000', '2017-02-15 18:42:00', '2017-02-20 18:42:00', '1', 'yoavavinoam1[1].jpg', '<p><span style=\"font-size: 36pt;\">겁네 간지난다 와 팔기 싫노</span></p>', '1', '1', '1148577', null, '이번', '2', '1', '0', '식탁');
INSERT INTO `product` VALUES ('1248590', '44', '겁네 잘찍혀 블박', '150000', '200000', '150000', '2017-02-15 18:45:00', '2017-02-20 18:45:00', '0', 'CLAIR2_img01.jpg', '<p><span style=\"font-size: 24pt;\">니차아무도 못건딘다</span></p>', '3', '1', '1148577', null, '이번', '4', '2', '0', '블랙박스');
INSERT INTO `product` VALUES ('1248591', '44', '우리 아들이 선물한건데 급전필요해서 팜', '70000', '2000000', '70000', '2017-02-15 18:47:00', '2017-02-20 18:47:00', '0', 'supassev_1k.jpg', '<p><span style=\"font-size: 24pt;\">아들한테 안들키길 기도해주면 깎아준다</span></p>', '5', '1', '1148578', null, '삼번', '4', '2', '0', '스포츠카');
INSERT INTO `product` VALUES ('1248592', '14', '추성훈 근육을 녹이는 의자', '5000000', '6000000', '5000000', '2017-02-15 18:49:00', '2017-02-22 18:49:00', '0', '3191988_1.jpg', '<span style=\"font-size: 24pt;\">녹아부러</span>', '5', '1', '1148579', null, '사번', '2', '2', '0', '안마의자');
INSERT INTO `product` VALUES ('1448577', '16', '피카츄 퍼즐', '10000', '20000', '10000', '2017-02-15 18:20:00', '2017-02-18 18:20:00', '0', 'front_02964.jpg', '<font face=\"돋움체, DotumChe, AppleGothic\"><span style=\"font-size: 24px;\"><b>3D 직소퍼즐</b></span></font>', '5', '1', '1348576', null, '김미뇽', '2', '2', '0', '피카츄');
INSERT INTO `product` VALUES ('1448579', '30', '뉴 닌텐도', '50000', '70000', '50000', '2017-02-15 18:25:00', '2017-02-22 18:25:00', '0', 'front_27904.jpg', '<p><span style=\"font-size: 11pt;\">닌텐도 팝니다~</span></p>', '5', '1', '1348578', null, '김리리', '3', '2', '0', '닌텐도');
INSERT INTO `product` VALUES ('1448581', '22', '아이옷', '5000', '10000', '5000', '2017-02-15 18:28:00', '2017-02-20 18:28:00', '0', 'front_sub_95dcb.jpg', '<p><span style=\"font-size: 11pt;\">아이옷 팔아요~</span><span style=\"font-family: 돋움, Dotum; font-size: 11pt;\">﻿</span></p>', '1', '1', '1348580', null, '박니노', '2', '3', '0', '아동복');
INSERT INTO `product` VALUES ('1448583', '52', '영화 DVD', '4000', '8000', '4000', '2017-02-15 18:32:00', '2017-02-20 18:32:00', '0', '443565846_front_91479259865_634aa.jpg', '<p style=\"text-align: center; \" align=\"center\"><span style=\"font-size: 18pt;\"><u>디브이디입니다</u></span></p><p><br></p>', '5', '1', '1348582', null, '사사사', '5', '3', '0', '디브이디');
INSERT INTO `product` VALUES ('1448585', '8', '스마트밴드', '50000', '100000', '50000', '2017-02-15 18:35:00', '2017-02-18 18:35:00', '0', 'front_acba2.jpg', '<p>발신자표시 문자메세지 확인 가능한</p><p align=\"left\" style=\"text-align: left;\">스마트밴드 팝니다~</p>', '5', '1', '1348584', null, '피고내', '1', '3', '0', '시계');
INSERT INTO `product` VALUES ('1448586', '27', '접이식 드라이기', '10000', '50000', '10000', '2017-02-15 18:38:00', '2017-02-20 18:38:00', '0', 'front_94b05.jpg', '드라이기 처분합니다', '5', '1', '1348584', null, '피고내', '3', '1', '0', '헤어드라이기');
INSERT INTO `product` VALUES ('1448587', '9', '모던 수납장', '50000', '90000', '50000', '2017-02-15 18:42:00', '2017-02-20 18:42:00', '0', '293496533_front_b39a6_1469502746production.jpg', '서랍장 팝니당', '1', '1', '1348584', null, '피고내', '2', '1', '0', '수납장');
INSERT INTO `product` VALUES ('1448588', '26', '세라믹 전자레인지', '40000', '70000', '40000', '2017-02-15 18:45:00', '2017-02-20 18:45:00', '0', '483925070_front_f92780659b_8b614.jpg', '<p>전자레인지 사세용</p>', '1', '1', '1348578', null, '김리리', '3', '1', '0', '전자레인지');
INSERT INTO `product` VALUES ('1448589', '43', '로드바이크 ', '100000', '200000', '100000', '2017-02-15 18:47:00', '2017-02-20 18:47:00', '0', 'front_e7be3.jpg', '로드 바이크입니다', '1', '1', '1348576', null, '김미뇽', '4', '1', '0', '자전거');
INSERT INTO `product` VALUES ('1448590', '44', '자동차 무드등', '20000', '60000', '20000', '2017-02-15 18:50:00', '2017-02-18 18:50:00', '0', 'front_22bab.jpg', '<p><br></p><p>자동차 실내 조명팝니다~~~~</p>', '5', '1', '1348580', null, '박니노', '4', '2', '0', '조명');
INSERT INTO `product` VALUES ('1448591', '33', 'hp 노트북', '200000', '350000', '200000', '2017-02-15 18:52:00', '2017-02-22 18:52:00', '0', 'front_b1457.jpg', '<p>노트북입니당</p><p>사세요~</p>', '1', '1', '1348582', null, '사사사', '3', '3', '0', '노트북');
INSERT INTO `product` VALUES ('1448592', '31', '라이언 휴대폰 케이스', '3000', '25000', '3000', '2017-02-15 20:09:00', '2017-02-20 20:07:00', '0', 'front_3a9d9.jpg', '<p><span style=\"font-size: 36pt; color: rgb(229, 115, 174);\">라이언 분양합니다.</span>&nbsp;</p>', '5', '1', '1048591', null, '아이티윌', '3', '2', '0', '라이언');
INSERT INTO `product` VALUES ('1448593', '16', '라이언 분양함', '8000', '120000', '8000', '2017-02-15 20:10:00', '2017-02-22 20:10:00', '0', '453875138_front_3086d_1483694506production.jpg', '<p><span style=\"font-size: 24pt; color: rgb(255, 0, 0);\">라이언이 최고야ㅋㅋㅋㅋ</span></p>', '5', '1', '1048591', null, '아이티윌', '2', '2', '0', '카카오톡');

-- ----------------------------
-- Table structure for `product_board`
-- ----------------------------
DROP TABLE IF EXISTS `product_board`;
CREATE TABLE `product_board` (
  `num` int(10) NOT NULL AUTO_INCREMENT,
  `product_no` int(20) DEFAULT NULL,
  `id` varchar(20) NOT NULL,
  `seller_no` int(20) NOT NULL,
  `pw` varchar(20) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `re_ref` int(10) DEFAULT NULL,
  `re_lev` int(10) DEFAULT NULL,
  `re_seq` int(10) DEFAULT NULL,
  `readcount` int(10) DEFAULT NULL,
  `date` datetime NOT NULL,
  `qnastatus` int(1) NOT NULL DEFAULT '0',
  `reply` varchar(2000) DEFAULT '',
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_board
-- ----------------------------

-- ----------------------------
-- Table structure for `purchase_list`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_list`;
CREATE TABLE `purchase_list` (
  `seller_no` int(20) NOT NULL DEFAULT '0',
  `product_no` int(20) NOT NULL DEFAULT '0',
  `product_name` varchar(200) NOT NULL,
  `product_mainimg` varchar(200) DEFAULT NULL,
  `e_time` datetime NOT NULL,
  `price_end` int(20) NOT NULL,
  `buyer_no` int(20) NOT NULL,
  PRIMARY KEY (`product_no`,`seller_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of purchase_list
-- ----------------------------

-- ----------------------------
-- Table structure for `tender_list`
-- ----------------------------
DROP TABLE IF EXISTS `tender_list`;
CREATE TABLE `tender_list` (
  `no` int(20) NOT NULL AUTO_INCREMENT,
  `product_no` int(20) NOT NULL DEFAULT '0',
  `product_name` varchar(200) NOT NULL,
  `product_mainimg` varchar(200) DEFAULT NULL,
  `seller_no` int(20) NOT NULL DEFAULT '0',
  `buyer_no` int(20) NOT NULL DEFAULT '0',
  `buyer_id` varchar(100) NOT NULL,
  `tender_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time` datetime NOT NULL,
  `tender_price` int(20) NOT NULL DEFAULT '0',
  `count` int(20) DEFAULT '0',
  `state` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tender_list
-- ----------------------------

-- ----------------------------
-- Table structure for `wishlist`
-- ----------------------------
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist` (
  `num` int(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(20) NOT NULL,
  `product_no` int(10) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `e_time` datetime NOT NULL,
  `state` int(10) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wishlist
-- ----------------------------
