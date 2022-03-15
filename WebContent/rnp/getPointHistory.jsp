<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>T-GET</title>
	<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Acme|Bungee+Shade|Fredericka+the+Great&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<link rel="stylesheet" href="/resources/css/yr.css" />
	<link rel="shortcut icon" href="/resources/images/logo.png">
	<link rel="icon" href="/resources/images/logo.png">		  	
    
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
    <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
    <script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/jquery.scrolly.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<script src="/resources/javascript/yr.js" ></script>
    <script type="text/javascript">
	
	$(function(){
		$("button.close").on("click",function(){
			$("#reviewTranEventName").text("");
			$("#reviewTranPrice").text("");
			$("#reviewTranAmount").text("");
			$("#reviewTranTotalPrice").text("");
			$("#reviewTranOrderDate").text("");
		});
		
		$("div.record").on("click",function(){
    		$.ajax(
					{
						url : "/rnp/rest/getTran",
						method : "POST",
						data : {
										tranNo : $(this).children("input[type='hidden']").val()
									},
						dataType : "json",
						success : function(JSONData, status){
							$("#reviewTranNo").val(JSONData.transaction.tranNo);
							$("#reviewTranEventName").text(JSONData.transaction.event.koName);
							$("#reviewTranPrice").text(numberWithCommas(JSONData.transaction.ticket.price)+"��");
							$("#reviewTranAmount").text(JSONData.transaction.orderAmount);
							$("#reviewTranTotalPrice").text(numberWithCommas(JSONData.transaction.totalPrice)+"��");
							$("#reviewTranOrderDate").text(JSONData.transaction.orderDate);
						},
						error : function(request, status, error ) {   
						 	swal("�߸��� �����Դϴ�.","","error");
						}			
				});	
    	});
	});
	
	</script>
	<style type="text/css">
		body{
			background-color: #EBF7FF;
			color: #041625;	
		}
		.container-fluid,td,th{ 
	 		font-size: 20px;
	 		color: #041625;
	 	}
		a, hr,th,td{
				color: #041625;
		}	
	</style>
</head>

