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
	<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
		
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
	
	function fncAddDelivery(){
		//Form ��ȿ�� ����
	 	var deliveryCompany = $("#deliveryCompany option:selected").val();
	 	var deliveryNo = $("input[name='deliveryNo']").val();
	 	
		swal("��� �Ϸ�!","","success")
		.then(function(r){
			$("form[name='addDelivery']").attr("method" , "POST").attr("action" , "/tran/addDelivery").submit();	
		});
		
	}	
	
	
	$(function(){
		
		var key = "CbHyQ5hk2Mf9jPrkBc5Gcg";
		var tranNo = "";
		
	    $("a.getEvent").on("click", function(){
	    	var eventId = $(this).closest("div").attr("id").trim();
	    	
	    	self.location = "/event/getEventTicketList?eventIds="+eventId;	    	
	    });
	    $("a.chat").on("click", function(){
	    	
	    	var tranCode = $(this).closest("p").attr("id").trim();
	    	if(tranCode=='0'){
	    		swal("�ԱݿϷ� �� ä���� ��û�ϼ���.","","error");
	    		return;
	    	}
	    	var opponentId = $(this).attr("id").trim();
	    	var userId = "${user.userId}";
	    	
	    	window.open("/tran/goChat?userId="+userId+"&opponentId="+opponentId+"&re=req", "T-GET ä��" ,"width = 500, height = 500, top = 100, left = 200, location = no");
	    });	    
	    $("#addDelivery").on("click", function(){
	    	
	    	$("#tranNo").val(tranNo);
	    	var deliveryCompany = $("#deliveryCompany option:selected").val();
		 	var deliveryNo = $("input[name='deliveryNo']").val();
		 	var result = "0";
		 	
	    	$.ajax({
	            type:"GET",
	            dataType : "json",
	            url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+key+"&t_code="+deliveryCompany+"&t_invoice="+deliveryNo,
	            success:function(data){
	            	console.log(data);                
	                
                    if(data.status == false){
                    	swal(data.msg,"","info");
                    }else{
                    	fncAddDelivery();
                    }
	            }
	    	});
	    });

	    
	    $("a.searchDelivery").on("click", function(){
	    	tranNo = $(this).attr("id").trim();	    	
	    	
	    	var deliveryCompany = ""+$(this).children(".tranDeliveryCompany").text().trim()+"";
	    	var deliveryNo = ""+$(this).children(".tranDeliveryNo").text().trim()+"";
	    		    	
	    	 $.ajax({
	            type:"GET",
	            dataType : "json",
	            url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+key+"&t_code="+deliveryCompany+"&t_invoice="+deliveryNo,
	            success:function(data){
	            	console.log(data);   
	                var myInvoiceData = "";
	                
                    if(data.status == false){
                        myInvoiceData += ('<p class="text-danger">����� ���۵Ǿ����� �ù���� �����Ȳ�� ��ϵ��� �ʾҽ��ϴ�.<p>');
                    }else{
                    	myInvoiceData += ('<table class="table">');      
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"�����ȣ"+'</td>');                     
                        myInvoiceData += ('<th>'+data.invoiceNo+'</td>');                     
                        myInvoiceData += ('</tr>');     
                        myInvoiceData += ('</table>');
                    }                
                    
                    $("#searchResult").html(myInvoiceData)
                    
                    var trackingDetails = data.trackingDetails;                    
                    
                    var myTracking="";
                    var header ="";
                    header += ('<table class="table">');
                    header += ('<thead>');  
                    header += ('<tr>');                
                    header += ('<th>'+"�ð�"+'</th>');
                    header += ('<th>'+"���"+'</th>');
                    header += ('<th>'+"����"+'</th>');
                    header += ('<th>'+"��ȭ��ȣ"+'</th>');                     
                    header += ('</tr>');     
                    header += ('</thead>'); 
                    header += ('<tbody>');
                    $.each(trackingDetails,function(key,value) {
                        myTracking += ('<tr style="background-color: white;">');                
                        myTracking += ('<td>'+value.timeString+'</td>');
                        myTracking += ('<td>'+value.where+'</td>');
                        myTracking += ('<td>'+value.kind+'</td>');
                        myTracking += ('<td>'+value.telno+'</td>');                     
                        myTracking += ('</tr>');                                    
                    });
                    myTracking += ('</tbody>');
                    myTracking += ('</table>');
                    $("#searchTracking").html(header+myTracking);
	            }
	        }); 
	    	
	    });
	    $("a.startDelivery").on("click", function(){
	    	tranNo = $(this).closest("div").attr("id").trim();
	    });
	    $("#file").change(function(){
	    	readURL(this);
	    	var form = $("form[name='addDelivery']")[0];
	    	var formData = new FormData(form);
	    	$.ajax(
					{
						url : "/tran/rest/getDeliveryInfo/" ,
						processData: false,
	                    contentType: false,
						method : "POST" ,						
						data : formData ,
						beforeSend : function(){
				            $('#loading').html("<div class='spinner-border text-primary' role='status'>"+
				            "<span class='sr-only'>Loading...</span>"+
				            "</div>");
				        },
						success : function(data) {	
							$('#loading').html("");
							var deliveryCompany = $.trim(data.deliveryCompany);
							
							if(deliveryCompany=="CJ")
								$("#deliveryCompany").val("04").prop("selected", true);							
							if(deliveryCompany=="��ü��")
								$("#deliveryCompany").val("01").prop("selected", true);							
							if(deliveryCompany=="KGB")
								$("#deliveryCompany").val("56").prop("selected", true);							
							if(deliveryCompany=="����")
								$("#deliveryCompany").val("05").prop("selected", true);							
							if(deliveryCompany=="����")
								$("#deliveryCompany").val("06").prop("selected", true);							
							if(deliveryCompany=="�Ե�")
								$("#deliveryCompany").val("08").prop("selected", true);							
							if(deliveryCompany=="CU")
								$("#deliveryCompany").val("46").prop("selected", true);							
							if(deliveryCompany=="�浿")
								$("#deliveryCompany").val("23").prop("selected", true);							
							if(deliveryCompany=="����")
								$("#deliveryCompany").val("53").prop("selected", true);							
							
							$('#deliveryNo').val(data.deilveryNo);
						}							 
			});
	    });
	   
	});
	
	$(function(){
		
		$("a[href='#']:contains('�ı��ۼ� ����')").on("click", function(){
			
		});
		$("a[href='#']:contains('����Ʈ ��볻��')").on("click", function(){
			self.location = "/rnp/getPointHistory";
		});
		$("a[href='#']:contains('�Ǹ�Ƽ�� ���')").on("click", function(){
			self.location = "/ticket/getTicketList?menu=seller";
		});
		
		
	});
	
	$(function(){
		$("a.endDelivery").on("click", function(){
	    	var tranNo = $(this).attr("id").trim();
	    	$("#reviewTranNo").val(tranNo);
// 	    	popWin = window.open("/rnp/addReview?tranNo="+tranNo ,"popWin",
// 					"left=500, top=100, width=600, height=500, "
// 					+"marginwidth=0, marginheight=0, scrollbars, scrolling, menubar=no, resizable");
			
	    });
		
		$("button.close").on("click",function(){
			$("select[name='score']").val("");
			$("textarea[name='reviewBody']").text("");
			$("#reviewTranNo").val("");
		});
		
		$("#submit").on("click",function(){
			$.ajax(
					{
						url : "/rnp/rest/addReview",
						method : "POST",
						data : {
								tranNo : $("#reviewTranNo").val(),
								score : $("#score").val(),
								reviewBody : $("#reviewBody").val()
									},
						dataType : "json",
						success : function(JSONData, status){
							$("#"+$("#reviewTranNo").val()).text("-");
							$("button.close").click();
							swal("���� �ۼ� �Ϸ�� ���� "+JSONData.updatePoint+" ����Ʈ�� �����Ǿ����ϴ�.","","success")
							.then(function(r){
								history.go(0);
							});							
						}			
				});	
		});
	});
		
	</script>		
    
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp" />	
	<jsp:include page="/layout/tgetHeader.jsp" />
	
	<div class="container">
	<div class="row">
		<div class="col-lg-3">
		<div class="sticky-top">
		<br/><br/><br/><br/>
			<div class="card text-center shadow-lg rounded" style="width: 15rem; color: #041625;">
			  <div class="card-header">
			   <strong>${user.nickName}<br/> <i class="far fa-handshake"></i> �ŷ����� ��ȸ </strong>
			  </div>
			  <ul class="list-group list-group-flush">								
				<c:if test="${user.role=='0'}">
				<li class="list-group-item"><a href="#" data-target="#addSellerModal" data-toggle="modal">�Ǹ��� ���</a></li>
				</c:if>
				<li class="list-group-item"><a href="#">����Ʈ ��볻��</a></li>
				<c:if test="${user.role=='1'}">
				<li class="list-group-item"><a href="#">�Ǹ�Ƽ�� ���</a></li>
				</c:if>
				<li class="list-group-item"><a href="#">Ƽ�ϰŷ� ����</a></li>
			  </ul>		  
			</div>
		
		  </div>
		  </div>
		<div class="col-lg-9">
		<div class="text-center">
      		<strong>��  ${totalCount} ��</strong>	<br/><br/>	 		 
		</div>
		<div class="row">
		<c:forEach var="tran" items="${list}" varStatus="j">
			<div class="col-sm-6" style="margin-bottom: 20px;">
				<div class="card text-center shadow rounded" style="height: 234px;">
			      <div class="card-body">
			        <h5 class="card-title">				       
				        <div id="${tran.event.eventId}">					      
					      <span class="badge badge-info">
						      <c:if test="${user.userId==tran.seller.userId}">�Ǹ�</c:if>
					       	 <c:if test="${user.userId==tran.buyer.userId}">����</c:if>
						  </span>
						  <strong><a class="getEvent" href="#">${tran.event.eventName}</a></strong>
					     </div>					     
				     </h5>
			        <p class="card-text">
			        <strong>${tran.orderAmount} �� / ${tran.orderDate}</strong>	
			        </p>
			        <p id="${tran.tranCode}" class="card-text">
			        <strong>
			          <c:if test="${user.userId==tran.seller.userId}">${tran.buyer.nickName}
				      <a class="chat" id="${tran.buyer.userId}" href="#" >
				      <i class="far fa-comment-alt"></i></a>
				      </c:if>
				      <c:if test="${user.userId==tran.buyer.userId}">${tran.seller.nickName}
				      <a class="chat" id="${tran.seller.userId}" href="#" >
				      <i class="far fa-comment-alt"></i></a>
				      </c:if>
				     </strong> 
				    </p>  
				    <p>
				    <strong>
				    	  <c:if test="${tran.tranCode==0}">* ������ �Աݴ��</c:if>
					      <c:if test="${tran.tranCode==1}">* �����Ϸ�</c:if>
					      <c:if test="${tran.tranCode==2}">* ��� �� 
					      <a class="searchDelivery" id="${tran.tranNo}" href="#" data-toggle="modal" data-target="#searchDeliveryModal">
					      <i class="fas fa-truck"></i>
					      <span class="tranDeliveryNo" style="display: none;">${tran.deliveryNo}</span>
					      <span class="tranDeliveryCompany" style="display: none;">${tran.deliveryCompany}</span>
					      </a>
					      </c:if>
					      <c:if test="${tran.tranCode==3}">* ��� �Ϸ�</c:if>
					      <c:if test="${tran.tranCode==4}">* ȯ�� �� ���</c:if>
					 </strong>     
				     </p>
						<div id="${tran.tranNo}">
					      <c:if test="${user.userId==tran.seller.userId}">
						      <c:if test="${tran.tranCode==0}">-</c:if>
						      <c:if test="${tran.tranCode==1}"><a class="btn btn-outline-info startDelivery" href="#" data-toggle="modal" data-target="#deliveryModal">��۽���</a></c:if>
						      <c:if test="${tran.tranCode==2}">-</c:if>
						      <c:if test="${tran.tranCode==3}">
						      <c:if test="${user.userId==tran.seller.userId}">
						      <a class="btn btn-outline-info getReview" href="/rnp/getSellerEstimationList?sellerId=${user.userId}">�ı� Ȯ��</a>
						      </c:if>
						      <c:if test="${user.userId==tran.buyer.userId}">
						      <a class="getReview" href="/rnp/getReviewList">�ı� Ȯ��</a>
						      </c:if>
						      </c:if>
						      <c:if test="${tran.tranCode==4}">-</c:if>
					      </c:if>
					      <c:if test="${user.userId==tran.buyer.userId}">
						      <c:if test="${tran.tranCode==0}">-</c:if>
						      <c:if test="${tran.tranCode==1}">-</c:if>
						      <c:if test="${tran.tranCode==2}"><a class="btn btn-outline-info endDelivery" id="${tran.tranNo}"  data-toggle="modal" 						
										 data-target="#exampleModalCenter" >��۵���</a></c:if>
						      <c:if test="${tran.tranCode==3}">-</c:if>
						      <c:if test="${tran.tranCode==4}">-</c:if>
					      </c:if>
					      </div>
			      </div>	      
			    </div>			    
		    </div>
		</c:forEach>
		</div>		
		</div>		
	</div>
 </div>
	<!-- ��������Է� ���â  -->
					<div class="modal fade" id="deliveryModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h3 class="modal-title" id="modalCenterTitle">��������� ������ּ���.</h3>
					        <a href="#" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </a>
					      </div>
					      <div class="modal-body">
					      <form name="addDelivery" enctype="multipart/form-data"> 
					      	<input type="hidden" id="tranNo" name="tranNo" value=""/>
					      	<div class="form-group" >
							     <br/>
							     <strong>��� ��</strong> <br/><br/>	
							        <select class="custom-select" id="deliveryCompany" name="deliveryCompany">
									    <option value="">����</option>
									    <option value="04">CJ�������</option>									    
									    <option value="01">��ü���ù�</option>
									    <option value="56">KGB�ù�</option>
									    <option value="05">�����ù�</option>
									    <option value="06">�����ù�</option>
									    <option value="08">�Ե��ù�</option>
									    <option value="46">CU�������ù�</option>
									    <option value="23">�浿�ù�</option>
									    <option value="53">�����ù�</option>
									</select><br/><br/>
							      <strong>����� ��ȣ</strong><br/><br/><input class="form-control" type="text" id="deliveryNo" name="deliveryNo" value="" placeholder="(-) ���� �Է�" style="width: 300px !important; "/>
							      <br/><br/>
							      <div class="text-center" id="loading"></div>
							      <br/><br/>
								  <div class="img_wrap">
									<img id="preview" />	
							      </div>
							      <strong>�̹����� ���</strong>
							      
							      <input type="file" class="form-control" id="file" name="file" value="" placeholder="file input...">
							</div>
					      </form>			      
					      </div>
					      <div class="modal-footer">
					        <button type="button" id="addDelivery" class="btn btn-primary">���</button>
					      </div>
					    </div>
					  </div>
					</div>
	<!-- ��� ��ȸ ��� -->
					<div class="modal fade" id="searchDeliveryModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h3 class="modal-title" id="modalCenterTitle">�����ȸ ����Դϴ�.</h3>
					        <a href="#" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </a>
					      </div>
					      <div class="modal-body">
					      	<div id="searchResult">
					      	</div>
					      	<div id="searchTracking">
					      	</div>					      	      
					      </div>
					    </div>
					  </div>
					</div>	
	<!-- �Ǹ��� ��� ��� -->
	<jsp:include page="/ticket/addSeller.jsp" />				
	<jsp:include page="/layout/footer.jsp" />			
	
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"  
aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
    <br/>
      <h4 class="text-center"> <strong>���� ���</strong></h4>
      <div class="modal-body">
        <jsp:include page="/rnp/addReview.jsp" />
      </div>
      <div class="modal-footer" style="color: black;" >       
        <button type="button"  class="btn btn-light" id="submit" >����</button>
         <button type="button" class="btn btn-dark" data-dismiss="modal">�ݱ�</button>
      </div>
    </div>
    </div>
   </div>

	
</body>

</html>