 <%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Footer -->
			<br/><br/><br/><br/>
			<footer>
				
				<div id="footer" class="jumbotron">
				<div class="text-center">
					<div class="row">
						<div class="col">
							<h3>��������</h3>
							<hr/>
							<br/>
								<a href="#">Ƽ�ϰŷ� ����</a><br/><br/>
								<a href="#">�����Խ��� �̿����</a><br/><br/>
								
							
						</div>
						<div class="col">
							<h3>�����Խ���</h3>
							<hr/>
							<br/>
								<a href="#">��ϴ�</a><br/><br/>
								<a href="#">�˴ϴ�</a><br/><br/>
								<a href="#">���ٹ�</a>
						</div>
						<div class="col">
							<h3>������</h3>
							<hr/>
							<br/>
								<a href="#">���ֹ�������</a><br/><br/>
								<a href="#">ȯ�ҰԽ���</a><br/><br/>
								<div id="plusfriend-chat-button"></div><br/>
								<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
								<script type='text/javascript'>
										    Kakao.init('b5e745a340ec3959a1b015bdb9699746');
										    Kakao.PlusFriend.createChatButton({
										    	  container: '#plusfriend-chat-button',
										    	  plusFriendId: '_xajLCT' 
										    });										  
								</script>
								
							
						</div>
					</div>
					<br/><hr/>
				<div class="copyright">
						<a href="#" >Back to Top</a><br/><br/>
					&copy; T-GET. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Coverr</a>. Video: <a href="https://coverr.co">Coverr</a>.
				<br/><br/>
				</div>
				
				</div>
			</div>
			</footer>	