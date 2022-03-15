 <%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$( function(){	
	$("#brand").on("click",function(){
		self.location = "/";
	});
	$("a[href='#' ]:contains('Home')").on("click" , function() {
		self.location = "/"
	});
	$("a[href='#' ]:contains('Sign Up')").on("click" , function() {
		self.location = "/user/addUser"
	});
	/* $("a[href='#' ]:contains('Login')").on("click" , function() {
		self.location = "/user/login"
	}); */
	$("a[href='#' ]:contains('Logout')").on("click" , function() {
		self.location = "/user/logout"
	});
	
});
$( function(){
	
	$("a:contains('�̺�Ʈ����')").on("click",function(){
		self.location = "/event/getEventManage";
	});
	$("a:contains('�� ���� ����')").on("click",function(){	
	
		self.location = "/user/myPage?userId=${user.userId}";
	});
	
	$("a:contains('���� �̺�Ʈ')").on("click",function(){		
		self.location = "/event/getInterestedEventList";
	});
});
$( function(){
	$("a:contains('�ǸŸ�� ��ȸ')").on("click",function(){		
		self.location = "/ticket/getTicketList?menu=seller";
	});
	$("a:contains('Ƽ�ϰ���')").on("click",function(){		
		self.location = "/tran/getTranList?menu=check";
	});
	$("a:contains('ȸ������')").on("click",function(){		
		self.location = "/user/listUser";
	});
	$("a:contains('�Ű� ����Ʈ ����')").on("click",function(){		
		self.location = "/community/getReportList";
	});
	$("a:contains('�ŷ����� ��ȸ')").on("click",function(){		
		self.location = "/tran/getTranList?menu=user";
	});
});	
$( function(){	
	$("a:contains('�����ۼ�')").on("click",function(){
		popWin = window.open("/rnp/addReview?tranNo=10002","popWin",
				"left=500, top=100, width=600, height=450, "
				+"marginwidth=0, marginheight=0, scrollbars, scrolling, menubar=no, resizable");
		
//			self.location = "/rnp/addReview?tranNo=10000";
	});
	$("a:contains('�� ���� ��ȸ')").on("click",function(){
		self.location = "/rnp/getReviewList";
	});
	$("a:contains('�� ���� ��ȸ')").on("click",function(){
		self.location = "/rnp/getSellerEstimationList?sellerId=${user.userId}";
	});
	$("a:contains('����Ʈ ���� ��ȸ')").on("click",function(){
		self.location = "/rnp/getPointHistory";
	});
	
	$("a[href='#' ]:contains('�� ���� ��ȸ')").on("click" , function() {		
		
		var popOption = "left=500, top=100, width=500, height=500, resizable=no, location=no;"		
			window.open("/coupon/getCouponList?userId=${sessionScope.user.userId}","�� ���� ��ȸ",popOption);
	});
	
	$("a[href='#' ]:contains('Logout')").on("click" , function() {
		self.location = "/user/logout"
	});
});
$( function(){				
	
	if('${user}'!=''){
		getNoReadAlarmCount("${user.userId}"); 
	}			
	//�˶�����Ʈ madal ���
	$("#alarmButton").on("click", function(){
		getAlarmModal("${user.userId}");				
	});	
});

$(function() {
	
	$( "a[href='#']:contains('Ƽ�ϰŷ� ����')" ).on("click" , function() {
		
		self.location="/community/getContentList?searchCondition=2&searchKeyword=0";	
	
	});
	
	$( "a[href='#']:contains('�����Խ��� �̿����')" ).on("click" , function() {
		self.location="/community/getContentList?searchCondition=2&searchKeyword=1";	
	
	});
 
	 $( "a[href='#']:contains('���ֹ�������')" ).on("click" , function() {
			self.location="/community/getContentList?searchCondition=3";
		
		});
	 
	 $( "a[href='#']:contains('��ϴ�')" ).on("click" , function() {
			self.location="/community/getContentList?searchCondition=2&searchKeyword=3";	
		
		});
	 
	 $( "a[href='#']:contains('�˴ϴ�')" ).on("click" , function() {
			self.location="/community/getContentList?searchCondition=2&searchKeyword=4";	
		
		});
	 
	 $( "a[href='#']:contains('���ٹ�')" ).on("click" , function() {
			self.location="/community/getContentList?searchCondition=2&searchKeyword=5";	
		
		});
	 $( "a[href='#']:contains('ȯ�ҰԽ���')" ).on("click" , function() {
			self.location="/community/getRefundList";	
		
		});
	 
	 $( "a[href='#']:contains('�� ã�� �ȳ�')" ).on("click" , function() {
		 var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"	                    
             window.open("/community/getSearchLoad","T-get �� ã�� ",popOption);	
		 
		});
	 
	 $( "a[href='#']:contains('��������')" ).on("click" , function() {
			self.location="/community/getContentList?searchCondition=2&searchKeyword=0";	
		
		});
	  
	 $( "a[href='#']:contains('�����Խ���')" ).on("click" , function() {
		self.location="/community/getContentList?searchCondition=2&searchKeyword=3";	
		
		});
	 
	 $( "a[href='#']:contains('������')" ).on("click" , function() {
			self.location="/community/getContentList?searchCondition=3";
		
		});
	 
	 
	 
});
$(function getSearchWeather(lat, lon) {
	
	$("a[href='#']:contains('���� �ȳ�')").on("click" , function() {
			
						
			$.ajax( 
					
					{
						url : "/community/rest/getSearchWeather/",
						method : "POST" ,

						data : JSON.stringify({
							lat : lat,
							lon : lon,
						}),
						headers : {
							
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
						
							var displayValue ="���� : "+JSONData.weather+"<br/>"
											+"�µ� : "+JSONData.temp+"��<br/>"
											+"ǳ�� : "+JSONData.wind+"m/s<br/>"
											+"�帲 : "+JSONData.clouds+"%<br/>";
							
							$(".modal-body").html(displayValue);
						}
				});
	});		
});	
</script>
<style>
	/*Modal*/
		
		.login-wrap{
			width:100%;
			margin:auto;
			max-width:525px;
 			position:relative; 
			background-color: black;
			
			background:url(/resources/images/logins2.jpg) no-repeat center;
	


			overflow:auto;
			
		}
		.login-html{
			background:rgba(40,57,101,.9);			
		}
		.close{
			color: black;
		}
