<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>T-get</title>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Tab Styles Inspiration: A small collection of styles for tabs" />
	<meta name="keywords" content="tabs, inspiration, web design, css, modern, effects, svg" />
	<meta name="author" content="Codrops" />
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />	
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" type="text/css" href="/resources/css/tabs.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/tabstyles.css" />
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	
	<style>
		body {
			  background-color: #EBF7FF;
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a{
			color: #041625;
		}
		.img_wrap {
			width: 300px;
			margin: auto;
		}
		.img_wrap img {
			max-width: 100%;
		}
    </style>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
				   
	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/jquery.scrolly.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
    <script src="/resources/javascript/modernizr.custom.js"></script>
    
	<script type="text/javascript">
							
	</script>
	
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />
	
		<div class="row">
		<div class="col-lg-2">
      	<div class="sticky-top">
		<br/><br/><br/><br/>
			<div class="card text-center shadow-lg rounded" style="width: 12rem; color: #041625; margin-left: 20px;">
			  <div class="card-header">
			   <strong>Ƽ�� <i class="fas fa-user-cog"></i> �����ڸ޴� </strong>
			  </div>
			  <ul class="list-group list-group-flush">								
				<li class="list-group-item"><a href="#" data-target="#adminGuideModal" data-toggle="modal">������ ���̵�</a></li>
			  </ul>		  
			</div>
		
		  </div>   	
     	 </div>
		<div class="col-lg-8">	
			<section>
				<br/>
				<div class="tabs tabs-style-topline">
					<nav>
						<ul>
							<li><a href="#section-topline-1"><h6><strong>��ü �ŷ� ����</strong></h6></a></li>
							<li><a href="#section-topline-2"><h6><strong>Ƽ�� Check</strong></h6></a></li>
							<li><a href="#section-topline-3"><h6><strong>������ �Ա� Ȯ��</strong></h6></a></li>
							<li><a href="#section-topline-4"><h6><strong>�Ǹ��� �Ա�</strong></h6></a></li>
						</ul>
					</nav>
					<div class="content-wrap">
						<section id="section-topline-1">
						  <div class="input-group-prepend">
						  <label class="input-group-text" for="inputGroupSelect01">�˻�</label>						  
						  <select class="custom-select" id="inputGroupSelect01" style="width :150px;">
						    <option selected>All</option>
						    <option value="0">�Ա� ���</option>
						    <option value="1">��� ���</option>
						    <option value="2">��� ��</option>
						    <option value="3">��� �Ϸ�</option>
						    <option value="4">ȯ�� �� ���</option>
						  </select>
						  </div>
						<hr/>
							 <div class="row">
								 <c:forEach var="tran" items="${list}" varStatus="j">
								 	<div name="${tran.tranCode}" class="col-lg-4">								 	
								 	<div class="text-center">
								 		<div class="card text-center shadow rounded" style="height: 270px; margin-bottom: 10px;">
								 		<br/>
								 			<h5 class="card-title"><strong>${tran.event.koName}</strong></h5>
								 			<hr/>
								 			<h6><div class="font-weight-bold">${tran.orderDate}</div></h6>
								 			<h6><div class="font-weight-bold">${tran.seller.nickName} <i class="far fa-handshake"></i> ${tran.buyer.nickName}</div></h6><br/>
								 			<c:if test="${tran.tranCode=='0'}">
								 				<div class="progress" style="width: 70%; align-self: center;">
												 <div class="progress-bar progress-bar-striped bg-danger progress-bar-animated" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
								 				<div class="text-danger" style="padding-top: 10px;"><h6><span class="font-weight-bold">�������Ա� �����</span></h6></div>
								 			</c:if>
								 			<c:if test="${tran.tranCode=='1'}">
									 			<div class="progress" style="width: 70%; align-self: center;">
													<div class="progress-bar progress-bar-striped bg-warning progress-bar-animated" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
								 				<div class="text-warning" style="padding-top: 10px;"><h6><span class="font-weight-bold">�����Ϸ� (��۴��)</span></h6></div>
								 			</c:if>
								 			<c:if test="${tran.tranCode=='2'}">
								 				<div class="progress" style="width: 70%; align-self: center;">
													<div class="progress-bar progress-bar-striped bg-info progress-bar-animated" role="progressbar" style="width: 75%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
								 				<div class="text-info" style="padding-top: 10px;"><h6><span class="font-weight-bold">�����</span></h6></div>
								 			</c:if>
								 			<c:if test="${tran.tranCode=='3'}">
								 				<div class="progress" style="width: 70%; align-self: center;">
													<div class="progress-bar progress-bar-striped bg-success progress-bar-animated" role="progressbar" style="width: 100%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
								 				<div class="text-success" style="padding-top: 10px;"><h6><span class="font-weight-bold">��ۿϷ�</span></h6></div>
								 			</c:if>
								 			<c:if test="${tran.tranCode=='4'}">
								 				<div class="text-secondary" style="padding-top: 10px;"><h6><span class="font-weight-bold">ȯ�� �� ���</span></h6></div>
								 			</c:if>
								 			
								 			<div><small></small></div>
								 			<div><small></small></div>
								 			<br/>
								 		</div>								 		
								 	</div>	
								 	</div>
								 </c:forEach>
							 </div>
						</section>
						<section id="section-topline-2">
									
									 <div class="text-center">
								    
								      <div class="row" id="ticketCheckRow">
								      </div>
								    </div>
						</section>
						<section id="section-topline-3">
							<div class="row">
								 <c:forEach var="tran" items="${list}" varStatus="j">
								 <c:if test="${tran.tranCode=='0'}">
								 	<div class="col-lg-4">
								 	<div class="text-center">
								 		<div class="card text-center shadow rounded" style="height: 350px; margin-bottom: 10px;">
								 		<br/>
								 			<h5><strong>${tran.event.eventName}</strong></h5>
								 			<hr/>
								 			<div class="font-weight-bold">${tran.orderDate}</div>
								 			<div class="font-weight-bold"><i class="far fa-user"></i> ${tran.buyer.userId}</div><br/>
								 			<h6><div class="font-weight-bold">�̸� <i class="fas fa-check"></i> ${tran.buyer.userName}</div></h6>
								 			<h6><div class="font-weight-bold">�ݾ� <i class="fas fa-check"></i> ${tran.totalPrice}��</div></h6>
								 			<br/>
								 			<div><button type="button" name="depositCheck" id="${tran.tranNo}" class="btn btn-outline-success"><i class='fas fa-check'></i></button>
								 			  &nbsp;<button type="button" name="tranDelete" id="${tran.tranNo}" class="btn btn-outline-danger"><i class='fas fa-trash-alt'></i></button></div>
								 			<br/>
								 		</div>
								 	</div>	
								 	</div>
								 </c:if>	
								 </c:forEach>
							 </div>
						</section>
						<section id="section-topline-4">
							<div class="row">
								 <c:forEach var="tran" items="${list}" varStatus="j">
								 <c:if test="${tran.tranCode=='3'}">
								 	<div class="col-lg-4">
								 	<div class="text-center">
								 		<div class="card text-center shadow rounded" style="height: 430px; margin-bottom: 10px;">
								 		<br/>
								 			<h5><strong>${tran.event.eventName}</strong></h5>
								 			<hr/>
								 			<div class="font-weight-bold">${tran.orderDate}</div>
								 			<div class="font-weight-bold"><i class="far fa-user"></i> ${tran.seller.userId}</div><br/>
								 			<h6><div class="font-weight-bold">������ <i class="fas fa-check"></i> ${tran.seller.userName}</div></h6>
								 			<h6><div class="font-weight-bold">�������� <i class="fas fa-check"></i>
											<c:choose>
								 			<c:when test="${tran.seller.accountBank==039}">�泲����</c:when>
								 			<c:when test="${tran.seller.accountBank==004}">��������</c:when>
								 			<c:when test="${tran.seller.accountBank==034}">��������</c:when>
								 			<c:when test="${tran.seller.accountBank==003}">�������</c:when>
								 			<c:when test="${tran.seller.accountBank==031}">�뱸����</c:when>
								 			<c:when test="${tran.seller.accountBank==045}">�������ݰ�</c:when>
								 			<c:when test="${tran.seller.accountBank==088}">��������</c:when>
								 			<c:when test="${tran.seller.accountBank==048}">��������</c:when>
								 			<c:when test="${tran.seller.accountBank==027}">��Ƽ����</c:when>
								 			<c:when test="${tran.seller.accountBank==020}">�츮����</c:when>
								 			<c:when test="${tran.seller.accountBank==071}">��ü��</c:when>
								 			<c:when test="${tran.seller.accountBank==005}">��ȯ����</c:when>
								 			<c:when test="${tran.seller.accountBank==081}">�ϳ�����</c:when>								 			
								 			</c:choose>	
											</div></h6>
								 			<h6><div class="font-weight-bold">���ݰ��� <i class="fas fa-check"></i>${tran.seller.accountNo}</div></h6><br/>
								 			<h6><div class="font-weight-bold">�Աݾ� <i class="fas fa-check"></i> ${tran.totalPrice}��</div></h6>
								 			<br/>
								 			<div><button type="button" name="depositSeller" id="${seller.sellerId}" class="btn btn-outline-success"><i class="fas fa-money-check-alt"></i></button></div>
								 			<br/>
								 		</div>
								 	</div>	
								 	</div>
								 </c:if>	
								 </c:forEach>
							 </div>
						</section>
					</div><!-- /content -->
				</div><!-- /tabs -->
			</section>
			</div>
			<div class="col-lg-2">
			<div class="sticky-top">
			<br/><br/><br/><br/><br/><br/>
				<iframe id="cyberWidget" class="embed-responsive-item" height="180px" width="170px" src="https://www.cyber.go.kr/widget.html" allowfullscreen></iframe>				
			
				<div id="appendSeller">
						    
				</div>			
			</div>	
			</div>
			
		</div>	
<!-- 					�Ǹ�������������� -->
					<div class="modal fade" id="sellerInfoModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">		
					    <div class="modal-body">
					    <h4 class="text-center"><i class="fas fa-portrait"></i> �Ǹ�������</h4><br/>			     
					      <div id="sellerInfoModalBody">		      	      
					      </div>
					    </div>  
					    </div>
					  </div>
					</div>
					
<!-- 					�����ڰ��̵��� -->
					<div class="modal fade" id="adminGuideModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">		
					    <div class="modal-body">
					    <h4 class="text-center"><i class="fas fa-user-cog"></i> <strong>������ ���̵�</strong></h4><br/><br/>	
					    
					    <p><strong><i class="fas fa-cog"></i> ��ü �ŷ����� �޴����� �������� �ŷ��� Ȯ���� �� �ֽ��ϴ�.</strong><br/><br/></p>
					    <p><strong><i class="fas fa-cog"></i> Ƽ��  Check �޴����� Ƽ��/�Ǹ��������� Ȯ�� �� �������ּ���.</strong><br/><br/></p>
					    <p><strong><i class="fas fa-cog"></i> �������Ա�Ȯ�� �޴����� ȸ����·� �Ա�Ȯ�� �� ó�����ּ���.</strong><br/><br/></p>
					    <p><strong><i class="fas fa-cog"></i> �Ǹ����Ա� �޴����� �Ǹ��� ��ϰ��·� �Ա��� �� �ֽ��ϴ�.</strong><br/><br/></p>
					    </div>
					    </div>  
					    </div>
					  </div>
					</div>

<jsp:include page="/layout/footer.jsp" />

<script src="/resources/javascript/cbpFWTabs.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
			(function() {

				[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
					new CBPFWTabs( el );
				});

			})();
