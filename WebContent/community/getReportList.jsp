<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">

		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    	<meta name="description" content="Tab Styles Inspiration: A small collection of styles for tabs" />
		<meta name="keywords" content="tabs, inspiration, web design, css, modern, effects, svg" />
		<meta name="author" content="Codrops" />
    	<title>T-GET</title>

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/toolbar.css" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="/resources/css/tabs.css" />
		<link rel="stylesheet" type="text/css" href="/resources/css/tabstyles.css" />
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
		
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
		<script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
		<script src="/resources/javascript/modernizr.custom.js"></script>
	
	<style>
	body{	
		      color: #020B13 ;		  
			  background-color: #EBF7FF;
			  margin-top: 50px;				
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a, hr{
			color: black;	
		}
		
		table{
			color: #020B13;
 			border: 1px solid #88e3f7;		   
 			background-color: #EBF7FF;
		}
		td, th{
			border: 1px solid #88e3f7;
			color: #EBF7FF ;
		}
		.col-md-2{
			padding-left: 50px;
			color: #020B13 ;
		}	
		.col-lg-3{			
			margin-bottom: 20px;
		}
		.col-md-10{
			padding-left: 100px;
			padding-right: 100px;
		}
		.row.in{
			margin-left:50px;
			margin-right: 50px;
		}
		.border{
			padding-top: 20px;
			background-color: #193147;
		}
		section{
			margin-left: 40px;
		}
		#inputGroupSelect01, nav{
			background: rgba(4, 22, 37, 0.75);
			color: #c0c5c9;
		}
		#cyberWidget{
       		background-color: white;
       }  
       
		
		
	/* 	�Խñ� ��� Modal */
		.modal-dialog.modal-80size {
		  color: #020B13;
		  width: 300%;
		  height: 100%;
		  margin: 0;
		  padding: 0;
		}
		
		.modal-content.modal-80size {
		  color: #020B13;
		  background-color: #D9E5FF;
		  height: auto;  
		  min-height: 150%;
		  border-radius: 0;
		}
		
		.modal.modal-center {
		  text-align: center;
		}
		
		@media screen and (min-width: 768px) {
		  .modal.modal-center:before {
		    display: inline-block;
		    vertical-align: middle;
		    content: " ";
		    height: 100%;
		   
		  }
		}
		
		.modal-dialog.modal-center {
		  display: inline-block;
		  text-align: left;
		  vertical-align: middle;
		}
		
	
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		
	
		 $(function() {
			
			

						
			 $( "button.btn.btn-primary:contains('���� Ȯ��')" ).on("click" , function() {
					self.location = "/community/addBlack?reportNo="+$('input[name="reportNo2"]').val();	
			 });
			 
			$( "td:nth-child(2)" ).css("color" , "black");
			$("h7").css("color" , "red");
			
			$(".ct_list_pop:nth-child(n)").on("mouseenter", function(){
				$(this).css({
					"background-color":"#808080",
					"font-weight":"bolder"
				});
			})
			.on("mouseleave", function(){
				var style = {
						backgroundColor: "",//#ddd
						fontWeight:""
				};
				$(this).css(style);
			});
			
			$( "a[href='#']:contains('Ƽ�� �ŷ� ����')" ).on("click" , function() {
				self.location="/community/getContentList?searchCondition=2&searchKeyword=0";	
			
			});
		 
		 $( "a[href='#']:contains('�����Խ��� �̿� ����')" ).on("click" , function() {
				self.location="/community/getContentList?searchCondition=2&searchKeyword=1";	
			
			});
		 
		 $( "a[href='#']:contains('���ֹ�������')" ).on("click" , function() {
				self.location="/community/getContentList?searchCondition=2&searchKeyword=2";	
			
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
	
	});	
		 
		 $(function() {
			 
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$(".check").on("click" , function() {
						
						var reportNo = $(this).children('input[type="hidden"]').val();
						var contentNo = $(this).closest('div').attr('id').trim();

						$('input[name="reportNo2"]').val(reportNo);
						
						$.ajax( 
								
								{
									url : "/community/rest/getContent/"+contentNo ,
									method : "GET" ,
									dataType : "json" ,
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(data) {
										
										$("#reportBlackId").html(data.userId);
										$("#reportContentBody").html(data.contentBody);										
										$(".modal-body").html(displayValue);
									}
							});
				});		
			});	
	
	</script>
	
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />
	<!-- ToolBar Start /////////////////////////////////////-->

		<div class="text-right" style="margin-right: 85px; margin-top: 20px;">      	
		    	<p class="text-dark" ><strong>��ü  ${totalCount } �Ǽ�</strong></p>
	</div>	 
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	  	<br/>	   
	 <div class="row" >
	  <div class="col-md-2 text-center" >	  
	      <div class="sticky-top" ><!--  sticky-top-->
		  <br/>
			 <div class="card text-center shadow-lg rounded" style="width: 15rem; color: #041625;">
						  <div class="card-header">
						 <div>
		       		<h6><strong>Admin Menu > �Ű� ����Ʈ ���� </strong></h6>

			   	 </div>
			</div>
		</div>
		<br/>
		</div></div>	
	
	  <!--  table Start /////////////////////////////////////-->
      <div class="col-md-10 text-center">
      
      <div class="card text-center shadow rounded" style="margin-bottom: 10px; height:70px;">
		 <div class="card-body">	
			<div class="row">
    			<div class="col-md-3"><p><strong>�Ű���</strong>&ensp;<i class="fas fa-user-edit"></i></p></div>	        
				<div class="col-md-5"><p><strong>�Ű� ����</strong>&ensp;<i class="fas fa-align-justify"></i></div>
				<div class="col-md-2"><p><strong>�Ű� ����</strong>&ensp;<i class="far fa-calendar-alt"></i></p></div>
				<div class="col-md-2"><p><strong>���� ����</strong>&ensp;<i class="fas fa-user-check"></i></p></div>		
		    </div>
		</div>        
	</div>	
	
 	<form name="reportCheck">
			<input type="hidden" name="reportNo" value=""/>
	</form>
		  <c:set var="i" value="0" />
		<c:forEach var="report" items="${list}">
		<div class="card text-center shadow rounded-pill" style="margin-bottom: 10px; height:40px;">
		 <div class="card-body" style="padding-top:10px;">	
			<div class="row">
					     			        
				<div class="col-md-3"><p>${report.whiteId}</p></div>        
				<div class="col-md-5">
				<c:if test="${report.reportReasonCode==0}">
			     �������� ȫ�� �Խù�
			  </c:if>
			  <c:if test="${report.reportReasonCode==1}">
			     ������ �Ǵ� û�ҳ⿡�� �������� ����
			  </c:if>
			  <c:if test="${report.reportReasonCode==2}">
			     Ư���� ����� ���/�弳
			  </c:if>
			  <c:if test="${report.reportReasonCode==3}">
			     ���Ѽ�/���Ȱ ħ�� �� ���۱�ħ�� ��
			  </c:if>
				</div>
				<div class="col-md-2"><p>${report.regDate }</p></div>
 				 <div id="${report.contentNo}" class="col-md-2"><p>
 			  <a href="#" class="check" id="contentModalButton" data-toggle="modal" data-target="#contentModal"><i class="far fa-check-circle" style=color:#020B13;font-size:20px;></i>
			  <input type="hidden" name="reportNo1" value="${report.reportNo}"/>
			  </a>
			  
			  </div>		  
		    </div>
		</div>        
	</div>	
	</c:forEach>
</div>
 </div>  
 	
	<div class="modal fade" id="contentModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle" style=color:#020B13;><strong>�Ű� ���� ����</strong></h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body" >
					      <div class="col" style=color:#020B13;><strong>�ۼ��� &nbsp;&nbsp;&nbsp;</strong>  <span id="reportBlackId"></span></div>
						<hr/>
						  <div class="col" style=color:#020B13;><strong>����</strong><br/> <br/>  <div class="card"><div id="reportContentBody" style="padding: 10px;"></div></div></div>
					    
						<br>
						
						<input type='hidden' name='reportNo2' value=''/>
						  </div>
						  
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">���</button>
					        <button type="button" class="btn btn-primary">���� Ȯ��</button>
					      </div>
					    </div>
					  </div>
	</div>
</body>
<jsp:include page="/layout/footer.jsp" />
</html>