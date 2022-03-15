<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>T-GET</title>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
<!-- 	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet"> -->

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		
	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	
	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.scrolly.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<script type="text/javascript">

	var str = "";
	var videoList = [];
	
	$(function(){
		
		$.ajax(
				{
					url : "/event/rest/getPopularEventList",
					method : "POST",
					dataType : "json",
					success : function(JSONData, status){
							recommSize = JSONData.recommEventlistSize;
							$.each(JSONData.eventNameList, function(index,value){
								if(value=="${event.eventName}"){
									$("#title").append("<span class='neon' style='font-weight:bold;font-size:23px'>HOT</span>");									
								}
							});
					}
		});
	
		$(".addTicket").on("click",function(){			
			var eventId = $(this).val(); 			
			if (${empty user}) {
				swal("�α����� ���ּ���.","","warning")
				.then(function(result){
					$("#my80sizeCenterModal").modal('show');
				});
				
			} else {
				$("#eventId").val($(this).val());
				$("form[name='main']").attr("method" , "GET").attr("action" , "/ticket/addTicketInfo").submit();
			}
		});		
		
		$(".getTicketList").on("click",function(){			
			$("#eventId").val($(this).val());
			$("form[name='main']").attr("method" , "POST").attr("action" , "/event/getEventTicketList?eventIds="+$(this).val()).submit();
		});				
		$("#file").change(function(){
	    	readURL(this);
		});
		$("#submit").on("click",function(){	
			var formData = new FormData($("#editEventImage")[0]);			
			$.ajax(
					{
						url : "/event/rest/addEventImage",
						method : "POST",
						data : formData,
						processData: false,
						contentType: false,
						dataType : "json",
						success : function(JSONData,status){
							$("img.main").attr("src","/resources/images/uploadFiles/"+JSONData.eventImage);
							swal("��� ����!","","success")
							.then(function(result){
								$("button.close").click();	
							});							
						},
						error : function(request, status, error ) {   
						 	swal("�߸��� �����Դϴ�.","","error");
						}			
				});		
		})	;
				
		$("#delete").on("click",function(){				
			$.ajax(
					{
						url : "/event/rest/deleteEventImage",
						method : "POST",
						data : {
								eventName : $("#eventName").val()
							},
						dataType : "json",
						success : function(JSONData,status){
							$("img.main").attr("src","/resources/images/uploadFiles/logo.png");
							$("button.close").click();
						},
						error : function(request, status, error ) {   
							swal("�߸��� �����Դϴ�.","","error");
						}							
				});		
		})	;
	});
	
	</script>	
	<style>
		a, hr{
				color: black ;	
			}		
		button.btn-light:hover{
			background-color: gray;
			color: #FBFCFE ;
		}		
		body{
			margin-top: 50px;
			background-color: #EBF7FF;
			color: #041625;
		}	
		div.border{ 
			background-color : white; 
			color:  #041625;
 		}		
		div.border:hover{
			background-color : #EBF7FF; 
		}		
      div.container{
	 		font-size: 20px;    
        }
        .col-lg-6{
        	margin-top: 10px;
        }
      	div.list{
	 		font-size: 20px;
      	}        
       img.main {
         	width: 400px; 			
 	 		hieght: 250px; 

        }
        .img_wrap {
			width: 300px;
			margin: auto;
		}
		.img_wrap img {
			max-width: 100%;
		} 
		.neon {
		  font-family: neon;
		  color: #FB4264;
		  text-shadow: 0 0 3vw #F40A35;
		}		
		.flux {
		  font-family: neon;
		  color: #426DFB;
		  text-shadow: 0 0 3vw #2356FF;
		}		
		.neon {
		  animation: neon 1s ease infinite;
		  -moz-animation: neon 1s ease infinite;
		  -webkit-animation: neon 1s ease infinite;
		}		
		@keyframes neon {
		  0%,
		  50% {
		    text-shadow: 0 0 1vw #FA1C16, 0 0 3vw #FA1C16, 0 0 10vw #FA1C16, 0 0 10vw #FA1C16, 0 0 .4vw #FED128, .5vw .5vw .1vw #806914;
		    color: #FED128;
		  }
		  50% {
		    text-shadow: 0 0 .5vw #800E0B, 0 0 1.5vw #800E0B, 0 0 5vw #800E0B, 0 0 5vw #800E0B, 0 0 .2vw #800E0B, .5vw .5vw .1vw #40340A;
		    color: #806914;
		  }
		}		
		.flux {
		  animation: flux 2s linear infinite;
		  -moz-animation: flux 2s linear infinite;
		  -webkit-animation: flux 2s linear infinite;
		  -o-animation: flux 2s linear infinite;
		}		
		@keyframes flux {
		  0%,
		  100% {
		    text-shadow: 0 0 1vw #1041FF, 0 0 3vw #1041FF, 0 0 10vw #1041FF, 0 0 10vw #1041FF, 0 0 .4vw #8BFDFE, .5vw .5vw .1vw #147280;
		    color: #28D7FE;
		  }
		  50% {
		    text-shadow: 0 0 .5vw #082180, 0 0 1.5vw #082180, 0 0 5vw #082180, 0 0 5vw #082180, 0 0 .2vw #082180, .5vw .5vw .1vw #0A3940;
		    color: #146C80;
		  }
  		}
    </style>
	
