<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<script type="text/javascript">
	
	var ch = 0;
	
	var cch = 0;
	
		  $(function() {
			 
		 		var rand = "";
			
				
				$("button:contains('����')").on("click" , function() {
					swal("������ȣ ����", "", "info");
					
			
					
					
					$("#inj").show();
				
					
					$.ajax({ 
						   url: "/user/json/sendSms",
						   data: { 
							   receiver: $("#phone").val()
							   }, 
							   type: "post",
							   dataType:"json", 
					
							   success : function(JSONData){
									console.log(JSONData);   
					
									rand = JSONData.rand;
						   
						   }  
				
						 }); 
					
						});
				   
				   
					$("button:contains('����')").on("click" ,function(){ 
						var phone = document.getElementById("phone");
						
						var code = $("#sms").val();
			
						
					   if (rand == code) { 
				   
					   swal("���� ����", "", "success");
					   $("#inj").hide();
						phone.style.border = "3px solid gold";
						phone.readOnly = true;
						$("#pij").hide();
					   	cch = 1;
						
				   } else
				  		 { 
					   swal("���� ����", "", "error");
				  	 	} 
				 	   
				   });
			   }); 
	
		  $(function(){
		         $("#alert-success").hide();
		         $("input").keyup(function(){
		             var pwd1=$("#password01").val();
		             var pwd2=$("#password02").val();
		             if(pwd1 != "" || pwd2 != ""){
		                 if(pwd1 == pwd2){
		                	 
		                 	$("#check1").show();
		                     $("#alert-success").show();
		                     $("#alert-danger").hide();
		                     $("#submit").removeAttr("disabled");
		                 }else{
		                	 
		                	 $("#check1").hide();	
		                     $("#alert-success").hide();
		                     $("#alert-danger").show();
		                     $("#submit").attr("disabled", "disabled");
		                 }    
		             }
		         });
		     });
	 
	     
	$(function() {
				
				$("button:contains('�ּ�ã��')").on("click" ,function(){
				    
			     	new daum.Postcode({
			            oncomplete: function(data) {
			                var address = '';

			                if (data.userSelectedType === 'R') {
			                	addresss = data.roadAddress;
			                } else { 
			                	address = data.jibunAddress;
			                }				
			               
			                $("#address").val(address);
			            }
			        }).open(); 
			 	
			 		});
				});
	     
			
			 $(function() {

					$("input[name='nickName']").on('keyup',function() {

						var inputed = $("input[name='nickName']").val();
										

						$.ajax({
						url : "/user/json/checknickNameDuplication",
						method : "POST",
						dataType : "json",
							headers : {
								"Accept" : "application/json",
							"Content-Type" : "application/json"
										},
									data : JSON.stringify({
										nickName : inputed,
										}),

									success : function(JSONData) {
										if (JSONData && inputed != "") {
											$("#check").children("strong")
												.remove();
													$("#check")
														.append(
														"<strong class=\"text-success\">��� �����մϴ�.</strong>");
												} else {
													$("#check").children("strong")
															.remove();
													$("#check")
														.append(
														"<strong  class=\"text-danger\">������ �г��� �Է����ּ���.</strong>");
												}
								
											}

										});
									});

									});
	
	
	
	
	
	
	
	
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("#updateUserSubmit").on("click" , function() {
				
						fncUpdateUser();
			});
		});			
		

		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
		
			var pwd1=$("#password01").val();
            var pwd2=$("#password02").val();
        	var address1=$("input[name='address']").val();
			
			
			if(pwd1 != pwd2){
				
				swal("��й�ȣ�� ��ġ���� �ʽ��ϴ�.", "", "error");
				return;
			}
			
		
			swal("���� �Ϸ�!", "", "success")
		 	.then(function(result){
		 		$("form[name=updateUser]").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		 	});	
			
		}
	