</style>

		<!-- Header -->
			<header id="header">
				<h1><a id="brand" href="#" style="color: white;">T-GET <span>by MFC</span></a></h1>
				
				
				<a href="/" style="color: white;"><i class="fas fa-home"></i>&nbsp;</a>
				
								
				<c:if test="${!empty user}">	
					<a href="#" id="alarmButton" data-target="#alarmModal" data-toggle="modal" style="color: white;">
							<i class="fas fa-bell"></i><span class="badge badge-info" id="noReadAlarmCount"></span>
					</a>
					
					
					
					  <button class="btn btn dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white;padding-top:0px;">
					    <i class="fas fa-user-edit"></i></button>					  	
					  <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					    <a class="dropdown-item" href="#">��������</a>
					    <a class="dropdown-item" href="#">�����Խ���</a>
					    <a class="dropdown-item" href="#">������</a>
					    <a class="dropdown-item" href="#">�� ã�� �ȳ�</a>
					  </div>

				</c:if>	
				<c:if test="${empty user}">
					<a href="#" style="color: white;">Sign Up</a>
					<a href="#" id="loginButton" data-toggle="modal" data-target="#my80sizeCenterModal" style="color: white;" >Login</a>
				</c:if>
				<c:if test="${!empty user}">
					<a href="#" style="color: white;">Logout</a>
				</c:if>
				<c:if test="${!empty user}">			
				<a href="#menu" style="color: white;">Menu</a>
				</c:if>					  
			
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li class="text-center">
					<br/>
					      <div class="text-center"><strong>My Menu</strong></div>
					<br/>  
				          <a href="#">�� ���� ����</a>
				          <a href="#">���� �̺�Ʈ</a>				          
				          <a href="#">�ǸŸ�� ��ȸ</a>
				          <a href="#">�ŷ����� ��ȸ</a>
				          <a href="#">�� ���� ��ȸ</a>
				          <a href="#">�� ���� ��ȸ</a>
				          <a href="#">�� ���� ��ȸ</a>
				          <a href="#">����Ʈ ���� ��ȸ</a>
				    </li>     																				
					
				</ul>
				
				<c:if test="${user.role == 2 }">
				<ul class="links">
					<li class="text-center">
						 <div class="text-center"><strong>Admin Menu</strong></div>
						 <br/>
				          <a href="#">ȸ������</a>				          
				          <a href="#">Ƽ�ϰ���</a>
				          <a href="#">�̺�Ʈ����</a>
				          <a href="#">�Ű� ����Ʈ ����</a>
					</li> 
				 </ul>
				 </c:if>
			</nav>

<!-- �˸����� ���â  -->
					<div class="modal fade" id="alarmModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content" style="background-color:#D9E5FF;">
					    <div class="modal-wrap">
     					 <div class="modal-html" style="background-color:#D9E5FF;">
					       <div class="text-secondary text-center" style="padding-top: 30px;"><h3 style="color: #041625;"><i class="far fa-bell"></i> My Alarm</span></h3>
					     <div id="alarmModalBody" class="modal-body" style="background-color:#D9E5FF;">
					      </div>
					      
					      </div>
					     </div>
					    </div>
					  </div>
					</div>
					</div>
<!-- ���� �ȳ� Modal -->
					<div class="modal fade" id="weatherModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
									  <div class="modal-dialog modal-dialog-centered modal-md" role="document">
									    <div class="modal-content modal-80size" style="color: white;">
									    <div class="modal-weather">
									      <div class="modal-header"> 
									        <h5 class="modal-title" id="modalCenterTitle"><strong>���� �ȳ�</strong></h5>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
									      </div>
									      <div class="modal-body" id="getWeatherModalBody">
									     
									      </div>     
									   </div>
									          
									      <div class="modal-footer">
				<!-- 					        <button type="button" class="btn btn-danger" data-dismiss="modal">���</button> -->
				<!-- 					        <button type="button" class="btn btn-primary">Ȯ��</button> -->
									        
									      </div>
									    </div>
									    </div>
									  </div>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>





