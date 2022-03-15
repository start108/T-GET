package com.tget.web.community;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tget.common.domain.Page;
import com.tget.common.domain.Search;
import com.tget.service.community.CommunityService;
import com.tget.service.community.domain.Content;
import com.tget.service.community.domain.Reply;
import com.tget.service.community.domain.Report;
import com.tget.service.event.EventService;
import com.tget.service.event.domain.Event;
import com.tget.service.event.domain.RecommEvent;
import com.tget.service.transaction.TranService;
import com.tget.service.user.UserService;
import com.tget.service.user.domain.User;

@Controller
@RequestMapping("/community/*")
public class CommuityController {

		///Field
		@Autowired
		@Qualifier("communityServiceImpl")
		private CommunityService communityService;
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		@Autowired
		@Qualifier("tranServiceImpl")
		private TranService tranService;
		@Autowired
		@Qualifier("eventServiceImpl")
		private EventService eventService;
			
		public CommuityController(){
			System.out.println(this.getClass());
		}
		
		@Value("#{commonProperties['pageUnit']}")
		//@Value("#{commonProperties['pageUnit'] ?: 3}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		//@Value("#{commonProperties['pageSize'] ?: 2}")
		int pageSize;
		
		@Value("#{commonProperties['videoPath']}")
		String videoPath;
		//@Value("#{commonProperties['fileroot']}")
		//String fileroot;
		
		
		
		@RequestMapping(value="addContent", method=RequestMethod.GET)
		public String addContent() throws Exception {

			System.out.println("community/addContent: GET");
			
			return "forward:/community/addContent.jsp";
		}
		
		@RequestMapping(value="addContent", method=RequestMethod.POST)
		public String addContent(@RequestParam(value = "file", required = false) MultipartFile multipartFile, @ModelAttribute("content") Content content, Model model) throws Exception {
			//, @RequestParam("file") MultipartFile file
			System.out.println("community/addContent: POST");
			
			//Business Logic
			if (multipartFile!=null) {
			
				System.out.println(multipartFile.getOriginalFilename( ));
				
				File file = null;
						
				if(!multipartFile.isEmpty()) {
					content.setVideoName(multipartFile.getOriginalFilename( ));
							
					file = new File(videoPath,multipartFile.getOriginalFilename());
					FileCopyUtils.copy(multipartFile.getBytes(), file);
					
				}
				
				if(content.getContentCode().equals("7")) {
					content.setRefundCheck("1");
				}
				
				model.addAttribute("videoName",content.getVideoName());
			}
			communityService.addContent(content);
			
			if(content.getContentCode().equals("8")||content.getContentCode().equals("9")||content.getContentCode().equals("10")||content.getContentCode().equals("11")) {
				return "redirect:/community/getContentList?searchCondition=3";
			}else {
				return "redirect:/community/getContentList?searchCondition=2&searchKeyword="+content.getContentCode();
		}
		}
		
		@RequestMapping(value="addReport", method=RequestMethod.GET)
		public String addReport(@RequestParam("contentNo") int contentNo, @ModelAttribute("content") Content content, Model model, Report report) throws Exception {

			System.out.println("community/addReport: GET");
			
			Content content1 = communityService.getContent(contentNo);
			
			model.addAttribute("content", content1);
			
			return "forward:/community/addReport.jsp";
		}
		
		@RequestMapping(value="addReport", method=RequestMethod.POST)
		public String addReport(@ModelAttribute("report") Report report, HttpSession session, Search search) throws Exception {

			System.out.println("community/addReport: POST");
			//User user = userService.getUser("userId");
			
			System.out.println("report////////////"+report);
		
			communityService.addReport(report);
			
			User user = (User)session.getAttribute("user");			
			String role = user.getRole();
			session.setAttribute("search", search);
			
			Content content = communityService.getContent(report.getContentNo());
			
			if(role.equals("2")) {
				return "forward:/community/getReportList";
			}else {
				return "forward:/community/getContentList?searchCondition=2&searchKeyword="+content.getContentCode();
			}
			
		}

		@RequestMapping(value="getContent")// View�� ��û ��� ���� 
		public String getContent( @RequestParam("contentNo") int contentNo , Model model) throws Exception {
			
			System.out.println("/community/getContent: GET");
			
			Content content = communityService.getContent(contentNo);
			
			//Model��ü�� �̿��ؼ� View�� ������ ����
			
			model.addAttribute("content", content);
			model.addAttribute("reply", new Reply());
			
			return "forward:/community/getContent.jsp";
		}
	
