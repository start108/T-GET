 <%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>


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
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
		<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
   		
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

    	</style>
				
			
<script type="text/javascript">

$(function() {
	
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("button:contains('�Ǹų��� ��ȸ')").on("click" , function() {

				
		self.location="/ticket/getTicketList?menu=seller";
				
	});
});	









				</script>
			</head>
			<body>
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />
	
			
	<!-- <div class="text-right" style="margin-right: 130px; margin-top: 30px;">	  
	
	</div> -->
		   <!--  table Start /////////////////////////////////////-->
			<section>
				<br/>
				<div class="tabs tabs-style-topline">
			
					<nav>
						<ul style="color:black;">
							<li><a href="#section-topline-1"><h6><strong style="color:black;">�� ������ ����</strong></h6></a></li>
							<li><a href="#section-topline-2"><h6><strong style="color:black;">�Ǹ��� ���� ����</strong></h6></a></li>
						</ul>
					</nav>
				
			<div class="content-wrap">
				<section id="section-topline-1">
				<div class="row">
				<div class="col-lg-3"></div>
				<div class="col-lg-6">
								<div class="text-center">
					     		<br/>
					     		<div class="card text-center shadow rounded" style="margin-bottom: 10px;">
							 	<div class="card-header" align="center" style="background-color: smokegray;">
    						
							    	 <h3 style="padding-top: 10px;padding-bottom: 10px;"><i class="far fa-id-card"></i> <strong>${user.nickName}�� ������</strong></h3>
							                  
							    </div>
							 	<div class="card-body">	       
						       
													
									<div class="row">		
										<div class="col-md-2"></div>	
								  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i> ���̵�</h5></div>
										<div class="col-md-6 text-left">${user.userId}</div>
									</div><br/>
									<div class="row">	
									<div class="col-md-2"></div>			
								  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i> �г���</h5></div>
										<div class="col-md-6 text-left">${user.nickName}</div>
									</div><br/>
									<div class="row">	
									<div class="col-md-2"></div>			
								  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i> �� ��</h5></div>
										<div class="col-md-6 text-left">${user.userName}</div>
									</div><br/>
									<div class="row">
									<div class="col-md-2"></div>				
								  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i> �ּ�</h5></div>
										<div class="col-md-6 text-left">${user.address}</div>
									</div><br/>
									<div class="row">		
									<div class="col-md-2"></div>		
								  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i> ��ȭ��ȣ</h5></div>
										<div class="col-md-6 text-left">${ !empty user.phone ? user.phone : ''}</div>
									</div><br/><br/>
									
									
												
							  		<div class="text-center">
							  			<button type="button" class="btn btn-outline-primary" data-target="#updateUserModal" data-toggle="modal">ȸ������ ����</button><br>
							  		</div>
						            <br/>            
						            </div>
									</div>									 
								</div>
					</div>
					<div class="col-lg-3"></div>
					</div>										
					</section>
				
				<section id="section-topline-2">
				<div class="row">
				 <div class="col-md-6 text-center">     		
		     			<div class="card text-center shadow rounded" style="margin-bottom: 10px;">
						 <div class="card-header" align="center" style="background-color: smokegray;">
    						
							    	 <h4 style="padding-top: 10px;padding-bottom: 10px;"><i class="far fa-id-card"></i> <strong>${user.nickName}�� �Ǹ�������</strong></h4>
							                  
						 </div>
						 
						 <div class="card-body">					                      
			
									<c:if test="${user.role != 0}">
									<div class="row">		
												<div class="col-md-2"></div>	
										  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i> �Ǹ��ڵ��</h5></div>
												<div class="col-md-6 text-left">
													<c:set var="sc" value ="${user.sellerCode}"/>							
													<c:choose>
													<c:when test="${sc eq '0' }"> ���� </c:when>
													<c:when test="${sc eq '1' }"> ��� </c:when>
													<c:when test="${sc eq '2' }"> V.I.P </c:when>											
													<c:otherwise>											
													</c:otherwise>		
													</c:choose>
												</div>
									</div><br/>
									<div class="row">
											<div class="col-md-2"></div>				
										  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i> �� �Ǹűݾ�</h5></div>
												<div class="col-md-6 text-left">${user.salesAmount}</div>
									</div><br/>
									<div class="row">
											<div class="col-md-2"></div>				
										  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i> �� �Ǹ�Ƚ��</h5></div>
												<div class="col-md-6 text-left">${user.salesCount}</div>
									</div><br/>
									
									<button id="sb" type="button" class="btn btn-outline-primary" >�Ǹų��� ��ȸ</button>	<br>
									</c:if>
									<c:if test="${user.role == 0}">
										<div class="alert alert-danger" role="alert"><a href="#" class="alert-link" data-target="#addSellerModal" data-toggle="modal">�Ǹ��� ���</a>�� ���ּ���.</div>
										
									</c:if>
								</div>									
							</div>
					</div>	
					
							 <div class="col-md-6 text-center">
										<div class="card text-center shadow rounded" style="margin-bottom: 10px;">
								<div class="card-header" align="center" style="background-color: smokegray;">
    						
							    	 <h4 style="padding-top: 10px;padding-bottom: 10px;"><i class="far fa-credit-card"></i> <strong>${user.nickName}�� ��������</strong></h4>
							                  
								 </div>
								
								 <div class="card-body">	
													<c:if test="${user.role != 0}">
													<div class="row">
															<div class="col-md-2"></div>				
														  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i> �����ָ�</h5></div>
															<div class="col-md-6 text-left">${user.userName}</div>
													</div><br/>
													<div class="row">
															<div class="col-md-2"></div>				
														  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i> �����</h5></div>
															<div class="col-md-6 text-left">
															<c:set var="sc" value ="${user.accountBank}"/>													
															<c:choose>
															<c:when test="${sc eq '039' }"> �泲���� </c:when>
															<c:when test="${sc eq '004' }"> �������� </c:when>
															<c:when test="${sc eq '034' }"> �������� </c:when>
															<c:when test="${sc eq '003' }"> ������� </c:when>
															<c:when test="${sc eq '031' }"> �뱸���� </c:when>
															<c:when test="${sc eq '045' }"> �������ݰ� </c:when>
															<c:when test="${sc eq '088' }"> �������� </c:when>
															<c:when test="${sc eq '048' }"> ����</c:when>
															<c:when test="${sc eq '027' }"> ��Ƽ���� </c:when>
															<c:when test="${sc eq '020' }"> �츮���� </c:when>
															<c:when test="${sc eq '071' }"> ��ü�� </c:when>
															<c:when test="${sc eq '005' }"> ��ȯ���� </c:when>
															<c:when test="${sc eq '081' }"> �ϳ����� </c:when>
															<c:otherwise>
																�Ǹ��� ��� �� ��ȸ����.
																<button id= "add" type="button" class="btn btn-outline-primary" data-target="#addSellerModal" data-toggle="modal">�Ǹ��� ���</button>
															</c:otherwise>		
															</c:choose>
															</div>
													</div><br/>
													<div class="row">
															<div class="col-md-2"></div>				
														  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i> ���¹�ȣ</h5></div>
															<div class="col-md-6 text-left">${user.accountNo}</div>															
													</div><br/>
													<div class="text-center">
													  	<button type="button" class="btn btn-outline-primary" data-target="#addSellerModal" data-toggle="modal" >�������� ����</button>
														<br/>		
													 </div> 
											  	</c:if>
											  	<c:if test="${user.role == 0}">
											  	
													<div class="alert alert-danger" role="alert"><a href="#" class="alert-link" data-target="#addSellerModal" data-toggle="modal">�Ǹ��� ���</a>�� ���ּ���.</div>
													
												</c:if>
										</div>
										</div>
									</div>
						</div>
					</section>
					</div>		
					</div>
					</section>
						
					
<script src="/resources/javascript/cbpFWTabs.js"></script>
<script type="text/javascript"> src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
			(function() {

				[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
					new CBPFWTabs( el );
				});

			})();
</script>	
<jsp:include page="/user/updateUser.jsp" /> 
<jsp:include page="/ticket/addSeller.jsp" /> 
<jsp:include page="/layout/footer.jsp" />
</body>


</html> 