</script>
	

	
<div class="modal fade" id="updateUserModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
		<div class="modal-body">
	
	     <div class="login-card shadow rounded">
			 <div class="text-center" style="background-color: white;"><br/><br/>
				<div class="row">	
					<div class="col-md-3" style="margin-left: 10px;">
					<span style="color: black;"><Strong>���̵�</Strong> </span>
					<br/><br/><br/>
					<span id= "h1" style="color: black; display: none;" >������ȣ<br/><br/><br/><br/></span>
					
					<span style="color: black;"><Strong>��й�ȣ</Strong> </span>
					<br/><br/><br/><br/><br/><br/><br/>
					<span style="color: black;"><Strong>�̸�</Strong> </span>
				<br/><br/><br/><br/>
					<span style="color: black;"><Strong>�г���</Strong> </span>
				<br/><br/><br/>
					<span style="color: black;"><Strong>�޴���ȭ</Strong> </span>
						<br/><br/>
					<span style="color: black;"><Strong>�ּ�</Strong> </span><br><br>
					
				</div>
					
					<div class="col-md-8">
							
							
					
						<form name="updateUser" class="form-horizontal">
						
						   	   <div class="form-group" >
							   
						    <input type="text" class="form-control col-md-10"  id="userId" name="userId" value="${user.userId}" readOnly/>
								
							    </div>
							    
						<br>
							  	  <div class="form-group">
							  	  <div class="input-group-prepend">
					
							      <input type="password" class="form-control col-md-10" value="${user.password}" id="password01" name="password" placeholder="��й�ȣ">
							    </div>
							  </div>
							  
							  
							  
							  <div class="form-group">
						 <div class="input-group-prepend">
							      <input type="password"  class="form-control col-md-10"  value="${user.password}" id="password02" name="password2" placeholder="��й�ȣ Ȯ��">
							      
							  </div>
							  </div>
							 
							  <div class="form-group">
							  <label for="password3"></label>
							  <div class="text-left">
							  <span id = "alert-success"><Strong class="text-success">��й�ȣ�� ��ġ�մϴ�.</Strong>
							      </span>								
							   <span id = "alert-danger"><Strong class= "text-danger">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</Strong>
							      </span>
							  </div>    
							</div>
								
							    <div class="form-group">
							    <label for="userName"></label>
							    
							    <input type="text" class="form-control col-md-10"  id="userName" name="userName" value="${user.userName}" readOnly/>
								
							
							  </div>
							  <br>
							  <div class="form-group">
							  <div class="input-group-prepend">
							  
							  
							    <label for="nickName"></label>
							      <input type="text" class="form-control col-md-10"  id="nickName" name="nickName" value="${user.nickName}"><br>
							     
							
							  </div>
							  <div class="text-left">
							   <span id = "check" class="text-secondary"><Strong>������ �г����� �Է����ּ���.</Strong></span>
							  </div>
							  </div>
						
							  
							
							  
							  <div class="form-group"> 
							  <div class="input-group-prepend">
							
							    
									<input type="text" class="form-control col-md-7"  id="phone" name="phone" value="${user.phone}" >
							      &nbsp;&nbsp;&nbsp;<button id="pij" type="button" class="btn btn-outline-primary">����</button>
							      <i id="sm2" class="far fa-grin fa-2x" style="color:Green; display:none;"></i>
							  
							  </div>
							   </div>
							   
							   <div id="inj" class="text-center" style="display:none">
							 <div class="form-group">
							   <div class="input-group-prepend">
							      <input type="text" class="form-control col-md-7"  id="sms" name="sms" placeholder="������ȣ �Է�">
							      &nbsp;&nbsp;&nbsp;<button id="injb2" type="button" class="btn btn-outline-primary">����</button>
							    </div>
							  </div>
							  </div>	 
							  	<div class="text-left">
					 
								<input class="form-control col-md-10"  type="text" id="address" name="address" value="${user.address}">
								<button type="button" class="btn btn-link">�ּ�ã��</button>
							      </div>
						
						  
							</form>						
					</div>
				</div>
				<div class="text-center">
				<button id= "updateUserSubmit" type="button" class="btn btn-outline-primary" title="�ݵ�� �޴��� ���������� �ϼ���.">����</button>
				<a class="btn btn-outline-danger btn" href="#" role="button" data-dismiss="modal">�� ��</a>
				</div>				
				<br/>
			</div>
			</div>
			</div>		
			</div>	
	 </div>		
	 </div>
	 