<body>
<jsp:include page="/layout/tgetToolbar.jsp" />
<jsp:include page="/layout/tgetHeader.jsp" />
<form>
	<div class="container-fluid" align="center">
		<div class="row" >
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<input type="hidden"  id="userId" name="userId"  value="${user.userId}" >
				<h1><span style="font-weight:bold;font-size:30px ;color: #041625;">${user.nickName}</span><small style="color: #041625;">���� </small>
					<span class="textcontainer" style="font-weight: bold; color: #041625; ">
						<span class="particletext bubbles">����Ʈ ����<span class="particle" style="top:29%; left:82%;width:5.2px; height:5.2px;animation-delay: 3s;"></span><span class="particle" style="top:67%; left:53%;width:4.8px; height:4.8px;animation-delay: 1.8s;"></span><span class="particle" style="top:65%; left:90%;width:5.5px; height:5.5px;animation-delay: 1.2s;"></span><span class="particle" style="top:56%; left:64%;width:7.2px; height:7.2px;animation-delay: 2.5s;"></span><span class="particle" style="top:80%; left:77%;width:7.1px; height:7.1px;animation-delay: 2.2s;"></span><span class="particle" style="top:31%; left:58%;width:5.4px; height:5.4px;animation-delay: 0.5s;"></span><span class="particle" style="top:28%; left:95%;width:6.1px; height:6.1px;animation-delay: 2.7s;"></span><span class="particle" style="top:57%; left:58%;width:7.9px; height:7.9px;animation-delay: 2.3s;"></span><span class="particle" style="top:72%; left:61%;width:7.6px; height:7.6px;animation-delay: 0s;"></span><span class="particle" style="top:49%; left:51%;width:4.9px; height:4.9px;animation-delay: 1.9s;"></span><span class="particle" style="top:42%; left:43%;width:7.4px; height:7.4px;animation-delay: 1.1s;"></span><span class="particle" style="top:69%; left:39%;width:4.7px; height:4.7px;animation-delay: 1.8s;"></span><span class="particle" style="top:61%; left:92%;width:7.2px; height:7.2px;animation-delay: 0s;"></span><span class="particle" style="top:28%; left:16%;width:4.9px; height:4.9px;animation-delay: 2.1s;"></span><span class="particle" style="top:69%; left:24%;width:5.4px; height:5.4px;animation-delay: 0.4s;"></span><span class="particle" style="top:51%; left:59%;width:6.5px; height:6.5px;animation-delay: 1.2s;"></span><span class="particle" style="top:74%; left:67%;width:7.4px; height:7.4px;animation-delay: 2.5s;"></span><span class="particle" style="top:63%; left:16%;width:6.8px; height:6.8px;animation-delay: 1.3s;"></span><span class="particle" style="top:31%; left:29%;width:5.9px; height:5.9px;animation-delay: 2.1s;"></span><span class="particle" style="top:23%; left:42%;width:4.5px; height:4.5px;animation-delay: 1.3s;"></span><span class="particle" style="top:71%; left:76%;width:5.7px; height:5.7px;animation-delay: 1.5s;"></span><span class="particle" style="top:76%; left:79%;width:5.7px; height:5.7px;animation-delay: 0.5s;"></span><span class="particle" style="top:71%; left:1%;width:5.3px; height:5.3px;animation-delay: 1.8s;"></span><span class="particle" style="top:77%; left:11%;width:7.7px; height:7.7px;animation-delay: 2.1s;"></span><span class="particle" style="top:68%; left:34%;width:4px; height:4px;animation-delay: 2.3s;"></span><span class="particle" style="top:49%; left:78%;width:6.6px; height:6.6px;animation-delay: 2.8s;"></span><span class="particle" style="top:37%; left:41%;width:5.1px; height:5.1px;animation-delay: 2.3s;"></span><span class="particle" style="top:57%; left:75%;width:4.9px; height:4.9px;animation-delay: 2.4s;"></span><span class="particle" style="top:62%; left:58%;width:7.9px; height:7.9px;animation-delay: 0.6s;"></span><span class="particle" style="top:25%; left:6%;width:5.3px; height:5.3px;animation-delay: 2.8s;"></span><span class="particle" style="top:71%; left:52%;width:5.6px; height:5.6px;animation-delay: 2.8s;"></span><span class="particle" style="top:71%; left:22%;width:7.9px; height:7.9px;animation-delay: 0.1s;"></span><span class="particle" style="top:30%; left:59%;width:6.2px; height:6.2px;animation-delay: 0.7s;"></span><span class="particle" style="top:60%; left:90%;width:6px; height:6px;animation-delay: 0.1s;"></span><span class="particle" style="top:45%; left:79%;width:6.2px; height:6.2px;animation-delay: 0.1s;"></span></span> 
					</span>
				</h1>
			</div><br/><br/><br/><br/>
			<div class="col-lg-3"></div>
		</div>

		<div class="row" >
			<div class="col-lg-2"></div>
			<div class="col-lg-8" align="center">
			<div class="row">
				<div class="col-md-4" ><strong style="color: #041625;"><p>���� �� �����</p></strong></div>  
				<div class="col-md-4" ><strong style="color: #041625;"><p>���� �� ��� ����</p></strong></div>  
				<div class="col-md-4" ><strong style="color: #041625;"><p>����Ʈ �� �հ�</p></strong></div>    		
			</div>
			<c:forEach items="${pointHistoryList}"  var="i">				  
				<div class="card text-center shadow rounded-pill" style="margin-bottom: 10px; height:55px;">
					<div class="card-body" style="padding-top:10px;" >	
						<div class="row record" data-toggle="modal"  data-target="#tranModal">
						<input type="hidden"  value="${i.tranNo }"/>
							<div class="col-md-4" ><p>${i.regDate}</p></div>    			        
							<div class="col-md-4"><p>
								<c:if test="${i.pointUpdateCode == 0}">+</c:if>
								<c:if test="${i.pointUpdateCode == 1}">-</c:if>
								${i.updatePointStr} point
							</p></div> 
							<div class="col-md-4"><p>${i.totalPointStr} point</p></div>		
						</div>
					</div>
				</div>
			 </c:forEach>
			</div>
			<div class="col-lg-2">		
			</div>
		</div>	
	</div>
</form>


<div class="modal fade" id="tranModal" tabindex="-1" role="dialog"  
aria-labelledby="tranModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content" style="font-size: 20px">
      <div class="modal-header">
        <div class="modal-title" id="tranModalTitle"  style="padding:0px;font-weight: bold;">�ŷ� ��ȸ</div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div style="margin-left:30px;margin-right:30px; ">
        	<ion-icon name="checkmark"></ion-icon>�̺�Ʈ�� : 			
        	<span class=""  id="reviewTranEventName"></span><br/><br/>
			
			<ion-icon name="checkmark"></ion-icon>���� :         	
			<span class=""  id="reviewTranPrice"></span><br/><br/>
        	
			<ion-icon name="checkmark"></ion-icon>���� : 			
			<span class=""  id="reviewTranAmount"></span><br/><br/>
			
			<ion-icon name="checkmark"></ion-icon>�ǰ����� : 
			<span class=""  id="reviewTranTotalPrice"></span><br/><br/>
			
			<ion-icon name="checkmark"></ion-icon>�������� : 
			<span class=""  id="reviewTranOrderDate"></span>
        </div>
      </div>
      <div class="modal-footer">       
         <button type="button" class="btn btn-outline-dark" data-dismiss="modal" >�ݱ�</button>
      </div>
    </div>
    </div>
</div>



<jsp:include page="/layout/footer.jsp" />
</body>
</html>