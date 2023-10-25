<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="구매 화면, 신용카드 및 배송정보 입력" %>
<!-- 프로젝트용 CDN -->
<%@ include file="../cdn/cdn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#buyTitle{
width: 500px;
text-align: center;
margin: 0px auto;
padding: 10px;
font-weight: bold;
font-size: 18px;
font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
color: #FFF;
background: #000;
}
#buyBtn{
width: 100%;
text-align: center;
margin: 0px auto;
padding: 10px;
font-weight: bold;
font-size: 18px;
font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
color: #FFF;
background: #222;
}
#dlvrInput{
padding-top: 10px;
}
#tdLabel1{
padding-bottom: 7px;
}
#tdLabel2{
padding-bottom: 15px;
}
#buyDiv{
width: 500px;
margin: 0px auto;
position: relative;
padding-left: 5px;
padding-right: 5px;
border-left: 3px solid #EBEDF0;
border-right: 3px solid #EBEDF0;
}
#dg{
height: 90px;
}
#dg > p{
padding-left: 85px;
padding-bottom: 5px;
}
.form-control{
min-height: 38px;
}
.form-select{
min-height: 38px;
}
.title{
width: 500px;
margin: 0px auto;
position: relative;
padding-left: 5px;
padding-right: 5px;
font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
border-left: 3px solid #EBEDF0;
border-right: 3px solid #EBEDF0;
}
.secTitle{
border-top: 1px solid #BCBDC0;
font-size: 16px;
font-weight: bold;
font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
padding: 10px;
}
.tdLabel{
min-width: 110px;
max-height: 56px;
vertical-align: middle;
text-align: left;
padding-left: 10px;
}
.pil{
font-weight: bold;
color: red;
}
label {
padding: 0.5em;
font-size: 16px;
font-family: Roboto, "Noto Sans KR", "malgun gothic", 맑은고딕, NanumGothic, dotum, 돋움, sans-serif;
}
#buyMain > img{
border: 1px solid #333;
}
</style>
<script type="text/javascript">
	$(function() {
		let flag;
		$("#card").click(function() {
			document.getElementById("card").classList.add("active");
			flag = 1;
	    });
		
		$("#buyBtn").click(function() {
			if (flag !== 1) {
				alert("결제 방법을 선택해주세요.");
				return;
			}
			
			let inputList = [$("input[name='name']").val(), $("input[name='zipcode']").val(), $("input[name='addr1']").val(),
				$("input[name='addr2']").val(), $("input[name='cell']").val(), $("input[name='email']").val()];
			
			let msg = $("#inputGroupSelect03 option:selected").val();
			let check = $("#flexCheckDefault").is(":checked");
			
			for(var i = 0; i < inputList.length; i++) {
				if(inputList[i] === "") {
					alert("필수 입력란을 모두 채워주세요.");
					return;
				}
			}
			
			location.href = "insert_card.jsp";
		});
	});
