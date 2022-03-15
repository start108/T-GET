package com.tget.web.user;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTML;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tget.service.user.Config;
import com.tget.service.user.UserService;
import com.tget.service.user.domain.User;



//==> ȸ������ RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}
	
	
	
	@RequestMapping(value= "json/sendSms", method=RequestMethod.POST ) 
	public Map<String,Object> sendSms(String receiver)throws Exception { 
	
		Map<String,Object> map = new HashMap<String,Object>();
		
		System.out.println("�߳�?");
		
		System.out.println(receiver+"��ȣ �� ��Գ�?");
		
		int rand = (int) (Math.random() * 899999) + 100000; 
		System.out.println(rand+"������ȣ �ӳ�");
		  String hostname = "api.bluehouselab.com";
	        String url = "https://"+hostname+"/smscenter/v1.0/sendsms";

	        CredentialsProvider credsProvider = new BasicCredentialsProvider();
	        credsProvider.setCredentials(
	            new AuthScope(hostname, 443, AuthScope.ANY_REALM),
	            new UsernamePasswordCredentials(Config.appid, Config.apikey));
	        
	        // Create AuthCache instance
	        AuthCache authCache = new BasicAuthCache();
	        authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

	        // Add AuthCache to the exe.put(new Hecution context
	        HttpClientContext context = HttpClientContext.create();
	        context.setCredentialsProvider(credsProvider);
	        context.setAuthCache(authCache);
	    
	        DefaultHttpClient client = new DefaultHttpClient();

	        try {
	            HttpPost httpPost = new HttpPost(url);
	            httpPost.setHeader("Content-type", "application/json; charset=EUC-KR");
	            String json = "{\"sender\":\""+Config.sender+"\",\"receivers\":[\""+receiver+"\"],\"content\":\""+rand+"\"}";
	            
	            StringEntity se = new StringEntity(json, "EUC-KR");
	            httpPost.setEntity(se);
	       
	            HttpResponse httpResponse = client.execute(httpPost, context);
	         
	            System.out.println(httpResponse.getStatusLine().getStatusCode());
	       
	            InputStream inputStream = httpResponse.getEntity().getContent();
	            if(inputStream != null) {
	                BufferedReader bufferedReader = new BufferedReader( new InputStreamReader(inputStream));
	                String line = "";
	                while((line = bufferedReader.readLine()) != null)
	                inputStream.close();
	            }
	        } catch (Exception e) {
	            System.err.println("Error: "+e.getLocalizedMessage());
	        } finally {
	            client.getConnectionManager().shutdown();
	        }
	        
	        map.put("rand", String.valueOf(rand));
	        
	        return map;
	}  
	
	@RequestMapping( value="json/finduserId" , method=RequestMethod.POST)
	public Map<String, Object> finduserId (String userName, String phone)throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		User user = userService.finduserId(phone);
		
		String checkName =user.getUserName();
		
		String Id = user.getUserId();
		
		System.out.println(userName+"�� �Ƴ�");
		
		System.out.println( checkName+"���� �� �߸��ߴ���?");
		
		if (checkName.equals(userName)){
			
			map.put("msg","yes");
			map.put("Id", Id);
		}
		
		
		else {
			
			map.put("msg","no");
			
			return map;
		}
		return map;
	}      
	
	@RequestMapping( value="json/findPassword" , method=RequestMethod.POST)
	public String findPassword (String userId, String phone)throws Exception{
		
		System.out.println("���Դ�"); 
		
		User user = userService.finduserId(phone);
		
		System.out.println("user�� ����"+user);
		System.out.println(userId+"���̵� �����");
		
		if (user==null){
			return "no";
		}else {
		return "yes";
		}
	}    
	

	@RequestMapping(value = "json/checknickNameDuplication", method=RequestMethod.POST)
	public boolean checknickNameDuplication(@RequestBody User user)throws Exception{
		
		System.out.println("/cafe/json/checknickNameDuplication : POST");
		
		boolean result = userService.checknickNameDuplication(user.getNickName());

		System.out.println("�ɱ�?"+result);
		
		return result;
		
	}
	
	@RequestMapping(value = "json/checkuserIdDuplication", method=RequestMethod.POST)
	public boolean checkuserIdDuplication(@RequestBody User user)throws Exception{
		
		System.out.println("/cafe/json/checknickNameDuplication : POST");
		
		boolean result = userService.checkuserIdDuplication(user.getUserId());

		System.out.println("�ɱ�?"+result);
		
		return result;
		
	}
	
	@RequestMapping(value = "json/checkcodeDuplication", method=RequestMethod.POST)
	public boolean checkcodeDuplication(@RequestBody User user)throws Exception{
		
		System.out.println("/user/json/checkcodeDuplication : POST");
		
		boolean result = userService.checkcodeDuplication(user.getCode());

		System.out.println("�ɱ�?"+result);
		
		return result;
		
	}
	@RequestMapping( value="json/login")
	public Map<String,Object> login(String userId, Model model) throws Exception{
		
		System.out.println("/user/json/login : POST");
		//Business Logic
		Map<String,Object> map = new HashMap<String,Object>();
		User user = userService.getUser(userId);
		
		
		System.out.println("����"+user);
		if (user==null){
			map.put("msg",  "no");
			return map;
		}
		
		System.out.println("���� ���Դ�?"+user);
		map.put("dbPwd",  user.getPassword());
		Date today = new Date ();
		Date end = user.getBlacklistEndDate();
		
		System.out.println("������"+today);
		System.out.println("���� ������Ʈ����"+end);
	
	
		
		if( end != null  &&
				today.getTime() <= end.getTime() ) {
			
//			model.addAttribute("user", user);
			map.put("msg", "true");
			map.put("nickName", user.getNickName()+"���� ������Ʈ�Դϴ�.");
			map.put("startDate", user.getBlacklistStartDate().toLocaleString());
			map.put("endDate", user.getBlacklistEndDate().toLocaleString());
	
			System.out.println("������?"+user.getBlacklistEndDate());
			System.out.println(user);
				System.out.println("�̻�Ű ���̴�");
				
				return map;
		}
		else {
			map.put("msg", "false");
			return map;
		}

	}
	@RequestMapping(value = "rest/mailSender")
	public Map<String,Object> mailSender(String Email , String emailcode, HttpServletRequest request, ModelMap mo, HttpSession session2) throws Exception {
	
		
		System.out.println("�̸��� ���� ���Դ�"+Email);
		Map<String,Object> map = new HashMap<String,Object>();
		User user = new User();
		
		 user = userService.getUser(Email);
		
		 System.out.println(user+"���� ������?");
		
		 if(user !=null) {
				map.put("msg", "bad");
				return map;
			}
		 
		String host = "smtp.gmail.com"; 
		
		final String username = "gogo1705";
		final String password = "qkqhsl135!"; 
	
		int port=465; //��Ʈ��ȣ 
		
		StringBuffer buffer = new StringBuffer();
		for ( int i = 0; i<= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		buffer.toString();
		String check = buffer.toString();
		// ���� ���� 
		String recipient = Email;
		//�޴� ����� �����ּҸ� �Է����ּ���.		
		String subject = "T-GET ������ȣ Ȯ�� �����Դϴ�."; //���� ���� �Է����ּ���. 
		String body = "<img src=\"/resources/images/logo.png\">"+"<hr/> T-GET �̸��� ������ȣ ["+check+"]"; //���� ���� �Է����ּ���. 
		Properties props = System.getProperties(); // ������ ��� ���� ��ü ����
		// SMTP ���� ���� ���� 
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host); 
		//Session ���� 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; 
			String pw=password; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw); } }); 
		session.setDebug(true); 
		//for debug 
		Message mimeMessage = new MimeMessage(session);
		//MimeMessage ���� 
		mimeMessage.setFrom(new InternetAddress("XXXXXXXX@naver.com")); 
		//�߽��� ���� , ������ ����� �̸����ּҸ� �ѹ� �� �Է��մϴ�. �̶��� �̸��� Ǯ �ּҸ� �� �ۼ����ּ���. 
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		//�����ڼ���  //.TO �ܿ� .CC(����) .BCC(��������) �� ���� 
		mimeMessage.setSubject(subject);//������� 
		mimeMessage.setText(body);//�������
		Transport.send(mimeMessage); //javax.mail.Transport.send() �̿� }
	
		System.out.println("������"+check);
	
		
		
	
		map.put("check", check);
		
		return map;
	}
		
	}
