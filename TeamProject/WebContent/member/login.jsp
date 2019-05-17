<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="article">

	<div class="loginwrap">
		<form class="form-signin" action="./MemberLoginAction.me" id="login">
			<div class="log1">
				<table class="login_tb">
					<tr>
						<td>아이디</td>
						<!-- 나중에 이미지로 대체 -->
						<td><input type="text" class="lg_text" name="id" placeholder="아이디" autofocus="autofocus"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<!-- 나중에 이미지로 대체 -->
						<td><input type="password" class="lg_text" name="pw" placeholder="비밀번호"></td>
					</tr>
					<tr>
						<td colspan="2"><img src="images/ico_access.gif"> 보안접속</td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" class="lg_bt" value=""></td>
					</tr>
				</table>
			</div>
		</form>
		<!-- log1 끝 -->

		<div class="log_img">
			<img src="images/login_img.jpg">
			<!-- 사이즈 수정 이미지로 교체하기 -->
		</div>
		<!-- log_lmg 끝 -->

		<div class="log_info">
			<table class="info_tb">
				<tr>
					<td><img src="images/sub_login_text04.gif"></td>
					<td><a href="./MemberJoin.me"><img src="images/sub_login_btn_join.gif"></a></td>
				</tr>
				<tr>
					<td><img src="images/sub_login_text02.gif"></td>
					<td><img src="images/sub_login_btn_idsearch.gif"></td>
				</tr>
				<tr>
					<td><img src="images/sub_login_text03.gif"></td>
					<td><img src="images/sub_login_btn_pwsearch.gif"></td>
				</tr>
			</table>
		</div>
		<!-- log_info 끝 -->
	</div>
	<!-- loginwrap 끝 -->
</div>
<!-- article 끝 -->