</script>
</head>
<body>
<!-- header -->
<div>
<%@ include file="layout/header.jsp" %>
</div>
<div id="buyMain">
<div id="buyTitle">
주문 / 결제
</div>
	<div class="title">
	<form method="post" id="dlvrFrm">
	<table>
	<tr>
		<td id="tdLabel1" class="tdLabel">
			받는사람<span class="pil">*</span>
		</td>
		<td>
			<div class="input-group mb-3" id="dlvrInput">
		     	<input type="text" name="name" class="form-control" aria-label="Username" aria-describedby="inputGroup-sizing-lg">
		    </div>
	    </td>
	</tr>
	<tr>
		<td id="tdLabel2" class="tdLabel">
			주소<span class="pil">*</span>
		</td>
		<td>
			<div class="input-group mb-3">
		     	<input value="12345" type="text" name="zipcode" class="form-control" placeholder="우편번호" aria-label="Disabled input example" disabled readonly aria-describedby="button-addon2">
	      		<input class="btn btn-outline-secondary" type="button" id="button-addon2 btnAddr" value="주소검색"/>
		    </div>
	    </td>
	</tr>
	<tr>
		<td colspan="2">
			<div class="input-group mb-3">
		     	<input type="text" name="addr1" class="form-control" placeholder="기본주소" aria-label="Username" aria-describedby="basic-addon1">
		    </div>
	    </td>
	</tr>
	<tr>
		<td colspan="2">
			<div class="input-group mb-3">
		     	<input type="text" name="addr2" class="form-control" placeholder="상세주소" aria-label="Username" aria-describedby="basic-addon1">
		    </div>
	    </td>
	</tr>
	<tr>
		<td id="tdLabel2" class="tdLabel">
			휴대전화<span class="pil">*</span>
		</td>
		<td>
			<div class="input-group mb-3">
		     	<input type="text" name="cell" class="form-control" placeholder="010-0000-0000" aria-label="Username" aria-describedby="basic-addon1">
		    </div>
	    </td>
	</tr>
	<tr>
		<td id="tdLabel2" class="tdLabel">
			이메일<span class="pil">*</span>
		</td>
		<td>
			<div class="input-group mb-3">
		      <input type="text" name="email" class="form-control" placeholder="example@domain.com" aria-label="Username">
	    	</div>
	    </td>
	</tr>
	</table>
	<div class="input-group mb-3">
	  <select class="form-select" name="msg" id="inputGroupSelect03" aria-label="Example select with button addon" style="font-size: 12px;">
	    <option value="0" selected>-- 메시지 선택 (선택사항) --</option>
	    <option value="1">문앞에 놓고 가주세요.</option>
	    <option value="2">경비실에 맡겨 주세요.</option>
	    <option value="3">도착 전 전화 부탁드립니다.</option>
	  </select>
	</div>
	<div class="form-check" style="margin-bottom: 0px;">
	  <input class="form-check-input" name="chk" type="checkbox" value="" id="flexCheckDefault" style="border: 1px solid #333; min-width: 17px;min-height: 17px;">
	  <label class="form-check-label" for="flexCheckDefault" style="padding: 0px;padding-top: 2px; margin: 0px;font-size: 12px;">기본 배송지로 저장</label>
	</div>
	</form>
</div>
<div class="title">
	<div class="secTitle"> 
	주문상품
	</div>
	<div id="dg">
	<img src="https://duciel.co.kr/web/product/extra/small/20220615/1df408698c77921b06cf98c1d173ecf6.jpg" class="rounded float-start" alt="상품명" width="70px" height="70">
	<p>상품명 외 1개</p>
	<p>수량 1개</p>
	<p>320,000원</p>
	</div>
</div>
	<div style="background: #EBEDF0;width: 500px; height: 50px;margin: 0px auto;padding-top: 10px;">
	<span style="margin: 10px;margin-top:0px; float: left;">배송비</span>
	<span style="padding-top:5px;padding-right:10px; float: right;">2,500원</span>
	</div>
	<div class="title" style="height: 5px;"></div>
<div class="title" style="padding-left: 0px;padding-right: 0px;">
	<div class="secTitle" style="padding-left: 15px;padding-right: 15px;">
	결제 정보
	</div>
	<div style="padding-left: 15px;padding-right: 10px;">
		<p><span style="float: left;">주문상품</span><span style="float: right;">320,000원</span><br></p>
		<p><span style="float: left;">배송비</span><span style="float: right;">+2,500원</span><br></p>
		<p><span style="float: left;">할인/부가결제</span><span style="float: right;color: red;">-0원</span><br></p>
	</div>
	<div class="secTitle" style="border: 0px;margin-top: 12px;background: #E2EDF8;color: #0080FF;height: 40px;">
		<p><span style="float: left;">최종 결제 금액</span><span style="float: right;">322,500원</span></p>
	</div>
</div>
<div class="title" style="padding-left: 0px;padding-right: 0px;border-bottom: 3px solid #EBEDF0;">
	<div class="secTitle" style="padding-left: 15px;">
	결제수단
	</div>
	<div style="padding-left: 15px;">
	결제수단 선택
	</div>
	<div class="list-group" style="padding: 10px;">
      <input id="card" name="card" type="button" class="list-group-item list-group-item-action" aria-current="true" value="신용카드">
    </div>
    <div style="height: 50px;padding-left: 0px;padding-right: 0px;margin-top: 50px;position: relative;">
    	<a href="#void" id="buyBtn" style="position: absolute;bottom: 0px;">
    	322,500원 결제하기
    	</a>
    </div>
</div>
</div>
<div>
<!-- footer -->
<%@ include file="layout/footer.jsp" %>
</div>
</body>
</html>