</head>

<body>
<jsp:include page="/layout/tgetToolbar.jsp" />
<jsp:include page="/layout/tgetHeader.jsp" />

	<form name="main">
		<div class="container"  align="left" style="margin-top: 50px">
			<div class="row">
				<div class="col-lg-5  col-12" align="center">
					<div class="sticky-top">
						<div class="textcontainer">
							<div id="title" style="color: #041625;"><h1>${event.koName}</h1></div>
						</div>
						<input type="hidden"  id="eventId" name="eventId" />
						<input type="hidden"  id="koName" name="koName"  value="${event.koName}" >
						<input type="hidden"  id="koPerformer" name="koPerformer"  value="${event.koPerformer}" >
						<input type="hidden"  id="eventName" name="eventName"  value="${eventName}" >
						<input type="hidden"  id="category" name="category"  value="${category}" >
						<input type="hidden" id="eventImage" name="eventImage" value="${eventImage}"/>
						<div align="right" style="padding:10px">
							<c:if test="${!empty eventImage}">
								<img class="main" src="/resources/images/uploadFiles/${eventImage}" />
							</c:if>
							<c:if test="${empty eventImage}">
								<img class="main" src="/resources/images/logo.jpg"  style="width:400px; height=250px;"/>
							</c:if>
							<br/>
							<div >
							<br/>
								<div align="right">��ȸ�� : ${viewCount}ȸ<br/></div>							
								<c:if test="${user.role == 2 }">
									<button type="button"  id="editImage" data-toggle="modal"  class="btn btn-outline-dark"		style="margin:10px;"			
									 data-target="#exampleModalCenter">����</button><br/>		
								</c:if>						
							</div>
						</div>	
					</div>
				</div>			
				<div class="col-lg-7  col-sm-12 col-12">					
					<section id="section-topline-1" align="center">
						<div class="row" align="center">
							<c:forEach var="i" items="${eventListByName}" varStatus="j">
								<div class="col-lg-5 col shadow p-3 mb-5 bg-white rounded" style="margin-right: 10px;">
									<div class="text-center">
										<div class="border">
									 		<br/>
									 		<h5><strong>${i.eventDate } <span id="time"> ${i.eventTimeStr}</span></strong></h5>
									 		<hr/>									 		
									 		<div class="event" align="center" style="margin-left:10%;margin-right:10%">		
									 			<div align="left" >
													<ion-icon name="checkmark"></ion-icon><small>�������</small><br/>
													<small>${!empty event.koLocation? event.koLocation: i.koLocation }</small><br/><br/>
													<ion-icon name="checkmark"></ion-icon>
													<small>���� ��ϵ� Ƽ��</small><br/> ${i.totalTicketCount } ��<br/><br/>
													<ion-icon name="checkmark"></ion-icon>
													<small>Ƽ��������</small><br/>${i.ticketLowestPriceStr } ��<br/>	<br/>	<br/>	
													<div class="container" align="center">			
														<button type="button" class="btn btn-outline-primary addTicket"  value="${i.eventId}">�Ǹ�</button>&nbsp;&nbsp;&nbsp;&nbsp;
														<button type="button" class="btn btn-outline-primary getTicketList"  value="${i.eventId}">����</button><br/>
													</div>	
									 			</div>									
											</div>		
									 		<div><small></small></div>
									 		<div><small></small></div>
									 		<br/>
									 	</div>
									 </div>	
								 </div>
							 </c:forEach>
						 </div>
					</section>
				</div>
			</div>		
		</div>
	</form>


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"  
aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content" style="background-color:#D9E5FF; color: #041625;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">�̹��� ����</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <jsp:include page="/event/addEventImageGET.jsp" />
	  </div>
      <div class="modal-footer">       
        <button type="button" class="btn btn-outline-primary"  id="delete" >����</button>
        <button type="button" class="btn btn-outline-primary"  id="submit" >����</button>
         <button type="button" class="btn btn-outline-dark" data-dismiss="modal">�ݱ�</button>
      </div>
    </div>
  </div>
</div>

<jsp:include page="/layout/footer.jsp" />
</body>
</html>