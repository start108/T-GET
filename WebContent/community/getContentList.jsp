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
		.contentName:hover{
			font-size: 15px;
			cursor: pointer;
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
/* 		#gradient{ */
/* 			background: linear-gradient(-45deg, rgba(246, 255, 0, .8), rgba(255, 0, 161, .8)) fixed */

/* 		} */
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
	
		function fncAddReport(){
			
			$("form[name='addReport']").attr("method" , "POST").attr("action" , "/community/addReport").submit();
		}

			$(function() {
				$( "button.btn.btn-info:contains('�Ű��ϱ�')" ).on("click" , function() {
					swal("�Ű� �Ϸ�!","","success")
					.then(function(r){
						fncAddReport();	
					});
					
				});
			});
			
		 $(function() {
			
// 			 $( "button.btn.btn-info:contains('�ֽż�')" ).on("click" , function() {
// 					$("#currentRegDate").val("0");
// 					fncGetUserList("1");
// 				});
			 
 			 $( "button.btn.btn-info:contains('���')" ).on("click" , function() {
 				 
 					//self.location="/community/addContent"	
	 				var contentName= $("input[name='contentName']").val();
					var contentBody= $("textarea[name='contentBody']").val();
					var boardCode = $("#boardCode option:selected").val();
					var contentCode = $("#contentCode option:selected").val();
					
					
					if(boardCode == null || boardCode.length<1){
						swal("�Խ����� ������ �ּ���.","","error");
						return;
					}
					if(contentCode == null || contentCode.length<1){
						swal("�Ӹ����� ������ �ּ���.","","error");
						return;
					}
					
					if(contentName == null || contentName.length<1){
						swal("������ �Է��� �ּ���.","","error");
						return;
					}
					
					swal("��� �Ǿ����ϴ�.","","success")
					.then(function(r){				
						$("form[name='addContent']").attr("enctype","multipart/form-data").attr("method" , "POST").attr("action" , "/community/addContent").submit();
 				
					});
 			 });
			 
			 
			 $( "a[href='#']:contains('Ƽ�� �ŷ� ����')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=0";	
				
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
			 
 			 $( ".reportRing" ).on("click" , function() {
 				 	if('${user}'==''){
 				 		swal("�α����� ���ּ���","","warning");
 				 		return;
 				 	}
 				 	$(this).attr("data-target","#addReportModal");
				 	var contentNo = $(this).attr("id").trim();
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
									$("input[name='contentNo']").val(data.contentNo);
									$("input[name='blackId']").val(data.userId);
									$("#reportContentBody").html(data.contentBody);
									$("#reportBlackId").html(data.userId);
								}
							});
				});
				
			 $( "a[href='#']:contains('ȯ�� �Խ���')" ).on("click" , function() {
					self.location="/community/getRefundList";	
				
				});
			 
				
	 
			// �� ��ȸ
			$( ".contentName").on("click" , function() {
				self.location ="/community/getContent?contentNo="+$(this).attr('id').trim();
				
			});

			$( ".col-md-4" ).css("color" , "black");
			
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
	
	});	
		 
		 $(function() {				
				$(".good").on("click" , function() {
					
					var contentNo = $(this).attr("id").trim();
					var goodCount = $("."+contentNo+"goodCount").text().trim();
					var result = parseInt(goodCount)+1;
					var content = $("."+contentNo+"goodCount");
					$.ajax(
			    		{
			    	
			        method:"GET",
			        url : "/community/rest/updateGoodCount/"+contentNo,
			        dataType: "json",
			        header:{
			        	"Accept" : "application/json",
						"Content-Type" : "application/json"	
			        },
			        success : function(data){
 			        		content.text(result);
 			        		swal("�Խñۿ� �����Ͽ����ϴ�.","","success");
			        }
			        
			    	});
				});
		 });		 
 		  $(function() {
				
				$(".bad").on("click" , function() {
				
					var contentNo = $(this).attr("id").trim();
					var badCount = $("."+contentNo+"badCount").text().trim();
					var result1 = parseInt(badCount)+1;
					var content1 =  $("."+contentNo+"badCount");
					
					$.ajax(
			    		{
			    	
			        method:"GET",
			        url : "/community/rest/updateBadCount/"+contentNo,
			        dataType: "json",
			        header:{
			        	"Accept" : "application/json",
						"Content-Type" : "application/json"	
			        },
			        success : function(data){
			        	
			        	if($.trim(data.result)=="bad"){
			        		content1.text(result1);
			        		swal("�Խñۿ� ������Ͽ����ϴ�.","","success");
			        	} 
			        } 
			        
			    	});
				});
		 });
		
	</script>
	
