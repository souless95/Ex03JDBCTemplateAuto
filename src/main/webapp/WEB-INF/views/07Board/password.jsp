<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="../static/bootstrap5.3.0/css/bootstrap.min.css">
	<script src="../static/bootstrap5.3.0/js/bootstrap.bundle.min.js"></script>
	<script src="../static/jquery/jquery-3.6.3.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	function checkValidate(f){
		if(f.pass.value==""){
			alert("패스워드를 입력하세요");
			f.pass.focus();
			return false;
		}
	}
</script>
<div class="container">
	<h2>회원제 게시판 - 패스워드검증폼</h2>	
	<!-- 패스워드 검증에 실패했을때 에러메세지 출력용 -->
	<span style="color:red; font-size:1.8em;">
		${isCorrMsg }
	</span>	
	<form name="writeFrm" method="post" 
		action="./passwordAction.do"
		onsubmit="return checkValidate(this);">	
	<!-- 
	파리미터 저장용도의 hidden박스
		일련번호인 idx는 Model에 저장되었으므로 아래와 같이 출력한다.
		mode의 경우 EL 내장객체인 param을 통해 view에서 파라미터를 받아서 출력한다.
	이와 같이 파라미터를 View에서 바로 사용할때는 굳이 request내장객체를 통해 폼값을 받지 않아도 된다.
	-->	
	<input type="hid den" name="idx" value="${idx }" />
	<input type="hid den" name="mode" value="${param.mode }" />
	<input type="hid den" name="nowPage" value="${param.nowPage }" />		
	<table border=1 width=800>
	<colgroup>
		<col width="25%"/>
		<col width="*"/>
	</colgroup>
	
	<tr>
		<td>패스워드</td>
		<td>
			<input type="password" name="pass" style="width:30%;" />
		</td>
	</tr>
	 
	<tr>
		<td colspan="2" align="center">
			<button type="submit">작성완료</button>
			<button type="reset">RESET</button>
			<button type="button" onclick="location.href='./list.do?nowPage=${param.nowPage}';">
				리스트바로가기
			</button>
		</td>
	</tr>
	</table>	
	</form>
</div>
</body>
</html>