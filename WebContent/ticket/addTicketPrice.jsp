<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
				   
	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/jquery.scrolly.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
    
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
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">	
		
		
	function fncAddTicketPrice(){
		//Form ��ȿ�� ����
	 	var price = $("input[name='price']").val();
	 	var result = numberWithOutCommas(price);
	 	
		if(result == null || result.length<4){
			swal("������ 1,000�� �̻����� �ݵ�� �Է��Ͽ��� �մϴ�.","","error");
			return false;
		}
		if(isNaN(result)==true) {
			swal("���ݿ� �����Է� �ٶ��ϴ�. �Է� �� :"+result,"","error");
			return false;
		}
		
		$.ajax(
				{
					url : "/ticket/rest/addTicketPrice/"+result ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(data) {
						swal("���ݵ�� ����","","success")
						.then(function(r){
							
						});
					}
				});
		return true;
	}	
	
	
	$(function(){
	    
		var lowPrice = numberWithCommas(${sellProb.lowPrice});
		$("#lowPrice").html(""+lowPrice);
		
		var highPrice = numberWithCommas(${sellProb.highPrice});
		$("#highPrice").html(""+highPrice);
		
		var avgPrice = numberWithCommas(${sellProb.avgPrice});
		$("#avgPrice").html(""+avgPrice);
		
	    $("button:contains('�� ��')").on("click",function(){
	    	$(this).attr("data-target","");
	    	if(fncAddTicketPrice()){
	    		$(this).attr("data-target","#addImageModal");
	    	}
	    });
		
		$("a[href='#']:contains('��&nbsp;��')").on("click",function(){
	    	
	    	self.location = "/";
	    	
	    });
	    
	    $("input[name='price']").on("keyup", function(){
	    	
	    	var price = numberWithOutCommas($(this).val());
	    	
	    	if(price.length>9){
	    		$(this).val("999,999,999");
	    		return;
	    	}
	    	
	    	if(price == "" || isNaN(price)==true || price.length<4){
	    		$("#sellProb").html("");
	    		return;
	    	}else{
	    		var num = numberWithCommas(price);
	    		$(this).val(num);
	    	}	    	
	    	$.ajax(
					{
						url : "/ticket/rest/getTicketSellProb/"+price+"/${ticket.event.eventId}" ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(data) {	
							var sellProb = data.sellprob;
							if(sellProb == 0){
								$("#sellProb").html('<div class="alert alert-primary" role="alert">������ �����Դϴ�. �ش� ������ Ƽ���� �Ǹ� Ȯ���� �� �����ϴ�.</div>');
							}else if(sellProb == 1){
								$("#sellProb").html("<div class='alert alert-success' role='alert'>�ش� ������ Ƽ���� �Ǹ� Ȯ���� �����ϴ�.</div>");
							}else if(sellProb == 2){
								$("#sellProb").html("<div class='alert alert-warning' role='alert'>�ش� ������ Ƽ���� �Ǹ� Ȯ���� �ſ� �����ϴ�.</div>");
							}else{
								$("#sellProb").html("<div class='alert alert-danger' role='alert'>�����ϼ���! �ش� ������ Ƽ���� �Ǹ� Ȯ���� ����մϴ�.</div>");
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
	<br/>
	<div class="row">
		<div class="col-lg-3">
		<div class="sticky-top">
		<br/><br/><br/><br/>
			<div class="card text-center shadow-lg rounded" style="width: 15rem; color: #041625; margin-left: 100px;">
			  <div class="card-header">
			   <strong>Ƽ��  <i class="fas fa-ticket-alt"></i> �ǸŰ��� ����</strong>
			  </div>
			  <ul class="list-group list-group-flush">								
				<li class="list-group-item"><a href="#" data-target="#sellerGuideModal" data-toggle="modal">�Ǹ��� ���̵�</a></li>
				<li class="list-group-item"><a href="#">�ǸŸ�� ��ȸ</a></li>
				<li class="list-group-item"><a href="#">�ŷ����� ��ȸ</a></li>
			  </ul>		  
			</div>
		
		  </div>
		</div>
		<div id="ticketInput" class="col-lg-7">	
		<div class="text-center">
		<div class="card text-center shadow rounded" style="width: 800px; ">
		<br/>
		<h1 class="text-center">${ticket.event.eventName}</h1>
		<hr/>		
		<div class="text-center">				  
		<br/>
			<div class="form-group row">	
			  <div class="col-sm-3"></div>	    
			    <label for="price" class="col-sm-2 col-form-label"><strong>��� ���� </strong></label>			    
			    <div class="col-sm-3">
			         <input type="text" class="form-control" id="price" name="price" style="width: 200px !important" >
			    </div>
			    <div class="col-sm-4"></div>			    		    
			  </div>
		  <div class="form-group row">	
			  <div class="col-sm-3"></div>	    
			    <label for="price" class="col-sm-2 col-form-label"><strong>��� ������ </strong></label>			    
			    <div class="col-sm-3" style="padding-top: 7px;">
			         <strong><span id="lowPrice"></span> ��</strong>
			    </div>
			    <div class="col-sm-4"></div>			    		    
		   </div>
		    <div class="form-group row">	
			  <div class="col-sm-3"></div>	    
			    <label for="price" class="col-sm-2 col-form-label"><strong>��� �ְ� </strong></label>			    
			    <div class="col-sm-3" style="padding-top: 7px;">
			         <strong><span id="highPrice"></span> ��</strong>
			    </div>
			    <div class="col-sm-4"></div>			    		    
		   </div>
		   <div class="form-group row">	
			  <div class="col-sm-3"></div>	    
			    <label for="price" class="col-sm-2 col-form-label"><strong>��� �� </strong></label>			    
			    <div class="col-sm-3" style="padding-top: 7px;">
			         <strong><span id="avgPrice"></span> ��</strong>
			    </div>
			    <div class="col-sm-4"></div>			    		    
		   </div>
		  <div class="form-group row">
		  <div class="col-sm-2"></div>
		   <div class="col-sm-8">
		  	<span id="sellProb"></span>
		  </div>
		  <div class="col-sm-2"></div>
		  </div>
		<br/>
		   <div class="form-group">   
			  <a class="btn btn-outline-danger btn" href="#" id="${ticket.event.eventId}" name="sellModal" role="button" data-target="#sellModal" data-toggle="modal">�Խõ� &nbsp;�Ǹ���Ȳ &nbsp;����</a>
		   
		  </div>
		 <br/>
		  <div class="form-group">
		      <button type="button" class="btn btn-outline-dark" data-toggle="modal" >�� ��</button>
			  <a class="btn btn-outline-dark btn" href="#" role="button">��&nbsp;��</a>
		  </div>
		  </div>
		</div>
		</div>		
		<div class="col-lg-2">
		</div>
	</div>
	<!-- �̹������ ���â  -->
					<div class="modal fade" id="addImageModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
					    <div class="modal-content">
					      
					      <div class="modal-body">
					      <div class="text-center">
					      		<h3>�ǹ� �̹��� ���</h3>
								<br/>	
								<div class="img_wrap">
								<img id="preview" />	
								</div>
								<form>				  
								<br/>
								       <input type="file" id="file" name="file" value="" placeholder="file input...">
								  
								  </div>
								<br/>
									<div class="text-center">
								      <button type="button" class="btn btn-outline-primary">�� û</button>
									</div>							   
								</form>
						  </div>		
					      </div>
					      <div class="modal-footer">
					        </div>
					    </div>
					  </div>
					</div>
					
					<script>		
						function fncAddTicketImage(){
							//Form ��ȿ�� ����
						 	var file = $("input[name='file']").val();							
							if(file == null || file.length<1){
								swal("�̹������ �ٶ�","","error");
								
								return;
							}
							swal("�̹������ ����","","success")
							.then(function(r){
								$("form").attr("method" , "POST").attr("action" , "/ticket/addTicketImage").attr("enctype" , "multipart/form-data").submit();
							});
							
						}						
						$(function(){
						    
						    $("button:contains('�� û')").on("click",function(){						    	
						    	fncAddTicketImage();	    	
						    });						    
						    $("#file").change(function(){
						    	readURL(this);
						    });					    
						});
					</script>
	
 	<!-- �Ǹ���Ȳ ���â  -->
					<div class="modal fade" id="sellModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
					    <div class="modal-content">
					      
					      <div class="modal-body">
					      	<canvas id="myChart"></canvas>
					      </div>
					      <div class="modal-footer">
					        </div>
					    </div>
					  </div>
					</div>
					<script >
					
						$("a[name='sellModal']").on("click", function(){
							
							var eventId = $(this).attr("id").trim();
							
							$.ajax({
								url : "/ticket/rest/getSellList/"+eventId ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
					          	success: function(JSONdata){
					          		
					          		var ctx = document.getElementById('myChart').getContext('2d');
									
									var chart = new Chart(ctx, {
									    // The type of chart we want to create
									    type: 'line',
								
									    // The data for our dataset
									    data: {
									        labels: ['5���� ����', '5����~10����', '10����~20����', '20����~30����', '30����~40����', '40�����̻�'],									        
									        datasets: [{
									            label: '�Ǹ� ��Ȳ',
									            borderColor: '#1E90FF',									            
									            data: [JSONdata.a, JSONdata.b, JSONdata.c, JSONdata.d, JSONdata.e, JSONdata.f]
									        }]
									    },					
									    options: {
									    	fontColor: 'white'
									    }
									});					          		
					          	}
							});
							
						});
											
						
					</script>	
 	<jsp:include page="/layout/footer.jsp" />
</body>

</html>