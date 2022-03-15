<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
	
 
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">	
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
	
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
		<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>

		body {
			  background-color: white;
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a{
			color: #041625;
		}
    </style>	
    
</head>

<body>

		  
		  <script type="text/javascript">

		  
		  $(function() {

				$("input[name='userId']").on('keyup',function() {

					var inputed = $("input[name='userId']").val();
									

					
					$.ajax({
					url : "/user/json/checkuserIdDuplication",
					method : "POST",
					dataType : "json",
						headers : {
							"Accept" : "application/json",
						"Content-Type" : "application/json"
									},
								data : JSON.stringify({
									userId : inputed,
									}) ,

								success : function(JSONData) {
									if (JSONData && inputed != "") {
										$("#check").children("strong")
											.remove();
												$("#check")
													.append(
													
												
													"<strong  class=\"text-danger\">ȸ�� ������ �����ϴ�.</strong>");
												document.getElementById("p1").style.display = "none" ;
												document.getElementById("p2").style.display = "none" ;
												
											} else {
												
												
												$("#check").children("strong")
														.remove();
												$("#check")
													.append(
													"<strong class=\"text-success\">�޴���ȭ ������ ���ּ���.</strong>");
												document.getElementById("p1").style.display = "block" ;
												document.getElementById("p2").style.display = "block" ;
											}
										if (inputed == "") {
											
											
											$("#check").children("strong")
												.remove();
											$("#check")
													.append(
															"<strong class=\"text-muted\">���̵� �Է����ּ���.</strong>");
											
									
										}
										}

									});
								});

								});
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  $(function() {
				
			  var rand = "";
			  
				
				$("button:contains('����')").on("click" , function() {
					swal("������ȣ ����", "", "info");
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
			   
				   var btn = document.getElementById('btn');
				   
				   var code = $("#sms").val();
				   
					$("button:contains('����')").on("click" ,function(){ 
					var btn = document.getElementById('btn');
				   
				   var code = $("#sms").val();
						
				
					   
					   
				   if (rand == code) { 
					   				   					
					   swal("���� ����", "", "success");
						phone.style.border = "3px solid gold";
						phone.readOnly = true;
						$("#p2").hide();
						$("#check").hide();
						$("#sendRend").hide();
						$("#p3").show();
				   } else
			  		 { 
					   swal("���� ����", "", "error");
			  	 	} 
				 	  
		   });
				   });
			   $(function(){
			         $("#alert-success").hide();
			         $("#alert-danger").hide();
			         $("input").keyup(function(){
			             var pwd1=$("#password").val();
			             var pwd2=$("#password2").val();
			             if(pwd1 != "" || pwd2 != ""){
			                 if(pwd1 == pwd2){
			                	 
			                     $("#alert-success").show();
			                     $("#alert-danger").hide();
			                     $("#changeButton").show();
			                 }else{
			                	 
			                     $("#alert-success").hide();
			                     $("#changeButton").hide();
			                     $("#alert-danger").show();
			                 }    
			             }
			         });
			     });

			   $(function() {
					//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
							$("button:contains('����')").on("click" , function() {
								swal("���� ����!", "", "success")
								.then(function(result){
									$("form").attr("method" , "GET").attr("action" , "/user/updatePassword").submit();
									window.close();
								});								
							});
			   });
			   
			   
			   $(function() {
			   $("button:contains('���')").on("click" , function() {
				  
			   		self.close();
			   
			   });
			   });
			   
			   
				$(function() {
					$("input[name='phone']").on('keyup',function() {

						
				 $(this).val($(this).val().replace(/[^0-9]/g,""));
			
				 
					});
				   });

			   
			   
		     </script>
				
		  <form class="form-horizontal">
		  <h4 align="center"><strong>T-GET ��й�ȣ ã��</strong></h4>
			<br/>
			
			<div class="form-group row">	
			  <div class="col-3 text-right" style="padding-top: 8px;">���̵� </div>		    
			    <div class="col-6">
			         <input type="text" class="form-control" id="userId" name="userId" value="" placeholder="���̵� �Է����ּ���."/>
			    </div>	
			    <div class="col-3"></div>	    		    
			  </div>
			  <div id ="p1" style="display:none;">		
				  <div class="form-group row">
				    <div class="col-3 text-right" style="padding-top: 8px;">�޴���ȭ </div>		    
					 <div class="col-6">
					      <input type="text" class="form-control" id="phone" name="phone" value="" placeholder="'-' ���� �Է����ּ���."/>
					 </div>	
					 <div class="col-3"><button type="button" id="sendRend" class="btn btn-outline-primary">����</button></div>		    
				  </div>
		  	  </div>
		  <div id="check" class="text-center" style="margin-bottom: 8px;">
		  	
		  </div>
		  <div id ="p2" style="display:none;">
		  		<div class="form-group row">
					 <div class="col-3 text-right" style="padding-top: 8px;">������ȣ </div>		    
					 <div class="col-6">
					      <input type="text" class="form-control" id="sms" name="sms" value="" placeholder="������ȣ"/>
					 </div>	
					 <div class="col-3"><button type="button" class="btn btn-outline-primary">����</button></div>		    
				  </div>
		  </div>
		  <div id ="p3" style="display:none;">
		  		<div class="form-group row">
					 <div class="col-3 text-right" style="padding-top: 8px;">��й�ȣ </div>		    
					 <div class="col-6">
					      <input type="password" class="form-control" id="password" name="password" value="" placeholder="��й�ȣ"/>
					 </div>	
					 <div class="col-3"></div>		    
				</div>
				<div class="form-group row">
					 <div class="col-3 text-right" style="padding-top: 8px;">Ȯ�� </div>		    
					 <div class="col-6">
					      <input type="password" class="form-control" id="password2" name="password2" value="" placeholder="��й�ȣ Ȯ��"/>
					 </div>	
					 <div class="col-3"></div>
					  					  		    
				</div>				
		  </div>
			<div class="text-center" style="margin-bottom: 8px;">
					<span id = "alert-success"><Strong class="text-success">��й�ȣ�� ��ġ�մϴ�.</Strong>
				      </span>
					<!-- <div class="col-sm-4" id="alert-danger">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</div> -->
					 <span id = "alert-danger"><Strong class= "text-danger">��й�ȣ�� ��ġ���� �ʽ��ϴ�.</Strong>
				     </span>				     
			</div>
		<div class="text-center">
			   <button type="button" id="changeButton" class="btn btn-outline-primary" style="display: none;">����</button>
			   <button type="button" id= "btn2" class="btn btn-outline-danger btn">���</button>
		</div>
		
	</form>			
 	
	</body>

</html>