</head>

<body>
	
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />

	<div class="text-right" style="margin-right: 120px; margin-top: 20px;">  		    	
<!-- 		    	<button type="button" id="currentRegDate" class="btn btn-info">�ֽż�</button> -->
		    	<button type="button" id="addContent" class="btn btn-outline-info" data-toggle="modal" data-target="#addContentModal"><i class="fas fa-pen-alt"></i>  �Խñ� �ۼ�</button>
				
		
	</div>	   

	<br/>	   
	 <div class="row" >
	  <div class="col-md-2 text-center" >	  
	      <div class="sticky-top" ><!--  sticky-top-->
		  <br/>
		  <div class="card text-center shadow-lg rounded" style="width: 15rem; color: #041625;">
			  <div class="card-header">
			 
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='0'}">
		       		<h6><strong>Community > ��������</strong></h6>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='1'}">
		       		<h6><strong>Community > ��������</strong></h6>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='2'}">
		       		<h6><strong>Community > ��������</strong></h6>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'}">
		       		<h6><strong>Community > �����Խ���</strong></h6>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='4'}">
		       		<h6><strong>Community > �����Խ���</strong></h6>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='5'}">
		       		<h6><strong>Community > �����Խ���</strong></h6>
		       </c:if>
		      
		   	 </div>
			<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='0'||search.searchCondition=='2'&&search.searchKeyword=='1'||search.searchCondition=='2'&&search.searchKeyword=='2'}">
				<ul class="list-group list-group-flush">
				<li class="list-group-item" ><a href="#" style=color:#020B13;>Ƽ�� �ŷ� ����</a></li>
				<li class="list-group-item"><a href="/community/getContentList?searchCondition=2&searchKeyword=1" style=color:#020B13;>�����Խ��� �̿����</a></li>
				
				</ul>
			</c:if>
			  
			<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
				<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="#" style=color:#020B13;>��ϴ�</a></li>
				<li class="list-group-item"><a href="#" style=color:#020B13;>�˴ϴ�</a></li>
				<li class="list-group-item"><a href="#" style=color:#020B13;>���ٹ�</a></li>
				</ul>
			</c:if>
			</div>
		</div>
		</div>	
		
      <!--  table Start /////////////////////////////////////-->
 <div class="col-md-10 text-center">
     		
     		<div style="margin-bottom: 10px; height:70px;">
		 <div class="card-body">	
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-3"><p><strong>�� ����</strong>&ensp;<i class="fas fa-align-justify"></i></p></div>		     			        
				<div class="col-md-2"><p><strong>�ۼ���</strong>&ensp;<i class="fas fa-user-edit"></i></p></div>	        
				<div class="col-md-3"><p><strong>�ۼ���</strong>&ensp;<i class="far fa-calendar-alt"></i></p></div>
				<div class="col-md-1"><p><strong>��ȸ��</strong></div>
				<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
				<div class="col-md-2"><p><strong>����/�����</strong></p></div>		
				</c:if>
		    </div>
		</div>        
	</div>	
	
	<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='0'||search.searchCondition=='2'&&search.searchKeyword=='1'}">
		<c:forEach var="content" items="${list}">

	<div class="card text-center shadow rounded-pill" id="${content.contentNo}" style="margin-bottom: 10px; height:65px;">
		 <div class="card-body" style="padding-top:20px;">	
			<div class="row">
				<div class="col-md-1"><span class="badge badge-danger">����</span></div>
				<div class="col-md-3 contentName" id="${content.contentNo}"><p><small>${content.contentName}</small></p></div>	     			        
				<div class="col-md-2"><p>${content.userNickname}</p></div>
				<div id="userId" style="display:none;">${user.userId}</div>	        
				<div class="col-md-3"><p>${content.regDate}</p></div>
				<div class="col-md-1"><p>${content.viewCount }</p></div>
				<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
				<div class="col-md-2">
				</div>		
				</c:if>	
				</div>
				</div>
				</div>
	</c:forEach>	
	</c:if>
	
	<c:if test="${search.searchCondition=='2'&&search.searchKeyword!='0'&&search.searchCondition=='2'&&search.searchKeyword!='1'}">
	<c:forEach var="content" items="${list}">
	<c:if test="${content.contentCode=='1'}">
	<div class="card text-center shadow rounded-pill" style="margin-bottom: 10px; height:65px; background-color:#cddefa;">
		 <div class="card-body" style="padding-top:20px;">	
			<div class="row">
				<div class="col-md-1"><span class="badge badge-danger">����</span></div>
				<div class="col-md-3 contentName" id="${content.contentNo}" ><p><small>${content.contentName}</small></p></div>
				<div id="contentNo" style="display:none;">${content.contentNo}</div>		     			        
				<div class="col-md-2"><p>${content.userNickname}</p></div>
				<div id="userId" style="display:none;">${user.userId}</div>	        
				<div class="col-md-3"><p>${content.regDate}</p></div>
				<div class="col-md-1"><p>${content.viewCount }</p></div>
				<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
				<div class="col-md-2">
				</div>		
				</c:if>	
				</div>
				</div>
				</div>
				</c:if>
	</c:forEach>
	<c:forEach var="content" items="${list}">
	<c:if test="${content.contentCode!='0' && content.contentCode!='1'}">
	<div class="card text-center shadow rounded-pill" id="${content.contentNo}" style="margin-bottom: 10px; height:65px;">
		 <div class="card-body" style="padding-top:20px;">	
			<div class="row">
				<div class="col-md-1">
				<c:if test="${content.contentCode=='3'}">
					<span class="badge badge-info">��ϴ�</span>
				</c:if>
				<c:if test="${content.contentCode=='4'}">
					<span class="badge badge-info">�˴ϴ�</span>
				</c:if>
				<c:if test="${content.contentCode=='5'}">
					<span class="badge badge-info">����</span>
				</c:if>
				</div>
				<div class="col-md-3 contentName" id="${content.contentNo}" ><p>
				<small>${content.contentName}</small></p></div>
				<div id="contentNo" style="display:none;">${content.contentNo}</div>		     			        
				<div class="col-md-2"><p>${content.userNickname}</p></div>
				<div id="userId" style="display:none;">${user.userId}</div>	        
				<div class="col-md-3"><p>${content.regDate}</p></div>
				<div class="col-md-1"><p>${content.viewCount }</p></div>
				<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
				<div class="col-md-2">
				<p>
				<!-- ���� -->
			   	  <a href="#" class="good text-secondary" id="${content.contentNo}"><i class="fas fa-thumbs-up"></i></a>
			   	  <span class="badge badge-light ${content.contentNo}goodCount">${content.goodCount}</span>
			   	  
			   	  <!-- ����� -->
			   	  <a href="#" class="bad text-secondary" id="${content.contentNo}"><i class="fas fa-thumbs-down"></i></a>
			   	  <a class="badge badge-light ${content.contentNo}badCount">${content.badCount}</a> 
			   	  
			   	  <!-- �Ű� �ϱ� -->
			   	<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
				  <a href="#" class="reportRing text-dark" id="${content.contentNo}" data-toggle="modal">&ensp;<i class="fas fa-bullhorn"></i></a>		  
				  </c:if> 
				</p></div>		
				</c:if>			  
		    </div>
		</div>        
	</div>
	</c:if>	
	</c:forEach>
	</c:if>
