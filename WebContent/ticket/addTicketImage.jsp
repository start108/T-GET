<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="/resources/javascript/common.js" ></script>
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
	   body {
            padding-top : 50px;
        }
    </style>
    <style type="text/css">
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
		
		
	function fncAddTicketImage(){
		//Form ��ȿ�� ����
	 	var file = $("input[name='file']").val();
		
		if(file == null || file.length<1){
			swal("�̹�����ϸ� ������ּ���.","","warning");
			return;
		}
		swal("��ϼ���!","","success")
		.then(function(r){
			$("form").attr("method" , "POST").attr("action" , "/ticket/addTicketImage").attr("enctype" , "multipart/form-data").submit();	
		});
		
		
	}		
	
	$(function(){
	    
	    $("button").on("click",function(){	    	
	    	fncAddTicketImage();	    	
	    });
		
	    $("a[href='#']").on("click",function(){	    	
	    	self.close();	
	    });
	    
	    $("#file").change(function(){
	    	readURL(this);
	    });
	    
	    
	});
	</script>		
    
</head>

<body>	
	<div class="container">
	<br/>
		<h3 class="text-center">�ǹ� �̹��� ���</h3>
		<br/>	
		<div class="img_wrap">
		<img id="preview" />	
		</div>
		<form class="form-horizontal">				  
		<br/>		
		    <label for="file" class="col-sm-offset-1 col-sm-3 control-label">Ƽ�� �̹���(�ǹ�,������)</label>
		    <div class="col-sm-4">
		       <input type="file" class="form-control" id="file" name="file" value="" placeholder="file input...">
		    </div>
		  </div>
		<br/>
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;û</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>		
 	</div>	
				
</body>

</html>