<script type="text/javascript">

	$( function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#forgotId' ]").on("click" , function() {
		
			var popOption = "left=560, top=200, width=430, height=400, resizable=no, location=no;"		
				window.open("/user/finduserId","find userId",popOption);
		});
	});
	
	$( function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#forgotPassword' ]").on("click" , function() {
		
			var popOption = "left=560, top=200, width=430, height=420, resizable=no, location=no;"		
				window.open("/user/findPassword","find password",popOption);
		});
	});
	
	$( function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#signUp' ]").on("click" , function() {
		
			self.location = "/user/addUser"
		});
	});
	
	$( function() {
		
		 $("input[name='password']").on("keypress",function(){
				if (event.keyCode ==13) {
					$("input[id='signin']").click();
				}
			});
		
		
		$("#userId").focus();
		
		$("input[id='signin']").on("click" , function() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			
			
			
			if(id == null || id.length <1) {				
				swal("ID�� �Է����� �����̽��ϴ�.", "", "warning");
				$("#userId").focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				swal("�н����带 �Է����� �����̽��ϴ�.", "", "warning");
				$("#password").focus();
				return;
			}
			
			 $.ajax({ 
				   url: "/user/json/login",
			   data: { 
				   userId: $("#userId").val(), 
				   }, 
				   type: "post", 
				   dataType: "json",
			   success: function(JSONData){ 
				   console.log(JSONData);
				   
				   if (JSONData.msg == "no") {
					  	  swal("�Է��Ͻ� ȸ�������� �����ϴ�.", "", "warning");	
						  return;
			  		 }else if(JSONData.dbPwd != pw){
			  			  swal("��й�ȣ�� Ȯ�����ּ���.", "", "warning");	
			  			  return;			  		 	   
			   		}else if (JSONData.msg == "true") { 
			  			
			  			swal(JSONData.nickName,
			  		"������Ʈ ��������"+JSONData.startDate+"\n"+"\n������Ʈ ��������"+JSONData.endDate,
			  	      "error");
			  	
				   } else if (JSONData.msg == "false") { 
					   		$("form[name='user-login']").attr("method","POST").attr("action","/user/login").submit();
				  	 	
				   }
				   
		
			   }
				   });
	});	
		
		
		
		});
	
	$( function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[id='kakao' ]").on("click" , function() {
				
				var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"		
				window.open("https://kauth.kakao.com/oauth/authorize?client_id=ea9f389c17a2bd4b4fd122a0c9184bc2&redirect_uri=http://192.168.0.16:8080/user/kakaoLogin&response_type=code","Kakao login",popOption);
				
				
		});
	});
	
	$( function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[id='naver' ]").on("click" , function() {
				
				var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"		
				window.open("https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=AziWQOW7S2sZhD1PEBi9&state=STATE_STRING&redirect_uri=http://192.168.0.16:8080/user/naverLogin","Naver login",popOption);
				
				
		});
	});
</script>




<!-- 80%size Modal at Center -->
<form name="user-login" class="form-horizontal">
<div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
  <div class="modal-dialog modal-80size modal-center" role="document">
    <div class="modal-content">     
    <div class="login-wrap">
	<br><br><div class="text-center" >
	
	<h3><a id="brand" href="#" style="color: white;">T-GET <span>Login</span></a></h3>
			</div>
		<div class="login-form">
			<div class="sign-in-htm">
			<br>
				<div class="group col-md-12" >

					<label for="user" class="label"><span><h4>��Id</h4></span></label>
					<input id="userId" name="userId" type="text" class="input" placeholder="Email" >

				</div>
				<div class="group col-md-12">
					<label for="pass" class="label"><span><h4>��Password</h4></span></label>
					<input id="password"  name="password"  type="password" class="input" data-type="password" placeholder="Password">
				</div><br>
				<div class="group col-md-12">
					<input id="signin" class="button" value="Sign In" data-toggle="modal" style="readOnly=true;">
				</div>
				
				<div class="text-center">
				     <a id="kakao"><img src="/resources/images/kakaologin.png" style="width:230px; height: 45px; border-radius: 30px;"/></a>
    				 <a id="naver"><img src="/resources/images/naverlogin.PNG"  style="width:230px; height: 45px; border-radius: 30px;"/></a>
		
		</div>
			<div class="foot-lnk"><span style="color:gray;">Not a member?</span>   
					<a href="#signUp" style="color:white;">Sign up</a>
				</div>			<br>
				<div class="foot-lnk" >
					<a href="#forgotId" style="color:white;">Forgot Id?   </a>
				<br>	<a href="#forgotPassword" style="color:white;">Forgot Password?</a>
			</div>
		
		</div>
	</div>
	

</div>
</div>
</div>
</div> <!-- ---�α���â--- -->
</form>	


		 
		 



	
		