		@RequestMapping(value="updateContent" , method= RequestMethod.GET)
		public String updateContent( @RequestParam("contentNo") int contentNo , Model model) throws Exception{

			System.out.println("/community/updateContent: GET");
			//Business Logic			
			
			model.addAttribute("content", communityService.getContent(contentNo));
			
			return "forward:/community/updateContent.jsp";
		}
		
		@RequestMapping(value="updateContent" , method= RequestMethod.POST)
		public String updateContent( @ModelAttribute("content") Content content, Model model) throws Exception{
			
			System.out.println("/community/updateContent: POST");
			//Business Logic			
			communityService.updateContent(content);
			
			model.addAttribute("content", content);
			
			return "redirect:/community/getContent?contentNo="+content.getContentNo();
		}
	
		@RequestMapping(value="getContentList")
		public String getContentList( @ModelAttribute("search") Search search , Model model , Content content, HttpServletRequest request) throws Exception{
			
			System.out.println("/community/getContentList: GET/ POST");

			// Business logic
			Map<String , Object> map=communityService.getContentList(search);
			
			// Model and View 
			model.addAttribute("list", map.get("list"));
			model.addAttribute("totalCount", map.get("totalCount"));
			model.addAttribute("search", search);
			
			if(search.getSearchCondition().equals("3")) {
				return "forward:/community/getQuestionList.jsp";
			}else if(search.getSearchCondition().equals("2")&&search.getSearchKeyword().equals("7")){
				return "forward:/community/getRefundList.jsp";
			}else {
				return "forward:/community/getContentList.jsp";
			}
		}

		@RequestMapping(value="getReportList")
		public String getReportList(  @ModelAttribute("search") Search search , User user, Report report, Model model , HttpServletRequest request, HttpSession session) throws Exception{
			
			System.out.println("/community/getReportList: GET/ POST");
			
			// Business logic
			Map<String , Object> map=communityService.getReportList(search);
								
			System.out.println(map);
			
			// Model and View 
			model.addAttribute("list", map.get("list"));
			model.addAttribute("totalCount", map.get("totalCount"));
			model.addAttribute("search", search);
			
			return "forward:/community/getReportList.jsp";
		}
		
		@RequestMapping(value="getRefundList")
		public String getRefundList( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
			
			System.out.println("/community/getRefundList: GET/ POST");

			// Business logic
			Map<String , Object> map=communityService.getRefundList(search);
			
			// Model and View 
			model.addAttribute("list", map.get("list"));
			model.addAttribute("totalCount", map.get("totalCount"));
			model.addAttribute("search", search);
			
			return "forward:/community/getRefundList.jsp";
		}
		
		// �Ű� ����Ʈ���� ���� �� ������Ʈ�� ������
		@RequestMapping(value="addBlack")
		public String addBlack(@RequestParam("reportNo") int reportNo) throws Exception {
			
			System.out.println("@@�Ǿ���ϴ��϶�");
			Report report = communityService.getReport(reportNo);
			User user = userService.getUser(report.getBlackId());	
			userService.addBlacklist(user);
			
			report.setCheck("0");
			communityService.updateReport(report);
			System.out.println("@@@@@@@/////////"+report);
			System.out.println("@@@@@@@@@@@@@@@��...��....");
			
			return "forward:/user/listUser";
		}
		//ȯ�� �Խ��� ȯ�� ���� ���� ó��
		@RequestMapping(value="updateRefund")
		public String updateRefund(@RequestParam("contentNo") int contentNo, Model model) throws Exception{
			
			System.out.println("/community/updateRefund");
			//Business Logic			
			Content refundContent = communityService.getContent(contentNo);
			
			// refundTranNo : ȯ�� �ŷ� ��ȣ, refundCheck : ȯ�� ���� ���� ...update �ʿ�..
			
			refundContent.setRefundCheck("0");
			communityService.updateRefund(refundContent);
			System.out.println(refundContent);
		
			return "forward:/community/getRefundList";
		}
		
		@RequestMapping(value="getSearchLoad")
		public String getSearchLoad(Model model) throws Exception{
			
			System.out.println("/community/getSearchLoad");
			List<Event> list = eventService.getAllLocation();
			
			
			model.addAttribute("list", list);
			
			return "forward:/community/getSearchLoad.jsp";
		}
		
	}