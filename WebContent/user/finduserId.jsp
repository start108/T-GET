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
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
	
	<!-- ToolBar Start /////////////////////////////////////-->

			
		  
<script type="text/javascript">

 $(function() {
			  
			  var rand = "";
			  var codeResult = false;
				
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
			   
			  
					
				$("button:contains('����')").on("click" ,function(){ 
				   
				 
					var phone = document.getElementById("phone");					
					var code = $("#sms").val();
					
					   if (rand == code) { 	
						   swal("���� ����!", "", "success");
						   codeResult = true;
					   
					   } else { 
						   swal("���� ����!", "", "error");
				  	 	} 
				 	   
				 });
				
				$("button:contains('ã��')").on("click" , function() {
						var userName = $("input[name='userName']").val();
						
						if(userName == null || userName.length<1){
							 swal("�̸��� ��Ȯ�� �Է����ּ���!", "", "warning");
							return;
						}
						if(!codeResult){
							 swal("������ �ݵ�� �ؾߵ˴ϴ�!", "", "warning");
							return;
						}
					
						
						 $.ajax({ 
							   url: "/user/json/finduserId",
						   data: { 
							
							   userName: $("#userName").val(), 
							   phone: $("#phone").val(), 
							   }, 
							   type: "post", 
							   dataType:"json", 
							   error : function(){
								   swal("�Է��Ͻ� ������ ȸ�������� �����ϴ�!", "", "error");
							   },							   
							   success : function(JSONData){
									console.log(JSONData);   
							   
							   if(JSONData.msg== "no"){
								   swal("�Է��Ͻ� ������ ȸ�������� �����ϴ�!", "", "warning");
							   }
							   else if(JSONData.msg== "yes"){		
								   swal("���̵� ã�� ����!", "ȸ������ ���̵�� "+JSONData.Id+"�Դϴ�.", "success")
								   .then(function(result){
									   window.close();
								   })
							   }
						   }
					 });
				});	
			
					$("input[name='userName']").on('keyup',function() {

						
						  if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
				               var inputVal = $(this).val();
				               $(this).val(inputVal.replace(/[^(��-��a-zA-Z)]/gi, ''));
				            }
				         });
			

			
			$("input[name='phone']").on('keyup',function() {

						
				 $(this).val($(this).val().replace(/[^0-9]/g,""));
				 
			});
		
		
			 $("button:contains('���')").on("click" , function() {
						
					   		self.close();
					   
			});
	});
			   
			   
		     </script>
				
		  <form class="form-horizontal">
		  <h4 align="center"><strong>T-GET ���̵� ã��</strong></h4>
			<br/>
			
			<div class="form-group row">	
			  <div class="col-3 text-center" style="padding-top: 8px;">�̸� </div>		    
			    <div class="col-6">
			         <input type="text" class="form-control" id="userName" name="userName" value="" placeholder="ȸ���̸�"/>
			    </div>	
			    <div class="col-3"></div>	    		    
			  </div>			
			<div class="form-group row">	
			  <div class="col-3 text-center" style="padding-top: 8px;">�޴���ȭ</div>		    
			    <div class="col-6">
			         <input type="text" class="form-control" id="phone" name="phone" value="" placeholder="'-' ���� �Է����ּ���."/>
			    </div>	
			    <div class="col-3">
			    	<button type="button" class="btn btn-outline-primary">����</button>
			    </div>	    		    
			  </div>
			  <div class="form-group row">	
			  <div class="col-3 text-center" style="padding-top: 8px;">������ȣ</div>		    
			    <div class="col-6">
			         <input type="text" class="form-control" id="sms" name="sms" value="" placeholder="������ȣ"/>
			    </div>	
			    <div class="col-3">
			    	<button type="button" class="btn btn-outline-primary">����</button>
			    </div>	    		    
			  </div>			
				
		  <div>
		    <div class="text-center">
		     
		      <button type="button" id ="changePassword" class="btn btn-outline-primary">ã��</button> 		      
		  	  <button type="button" id ="btn" class="btn btn-outline-danger btn">���</button> 
			 
			  
		    </div>
 			 </div>
		  
		  
		</div>	
		</form>
		
</body>

</html>