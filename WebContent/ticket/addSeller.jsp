<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
	
	$(function(){
				
		$("#addSellerSubmit").on("click",function(){	
			var userAccountBank = $("#accountBank option:selected").val();
			var userAccountNo = $("input[name='accountNo']").val();
			if(userAccountBank == null || userAccountBank.length<1){
				swal("������ �������ּ���.","","warning");
				return;
			}
			if(userAccountNo == null || userAccountNo.length<11 || isNaN(userAccountNo)==true){
				swal("���¹�ȣ�� 10�� �̻� ���ڸ� �Է��ϼž� �մϴ�.","","warning");
				return;
			}
	    	$.ajax(
					{
						url : "/ticket/rest/addSeller/" ,
						method : "POST" ,
						data : JSON.stringify({
							userId : "${user.userId}",
							accountBank : userAccountBank,
							accountNo : userAccountNo
						}) ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(data) {	
							swal("��ϼ���!","ù �Ǹ� ��������� �߱޵Ǿ����ϴ�!","success")
							.then(function(r){
								history.go(0);	
							});
							
						}							 
			});
			
		});
	});
	</script>


	<div class="modal fade" id="addSellerModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					       <div class="modal-body">
					      		
									<div align="center"><h3 style="font-weight: bold;">
										�Ǹ��� ���� �Է�
									</h3></div><br/>
									<form name="addSeller">
									<input type="hidden" name="userId" id="userId" value="${user.userId}">
									<div class="form-group row">	
									  <div class="col-3 text-center">���̵� </div>		    
									    <div class="col-6">
									         <strong>${user.userId}</strong>    	
									    </div>	
									    <div class="col-3"></div>	    		    
									  </div>
									 <div class="form-group row">	
									  <div class="col-3 text-center" style="margin-top: 8px;">���� </div>		    
									    <div class="col-6">
									         <select class="custom-select" id="accountBank" name="accountBank" >
								 		 		<option value="">����</option>
								 		 		<option value="039">�泲���� </option>
								 		 		<option value="004">�������� </option>
								 		 		<option value="034">�������� </option>
								 		 		<option value="003">������� </option>
								 		 		<option value="031">�뱸���� </option>
								 		 		<option value="045">�������ݰ� </option>
								 		 		<option value="088">�������� </option>
								 		 		<option value="048">�������� </option>
								 		 		<option value="027">��Ƽ���� </option>
								 		 		<option value="020">�츮���� </option>
								 		 		<option value="071">��ü��</option>
								 		 		<option value="005">��ȯ���� </option>
								 		 		<option value="081">�ϳ����� </option>
								 		 	</select>  	
									    </div>	
									    <div class="col-3"></div>	    		    
									  </div> 	
									  <div class="form-group row">	
									  <div class="col-3 text-center" style="margin-top: 8px;">���� ��ȣ </div>		    
									    <div class="col-6">
									         <input type="text" class="form-control" name="accountNo" value="" placeholder="(-) ���� �Է�" maxlength="15">     	
									    </div>	
									    <div class="col-3"></div>	    		    
									  </div>
									  <div class="text-danger" style="padding-left: 10px;">
									  <small>*�ش� ������ Ƽ�� �Ǹ� �� �ǸŴ�� �Ա� �� Ȱ���ϴ� �����̸�<br/>
										 		�ٸ� �������δ� ������ �ʽ��ϴ�.
										  </small>
									  </div>
										 <br/>
									<div align="center">
											<a class="btn btn-light btn" href="#" role="button" id="addSellerSubmit">���</a>
											<a class="btn btn-light btn" href="#" role="button" id="addSellerCancle" data-dismiss="modal">���</a>						
									</div>
									</form>
								</div>			      	      
					      </div>
					    </div>
	 </div>