</div>
 </div>    
	<!-- �Խñ� ��� Modal -->		  
		<form name='addContent'>
		<div class="modal fade" id="addContentModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
	    <div class="modal-content">

			<div class="modal-body" id="addContentModalBody" style="padding:30px;">
			
				<div style="margin-bottom:10px;">
					<select class="btn btn-outline-dark custom-select" id="boardCode" name="boardCode" style="width:200px;">
						<option value="" selected>�Խ��� ����</option>
			    	    <c:if test="${sessionScope.user.role == '2'}">	  
			    		  <option value="0">��������</option>
			    	    </c:if>
			    	 	<c:if test="${search.searchKeyword=='3'||search.searchKeyword=='4'||search.searchKeyword=='5'}">
			    		  <option value="1" selected="selected">�����Խ���</option>
			    		  <option value="2">������</option>
			    		</c:if>
			    		<c:if test="${search.searchKeyword=='6'||search.searchKeyword=='7'}">
			    		<option value="1">�����Խ���</option>
			    		  <option value="2" selected="selected">������</option>
			    		</c:if>
	  				</select>
	  			
		  			<select class="btn btn-outline-dark custom-select" id="contentCode" name="contentCode" style="width:200px;">
						<option value="" selected>�Խñ� ����</option>
			    	  <c:if test="${sessionScope.user.role == '2'}">	  
			    		<option value="0">Ƽ�� �ŷ� ����</option>
			    		<option value="1">�����Խ��� �̿� ����</option>
			    		<option value="2">���ֹ�������</option>
			    	  </c:if>
			    		<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'}">
			    		<option value="3">��ϴ�</option>
			    		</c:if>
			    		<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='4'}">
			    		<option value="4">�˴ϴ�</option>
			    		</c:if>
			    		<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='5'}">
			    		<option value="5">���ٹ�</option>
			    		</c:if>
			    		<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='6'||search.searchCondition=='2'&&search.searchKeyword=='7'}">
			    		<option value="6">1:1 �����ϱ�</option>
			    		<option value="7">ȯ�� �Խ���</option>
			    		</c:if>	
		  			</select>
	  			
		  			<select class="btn btn-outline-dark custom-select" id="open" name="open" style="width:200px;">
			    		<option value="0" selected="selected">����</option>
			    	  	<option value="1">�����</option>
		  			</select>
				</div>
				<hr style="background-color:white"/>

			
			