</script>
<script>

function ticketModalClick(){
	$("a[name='check']").on("click", function(){	          			
		var ticketNo= $(this).attr('id').trim();
		var content = $(this).closest('.col-sm-4');
		$.ajax({
			url : "/ticket/rest/checkTicket/"+ticketNo+"/" ,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
          	success: function(data){
          		
          		swal(data.message,"","success")
          		.then(function(r){
          			content.remove();         			
          		});
          		
          	}
		});
	});
}
function getSellerInfo(){
	$("a[name='sellerInfo']").on("click",function(){
		var sellerId = $(this).text().trim();
		$.ajax({
			url : "/user/json/getUser/"+sellerId+"/" ,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
          	success: function(data){
          		var display = "";
          		display += "<div class='text-center'><p>ID <i class='fas fa-check'></i> <small>"+data.userId+"</small></p>";
          		display += "<p>��ȭ��ȣ <i class='fas fa-check'></i> <small>"+data.phone+"</small></p>";
          		display += "<p>���¹�ȣ <i class='fas fa-check'></i> <small>"+data.accountNo+"</small></p></div>";
          		$("#sellerInfoModalBody").html(display);
          	}
		});
	});
	
}

	$("button[name='depositCheck']").on("click", function(){
		var tranNo= $(this).attr("id").trim();
		var content= $(this).closest(".col-lg-4");		
		
		$.ajax({
			url : "/tran/rest/checkDeposit/"+tranNo ,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
          	success: function(data){
          		swal(data.message,"","success")
          		.then(function(r){
          			content.remove();	
          		});
          		
          	}
		});		
	});
	
	$("button[name='tranDelete']").on("click", function(){
		
		var tranNo= $(this).attr("id").trim();
		var content= $(this).closest(".col-lg-4");		
		
		$.ajax({
			url : "/tran/rest/deleteTran/"+tranNo ,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
          	success: function(data){
          		swal(data.message,"","success")
          		.then(function(r){
          			content.remove();	
          		});
          	}
		});	
		
	});
	
	$("a:contains('Ƽ�� Check')").on('click', function(){
		$.ajax({
			url : "/ticket/rest/getTicketList/2/0" ,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
          	success: function(data){
          		$("#ticketCheckRow").html("");
          		$.each(data.list, function( index, ticket){
          			var display = "";	
	          		display += '<div class="col-sm-4" style="margin-bottom: 20px;"><br/>';
	          		display += '<div class="card text-center shadow rounded">';
	          		display += '<img class="card-img-top" src="/resources/images/uploadFiles/'+ticket.ticketImage+'" onerror="this.src="'+'"/resources/images/logo.png"'+' height="200px;" >';
	          		display +=	'<div class="card-body"><div class="font-weight-bold">'+ticket.event.eventName+'</div><hr/>'; 
	          		display +=  '<h6><div class="font-weight-bold">�¼� <i class="fas fa-check"></i>&nbsp; '+ticket.seat+'</div></h6>' ;
	          		display +=  '<h6><div class="font-weight-bold">���� <i class="fas fa-check"></i>&nbsp; '+ticket.amount+'</div></h6>';
	          		display +=   '<h6><div class="font-weight-bold">���� <i class="fas fa-check"></i>&nbsp;'+ticket.price+' ��</div></h6><br/>';	
	          		display +=   '<div class="font-weight-bold"><i class="fas fa-portrait"></i> <a href="#" name="sellerInfo" data-target="#sellerInfoModal" data-toggle="modal">'+ticket.seller.userId+'</a></div><br/>';
	          		display +=	'<a class="btn btn-outline-primary" name="check" id="'+ticket.ticketNo+'" href="#" >';
	          		display +=   '<i class="fas fa-search"></i></a><br/><br/></read></div></div></div>';	         			         
          			
	          		$("#ticketCheckRow").append(display);	          		
          		});           		
          		ticketModalClick();
          		getSellerInfo();
          	}
		});
	});
	$("#inputGroupSelect01").on('change', function(){
		var tranCode = $(this).val();
		if(tranCode=="All"){
			$(".col-lg-4").attr("style","");
			return;
		}
		if(tranCode=="0"){
			$(".col-lg-4").attr("style","");
			$("div[name='1']").attr("style","display: none;");
			$("div[name='2']").attr("style","display: none;");
			$("div[name='3']").attr("style","display: none;");
			$("div[name='4']").attr("style","display: none;");
			return;
		}
		if(tranCode=="1"){
			$(".col-lg-4").attr("style","");
			$("div[name='0']").attr("style","display: none;");
			$("div[name='2']").attr("style","display: none;");
			$("div[name='3']").attr("style","display: none;");
			$("div[name='4']").attr("style","display: none;");
			return;
		}
		if(tranCode=="2"){
			$(".col-lg-4").attr("style","");
			$("div[name='0']").attr("style","display: none;");
			$("div[name='1']").attr("style","display: none;");
			$("div[name='3']").attr("style","display: none;");
			$("div[name='4']").attr("style","display: none;");
			return;
		}
		if(tranCode=="3"){
			$(".col-lg-4").attr("style","");
			$("div[name='0']").attr("style","display: none;");
			$("div[name='1']").attr("style","display: none;");
			$("div[name='2']").attr("style","display: none;");
			$("div[name='4']").attr("style","display: none;");
			return;
		}
		if(tranCode=="4"){
			$(".col-lg-4").attr("style","");
			$("div[name='0']").attr("style","display: none;");
			$("div[name='1']").attr("style","display: none;");
			$("div[name='2']").attr("style","display: none;");
			$("div[name='3']").attr("style","display: none;");
			return;
		}
		
	});
	
	IMP.init('imp22741487');
	
	$("button[name='depositSeller']").on("click",function(){
		
		var content = $(this).closest(".col-lg-3");	
		
		IMP.request_pay({
		    pay_method : 'trans',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '�Ǹ���',
		    amount : 150,
		    buyer_email : 'lionhead115@naver.com',
		    buyer_name : '������',
		    buyer_tel : '01073079076',
		    buyer_addr : '����� ���ʵ�',
		    buyer_postcode : '150-582'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '�Ա��� �Ϸ�Ǿ����ϴ�.';			        
		        var tmp = 0;
		    } else {
		        var msg = '�Աݿ� �����Ͽ����ϴ�.';		
		        var tmp = 1;
		    }		
		    swal(msg,"","info");
		    if(tmp==0){
		    	$.ajax({
					url : "/tran/rest/depositSeller/"+tranNo ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
		          	success: function(data){
		          		swal(data.message,"","success")
		          		.then(function(r){
		          			history.go(0);
		          		});
		          	}
				});			    	
		    }
		});
		
	
    });
</script>	
</body>

</html>