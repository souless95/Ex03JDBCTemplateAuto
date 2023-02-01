<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./commons/header.jsp" %>
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
    <!-- Top영역 -->
    <%@ include file="./commons/top.jsp" %>
    <!-- Body영역 -->
    <div class="row">
        <!-- Left메뉴영역 -->
        <%@ include file="./commons/left.jsp" %>
        <!-- Contents영역 -->
        <div class="col-9 pt-3">
            <h3>패스워드 검증 - <small>자유게시판</small></h3>
            <span style="color:red; font-size:1.8em;">
				${isCorrMsg }
			</span>	
            <form name="writeFrm" method="post" 
				action="./passwordAction.do" 
				onsubmit="return checkValidate(this);">
                	<input type="hidden" name="idx" value="${idx }" />
					<input type="hidden" name="mode" value="${param.mode }" />
					<input type="hidden" name="nowPage" value="${param.nowPage }" />		
                <table class="table table-bordered">
                <colgroup>
                    <col width="20%"/>
                    <col width="*"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">패스워드</th>
                        <td>
                            <input type="text" class="form-control" 
                                style="width:200px;" name="pass" />
                        </td>
                    </tr>
                </tbody>
                </table>

                <!-- 각종버튼 -->
                <div class="row mb-3">
                    <div class="col d-flex justify-content-end">
                        <button type="submit" class="btn btn-danger">작성완료</button>
                        <button type="reset" class="btn btn-dark">RESET</button>
                        <button type="button" class="btn btn-warning" onclick="location.href='./list.do';">목록보기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Copyright영역 -->
    <%@ include file="./commons/copyright.jsp" %>
</div>
</body>
</html>