<!-- 				<div class="form-group"> -->
			    <label for="userNickname" class="col" style="color:#020B13;font-size:17px;"><strong>�ۼ���</strong></label><br/>
			    
			      <input type="text" class="form-control" id="userNickname" name="userNickname" value="${sessionScope.user.nickName}" style=width:200px; readonly>	     
			      <input type="hidden" name="userId" value="${sessionScope.user.userId}"><br/>
			        
			  
<!-- 			  	</div> -->
 		  
			  <div class="form-group">
			  
			    <label for="contentName" class="col-sm-offset-1 col-sm-3 control-label" style="color:#020B13;"><strong>�� ����</strong></label>   
			      <input type="text" class="form-control" id="contentName" name="contentName">
			  </div>
			
		  	<label for="contentBody" class="col-sm-offset-1 col-sm-3 control-label" style="color:#020B13;"><strong>�� ����</strong></label>
	
			<textarea class="form-control" id="contentBody" name="contentBody"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace('contentBody'
					, {height: 200});
			</script>
			<br/>  		
	      
      	
	      <div class="modal-footer">
	        <button type="button" class="btn btn-info">���</button>
	        <button type="button" class="btn btn-warning" data-dismiss="modal">�ݱ�</button>
	      </div>
	      </div>
		</div>	
	  </div>
	</div>			  
	</form>
	
	<!-- �Ű��ϱ� Modal -->
	<div class="modal fade" id="addReportModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content modal-80size">
					  <div class="modal-report">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle"><strong><span style="color:#020B13;">�Ű��ϱ�</span></strong></h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <hr>
					      <div class="modal-body" id="addReportModalBody"> 	    
		  
			    <form name="addReport">
<!-- 			    	<div style='display:table-cell;vertical-align:middle'>�Ű���ID -->
<%-- 			      <input id="whiteId" name="whiteId" value="${sessionScope.user.userId}" readonly></div>  --%>
					
			    	<div class="col" style="color:#020B13;"><strong>�ۼ���</strong> &nbsp;&nbsp;<span id="reportBlackId"></span> </div><br/>
					
					<div class="col" style="color:#020B13;"><strong>����</strong> </div>  <div class="card" style="padding: 10px; margin: 10px;"><div id="reportContentBody"></div></div>
			    
				<br>
				<input type='hidden' name='blackId' value='' />
				<input type='hidden' name='contentNo' value=''/>				
				<input type='hidden' name='whiteId' value='${user.userId}'/>
				<input type='hidden' name='whiteNickname' value='${user.nickName}'/>
				<input type='hidden' name='reportCode' value='0'/>				
				
				
				<span style="color:#020B13;"><strong>�Ű� ������ �������ּ���</strong></span>
				<hr/>
			  	<div class='center'>
				<input type='radio' name='reportReasonCode' value='0' checked="checked"><span style="color:#020B13;">&ensp;�������� ȫ�� �Խù�</span><br>
				<input type='radio' name='reportReasonCode' value='1'><span style="color:#020B13;">&ensp;������ �Ǵ� û�ҳ⿡�� �������� ����</span><br>
				<input type='radio' name='reportReasonCode' value='2' ><span style="color:#020B13;">&ensp;Ư���� ����� ���/�弳</span><br>
				<input type='radio' name='reportReasonCode' value='3' ><span style="color:#020B13;">&ensp;���Ѽ�/���Ȱ ħ�� �� ���۱�ħ�� ��</span><br>
				</div>
				
				</form>		
				   
				<div class="modal-footer">
		        <button type="button" class="btn btn-info" data-dismiss="modal">�Ű��ϱ�</button>
		        <button type="button" class="btn btn-warning" data-dismiss="modal">���</button>
		      </div>
				</div></div>	        
						      </div>
						    </div>
						  </div>


<jsp:include page="/layout/footer.jsp" />
</body>
</html>