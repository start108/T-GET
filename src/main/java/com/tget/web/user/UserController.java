package com.tget.web.user;

import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tget.common.domain.Page;
import com.tget.common.domain.Search;
import com.tget.service.community.CommunityService;
import com.tget.service.community.domain.Report;
import com.tget.service.user.KakaoUserInfo;
import com.tget.service.user.UserService;
import com.tget.service.user.kakao_restapi;
import com.tget.service.user.naverUserInfo;
import com.tget.service.user.naver_restapi;
import com.tget.service.user.domain.User;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	User user = new User();
	@Autowired
	@Qualifier("userServiceImpl")
	
	private UserService userService;
		
	public UserController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="finduserId", method=RequestMethod.GET )
	public String finduserId() throws Exception{
	
		System.out.println("/user/finduserId : GET");
		
		return "redirect:/user/finduserId.jsp";
	}
	
	@RequestMapping( value="findPassword", method=RequestMethod.GET )
	public String findPassword() throws Exception{
	
		System.out.println("/user/findPassword : GET");
		
		return "redirect:/user/findPassword.jsp";
	}
	
	
	@RequestMapping( value="addUser", method=RequestMethod.GET )
	public String addUser() throws Exception{
	
		System.out.println("/user/addUser : GET");
		
		return "redirect:/user/addUser.jsp";
	}
	
	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser( @ModelAttribute("user") User user , HttpServletRequest request , HttpSession session) throws Exception {

		System.out.println("/user/addUser : POST");
		//Business Logic
		System.out.println(user.getUserId()+"���̵� ���� ���?");
		if(session.getAttribute("kakaoId")!=null) {
			System.out.println("īī�� ���� ȸ������ ���");
		user.setKakaoId((String) session.getAttribute("kakaoId"));
		}
		if(session.getAttribute("naverId")!=null) {
			System.out.println("���̹� ���� ȸ������ ���");
		user.setNaverId((String) session.getAttribute("naverId"));
		}
		
		
		userService.addUser(user);
		
		String userId = user.getUserId();
		
		user= userService.getUser(userId);
		
		session.setAttribute("user", user);
	
		return "redirect:/";
		
	}
	


	
	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}
	
	@RequestMapping( value="myPage", method=RequestMethod.GET )
	public String myPage( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		model.addAttribute("user", user);
		
		return "forward:/user/myPage.jsp";
	}
	
	
	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/user/updateUser : GET");
		User user = userService.getUser(userId);
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}

	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

		System.out.println("/user/updateUser : POST");
		//Business Logic
		
		System.out.println("user ����Գ� �Ф�"+user);
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		System.out.println("user �����?2��"+user);
		userService.updateUser(user);
		return "redirect:/user/myPage?userId="+user.getUserId();
	}
	
	@RequestMapping( value="updatePassword", method=RequestMethod.GET )
	public String updatePassword(@RequestParam("userId") String userId , @RequestParam("password") String password, Model model ) throws Exception{

		System.out.println("updatePassword ��Ʈ�ѷ�����");
	
		User user = userService.getUser(userId);
		
		user.setPassword(password);
		
		userService.updatePassword(user);
		
		model.addAttribute("user", user);
		
		
		
		return "redirect:/";
	}
	
	
	
	
	@RequestMapping( value="addblacklist", method=RequestMethod.POST )
	public String addBlacklist( @RequestParam("userId") String userId , HttpServletRequest request) throws Exception {

		System.out.println("/user/addblacklist : GET");
		
		User user = userService.getUser(userId);
		
		System.out.println(user.getUserId());
		System.out.println(user+";;'");
		userService.addBlacklist(user);

		return "redirect:/user/listUser.jsp";
		
	}
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/logon : GET");

		return "redirect:/user/loginView.jsp";
	}
	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , HttpSession session) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
		if(user.getUserId()!=null) {                                                                     
		
			if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
				}
			
		}

		return "redirect:/";
	}

	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping( value="listUser" )
	public String listUser( @ModelAttribute("search") Search search , @ModelAttribute("search") Search search2, Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUser : GET / POST");
	
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("totalCount", map.get("totalCount"));
		
		System.out.println(map.get("list")+"���� ����Ʈ ��� ���?");
		
		return "forward:/user/listUser.jsp";
	}

	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	


@RequestMapping(value = "kakaoLogin")
public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) throws Exception {
	
    System.out.println("�α��� �Ҷ� �ӽ� �ڵ尪");
    //īī�� Ȩ���������� ���� ��� �ڵ�
    System.out.println(code);
    System.out.println("�α��� �� �����");
    
    //īī�� rest api ��ü ����
    kakao_restapi kr = new kakao_restapi();
    //������� node�� �����
    JsonNode node = kr.getAccessToken(code);
    //����� ���
    System.out.println(node);
    
    JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(node.get("access_token"));
    
    JsonNode kakao_account = userInfo.path("kakao_account");
    
    String kakaoId = userInfo.path("id").asText();
    
    String token = node.path("access_token").asText();
    
    String email = null;
    
    email = kakao_account.path("email").asText();

    System.out.println("��ū ���Ͷ� ��"+token);
    
    String userId = userInfo.path("kakao_account").asText();
    
    System.out.println("id : " + kakaoId);

    System.out.println("userId"+ userId+""+email+"�̸��Ϥ���?");
    
    User user = userService.getKakao(kakaoId);
    
    		if(user != null) {


    	user = userService.getUser(user.getUserId());
    	
    	System.out.println("���� īī�� �����̳�"+user);
    	
    		user.setKakaoToken(token);
    	
			session.setAttribute("user", user);
		
				
		return "forward:/user/loginResult.jsp";
	}

    	
    	
    else {
    	
    	session.setAttribute("kakaoId", kakaoId);
    	
    	System.out.println("�ű� īī�� �����̳� ȸ���������� ������");
    	
    	return "forward:/user/loginResult.jsp";
    }
    }
    
  @RequestMapping(value = "naverLogin")
  public String naverLogin(@RequestParam("code") String code , Model model,ServletRequest request, HttpSession session) throws Exception {
	   
	    System.out.println("�ڵ� �� �ֳ�? ������?�ù���?"+code);

	    naver_restapi kr = new  naver_restapi();
	    //������� node�� �����
	    JsonNode node = kr.getAccessToken(code);
	    //����� ���
	    System.out.println("�ڵ��ֳ�?"+code);
	    
	    System.out.println("���鰨?"+node);
	    
	    JsonNode userInfo = naverUserInfo.getNaverUserInfo(node.get("access_token"));
	    
	    String naver = userInfo.toString();
	    
	    String naverId =userInfo.path("response").path("id").asText();
	    
	    
	    
	    String token = node.path("access_token").asText();

	    System.out.println("��ū ���Ͷ� ��"+token);
	    
	    System.out.println("�� ��ĳ�?"+naver);
	    
	    System.out.println("id : " + naverId);

	    User user = userService.getNaver(naverId);
	    
	    System.out.println(user+"���̹� ��������");
	    
		if(user != null) {


	user = userService.getUser(user.getUserId());
	
	System.out.println("���� ���̹� �����̳�"+user);
		
		session.setAttribute("user", user);
	
			
	return "forward:/user/loginResult.jsp";
}

	
	
else {
	
	session.setAttribute("naverId", naverId);
	
	System.out.println("�ű� ���̹� �����̳� ȸ����������~!");
	
	return "forward:/user/loginResult.jsp";
}
}
	    
  }

