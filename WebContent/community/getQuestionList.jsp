<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
		<title>T-GET</title>
		<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	body{	
		      color: #020B13;		  
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
			background-color: white;
		}
		section{
			margin-left: 40px;
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
		<script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
		
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
			
		 $(function() {
			
 			 $( "button.btn.btn-outline-info:contains('���')" ).on("click" , function() {
 					//self.location="/community/addContent"	
	 				var contentName= $("input[name='contentName']").val();
					var contentBody= $("textarea[name='contentBody']").val();
					
					if(contentName == null || contentName.length<1){
						swal("������ �Է��� �ּ���.","","error");
						return;
					}
					
					swal("��� �Ϸ�!","","success")
					.then(function(r){
						$("form[name='addContent']").attr("enctype","multipart/form-data").attr("method" , "POST").attr("action" , "/community/addContent").submit();

					});
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
			 
			 $( "a[href='#']:contains('ȯ�� �Խ���')" ).on("click" , function() {
					self.location="/community/getRefundList";	

				});
			 

			 
			 // �� ��ȸ
			$( "td:nth-child(2)" ).on("click" , function() {
				self.location ="/community/getContent?contentNo="+$(this).children('#contentNo').text().trim();
			});

			$( "td:nth-child(2)" ).css("color" , "black");
			
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
					var goodCount = $("span[name='"+contentNo+"']").text().trim();
					var result = parseInt(goodCount)+1;
					var content = $("span[name='"+contentNo+"']");
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
 			        
			        }
			        
			    	});
				});
		 });
		 
 		  $(function() {
				
				$(".bad").on("click" , function() {
				
					var contentNo = $(this).attr("id").trim();
					var badCount = $('a').closest("#"+contentNo+"").text().trim();
					var result1 = parseInt(badCount)+1;
					var content1 = $('a').closest("#"+contentNo+"");
					
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
			        	} 
			        } 
			        
			    	});
				});
		 		 $( ".contentDetail" ).on("click" , function() {
		 			 
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
										
										$("#contentUserNickname").html(data.userNickname);
										$("#getContentName").html(data.contentName);
										$("#getContentBody").html(data.contentBody);
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
	<c:if test="${sessionScope.user.role == '2'}">
		    	<button type="button" id="addContent" class="btn btn-outline-info" data-toggle="modal" data-target="#addContentModal"><i class="fas fa-pen-alt"></i>  �Խñ� �ۼ�</button>
	</c:if>			
		
	</div>	
	
	
	 <div class="row">
	  <div class="col-md-2 text-center">	  
	      <div class="sticky-top">
		  <br/>
		   <div class="card text-center shadow-lg rounded" style="width: 15rem; color: #041625;">
			  <div class="card-header">
			 <div>
		       		<h6><strong>������  > ���ֹ�������</strong></h6>		          
		   	 </div>
		   	 
			
				<ul class="list-group list-group-flush">				
				<li class="list-group-item" ><a href="#" style=color:#020B13;>���ֹ�������</a></li>
				<li class="list-group-item" ><a href="#" style=color:#020B13;>ȯ�ҰԽ���</a></li>
				</ul>
			</div>
		</div>
		</div></div>		
      <!--  table Start /////////////////////////////////////-->
     <div class="col-md-10 text-center">	
			<section>
				<br/>
				<div class="tabs tabs-style-topline " >
					<nav>
						<ul>
							<li><a href="#section-topline-1 "><h6><strong>ȸ��</strong></h6></a></li>
							<li><a href="#section-topline-2"><h6><strong>�Ǹ�/����</strong></h6></a></li>
							<li><a href="#section-topline-3"><h6><strong>���/ȯ��</strong></h6></a></li>
							<li><a href="#section-topline-4"><h6><strong>�̺�Ʈ/����</strong></h6></a></li>
						</ul>
					</nav>
					<div class="content-wrap">
						<section id="section-topline-1" >
						<div class="row">
								 <c:forEach var="content" items="${list}" varStatus="j">
								 <c:if test="${content.contentCode=='8'}">
								 	<div class="col-lg-3 " >
								 		<div class="card shadow rounded" style="height: 300px;">
								 		<div class="card-body">
								 		<span class="badge badge-secondary"><i class="fab fa-quora"></i> ${j.index+1}</span>
								 		<br/><br/>
								 			<h5><strong>${content.contentName}</strong></h5>
								 				<br/>
								 				<small>${content.regDate}</small>
								 				<br/><br/>
								 				<a href="#" class="btn btn-outline-success contentDetail" id="${content.contentNo}" data-toggle="modal" data-target="#contentDetailModal" ><i class="fas fa-search-plus"></i> �亯 ����</a>
								 			<hr/>
								 			
								 		</div>
								 		</div>
								 	</div>
								 </c:if>	
								 </c:forEach>
						</div>
						</section>
						
						<section id="section-topline-2">
						<div class="row">
								 <c:forEach var="content" items="${list}" varStatus="j">
								 <c:if test="${content.contentCode=='9'}">
								 	<div class="col-lg-3">
								 	<div class="text-center">
								 		<div class="card shadow rounded" style="height: 300px;">
								 		<div class="card-body">
								 		<span class="badge badge-secondary"><i class="fab fa-quora"></i> ${j.index+1}</span>
								 		<br/><br/>
								 			<h5><strong>${content.contentName}</strong></h5>
								 				<br/>
								 				<small>${content.regDate}</small>
								 				<br/><br/>
<a href="#" class="btn btn-outline-success contentDetail" id="${content.contentNo}" data-toggle="modal" data-target="#contentDetailModal" ><i class="fas fa-search-plus"></i> �亯 ����</a>								 			<hr/>
								 			
								 			<br/>
								 		</div>
								 	</div>
								 	</div>	
								 	</div>
								 </c:if>	
								 </c:forEach>
						</div>			
						</section>
						<section id="section-topline-3">
						<div class="row">
								 <c:forEach var="content" items="${list}" varStatus="j">
								 <c:if test="${content.contentCode=='10'}">
								 	<div class="col-lg-3">
								 	<div class="text-center">
								 		<div class="card shadow rounded" style="height: 300px;">
								 		<div class="card-body">
								 		<span class="badge badge-secondary"><i class="fab fa-quora"></i> ${j.index+1}</span>
								 		<br/><br/>
								 			<h5><strong>${content.contentName}</strong></h5>
								 				<br/>
								 				<small>${content.regDate}</small>
								 				<br/><br/>
<a href="#" class="btn btn-outline-success contentDetail" id="${content.contentNo}" data-toggle="modal" data-target="#contentDetailModal" ><i class="fas fa-search-plus"></i> �亯 ����</a>								 			<hr/>
								 			
								 			<br/>
								 		</div>
								 	</div>
								 	</div>	
								 	</div>
								 </c:if>	
								 </c:forEach>
						</div>	
						</section>
						<section id="section-topline-4">
						<div class="row">
								 <c:forEach var="content" items="${list}" varStatus="j">
								 <c:if test="${content.contentCode=='11'}">
								 	<div class="col-lg-3">
								 	<div class="text-center">
								 		<div class="card shadow rounded" style="height: 300px;">
								 		<div class="card-body">
								 		<span class="badge badge-secondary"><i class="fab fa-quora"></i> ${j.index+1}</span>
								 		<br/><br/>
								 			<h5><strong>${content.contentName}</strong></h5>
								 				<br/>
								 				<small>${content.regDate}</small>
								 				<br/><br/>
<a href="#" class="btn btn-outline-success contentDetail" id="${content.contentNo}" data-toggle="modal" data-target="#contentDetailModal" ><i class="fas fa-search-plus"></i> �亯 ����</a>								 			<hr/>
								 			
								 			<br/>
								 		</div>
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
	  <!--  table End /////////////////////////////////////-->
	</div>  
 	<!--  ȭ�鱸�� div End /////////////////////////////////////--> 
	<!-- �Խñ� ��� Modal -->		  
	<form name='addContent'>
		<div class="modal modal-center fade" id="addContentModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	  <div class="modal-dialog modal-lg modal-center" role="document">
	    <div class="modal-content modal-80size">

	      <div class="modal-body" id="addContentModalBody">
	      
	      <div style="margin-bottom:10px;">
					<select class="btn custom-select" id="boardCode" name="boardCode" style="width:200px;">
						<option selected>�Խ��� ����</option>
			    	   	  <option value="2">������</option>	    
	  				</select>

		   			<select class="btn custom-select" id="contentCode" name="contentCode" style="width:200px;">
							<option selected>�Խñ� ����</option>
					    	   <option value="8">ȸ��</option>
					    	   <option value="9">�Ǹ�/����</option>
					    	   <option value="10">���/ȯ��</option>
					    	   <option value="11">�̺�Ʈ/����</option>
			  		</select>
			  		
			  		<select class="btn custom-select" id="open" name="open" style="width:200px;">
							<option selected>���� ����</option>
					    	   <option value="0">����</option>
					    	   <option value="1">�����</option>
			  		</select> 
			  		</div>	 	
			  		<hr style="background-color:white"/>
			
<!-- 			<div class="form-group"> -->
<!-- 		    <label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">�ۼ���</label> -->
<!-- 		    <div class="col-sm-4"> -->
<%-- 		      <input type="text" class="form-control" id="userNickname" name="userNickname" value="${sessionScope.user.nickName}" readonly> --%>
<%-- 		      <input type="hidden" name="userId" value="${sessionScope.user.userId}"> --%>
<!-- 		    </div> -->
<!-- 		  </div> -->

			<label for="userNickname" class="col" style="color:#020B13;font-size:17px;"><strong>�ۼ���</strong></label><br/> 
				 <input type="text" class="form-control" id="userNickname" name="userNickname" value="${sessionScope.user.nickName}" style=width:200px; readonly>	     
				 <input type="hidden" name="userId" value="${sessionScope.user.userId}"><br/>
 
		  <div class="form-group">
		    <label for="contentName" class="col-sm-offset-1 col-sm-3 control-label"><strong>�� ����</strong></label> 
		      	  <input type="text" class="form-control" id="contentName" name="contentName">
		  </div>
		
		  <label for="contentBody" class="col-sm-offset-1 col-sm-3 control-label"><strong>�� ����</strong></label>
	
		<textarea class="form-control" id="contentBody" name="contentBody"></textarea>
		<script type="text/javascript">
		CKEDITOR.replace('contentBody'
				, {height: 200});
		</script>
		<br/>  		
	    
      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-info" data-dismiss="modal">���</button>
	        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">�ݱ�</button>
	      </div>
	    </div>
	  </div>
	</div>
	</div>			  
	</form>

<!-- �󼼺��� Modal -->
	<div class="modal fade" id="contentDetailModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content modal-80size">
					  <div class="modal-report">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle"><strong><span style="color:#020B13;">���� ���� ���� </span></strong></h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body" id="getContentModalBody"> 	    
		  
<!-- 			    	<div style='display:table-cell;vertical-align:middle'>�Ű���ID -->
<%-- 			      <input id="whiteId" name="whiteId" value="${sessionScope.user.userId}" readonly></div>  --%>
					
			    	<div class="col"><strong>�亯 �ۼ��� </strong> &nbsp;&nbsp;<span id="contentUserNickname"></span></div>
					<br/>
					<div class="col"><strong>���� </strong> <br/><br/> <span id="getContentName"></span></div>
					<br/>
					<div class="col"><strong>�亯 </strong> <br/><br/> <div class='card'><div class='card-body' id="getContentBody"></div></div>
					<br/>
					
			    
				<br>
				   
				<div class="text-center">
		        <button type="button" class="btn btn-outline-info" data-dismiss="modal">Ȯ��</button>
		        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">���</button>
		      </div>
				</div></div>	        
						      </div>
						    </div>
						  </div>
	</div>
		<script src="/resources/javascript/cbpFWTabs.js"></script>
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<script>
					(function() {
		
						[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
							new CBPFWTabs( el );
						});
		
					})();
		</script>	
	
</body>
<jsp:include page="/layout/footer.jsp" />
</html>