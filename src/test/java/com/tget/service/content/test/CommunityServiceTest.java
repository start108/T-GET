package com.tget.service.content.test;

import java.io.BufferedReader;
import java.sql.Clob;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tget.common.domain.Search;
import com.tget.service.community.CommunityService;
import com.tget.service.community.domain.Content;
import com.tget.service.community.domain.Reply;
import com.tget.service.community.domain.Report;

/*
 *	FileName :  UserServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { 
									"classpath:config/context-common.xml",
									"classpath:config/context-aspect.xml",
									"classpath:config/context-mybatis.xml",
									"classpath:config/context-transaction.xml" })
public class CommunityServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;

/////////////////testaddContent////////////////////////////////
	//@Test
	public void testAddContent() throws Exception {
		
		
		Content content = new Content();
//		Clob clob = new Clob();
//		Object c = null;
//		
//		if(content.getContentBody() instanceof java.sql.Clob) {
//			c = 
//		}
		content.setUserId("admin");
		content.setUserNickname("�������ھ�");
		content.setContentName("�Խñ�");
		content.setContentBody("sdafsdafasadfasdfdsa");
		content.setBoardCode("1");
		content.setContentCode("2");
		content.setOpen("1");

		communityService.addContent(content);
}
//////////////////////////////////////////////////////////////////	
///////////////////testAddReport//////////////////////////
	@Test
	public void testAddReport() throws Exception{
		
		Report report = new Report();
		
		report.setWhiteId("admin");
		report.setWhiteNickname("�������ھ�");
		report.setBlackId("manager");
		report.setReportReasonCode("1");
		report.setContentNo(10002);
		report.setCheck("1");
		report.setReportCode("1");
		System.out.println("@@@@@@@@"+report);
		communityService.addReport(report);
	}
///////////////////////////////////////////////////////////	
////////////////////testAddReply/////////////////////////
//	@Test
	public void testAddReply() throws Exception {
	
		Reply reply = new Reply();
		
		reply.setUserId("admin");
		reply.setUserNickName("�������ھ�");
		reply.setContentNo(10002);
		reply.setReplyBody("���ø��ø��ø���");
		System.out.println("!!!!!!!!"+reply);
		communityService.addReply(reply);	
}
////////////////////////////////////////////////////////
///////////////testGetContent/////////////////////
	//@Test
	public void testGetContent() throws Exception {
		
		Content content = new Content();

		content = communityService.getContent(10002);

		System.out.println(content);
		
		Assert.assertEquals(10002, content.getContentNo());
		Assert.assertNotNull(communityService.getContent(10003));
	}	

//////////////////////////////////////////////////////////
	/////////////testUpdateContent//////////////////////// CLOB......
	//@Test
	 public void testUpdateContent() throws Exception{

		Content content = communityService.getContent(10002);
		Assert.assertNotNull(content);
	
		Assert.assertEquals(10002, content.getContentNo());
		Assert.assertEquals("�Խñ�", content.getContentName());
		Assert.assertEquals("�Խñ�", content.getContentBody());////null�� ���;;;;;;;;;;;
		//Assert.assertEquals(

		content.setContentName("�Խñ۰Խñ۰Խñ�");
		//content.setContentBody("�Խñ۰Խñ۰Խñ�");////null�� ���;;;;;;;;;;;
		
		communityService.updateContent(content);
		content = communityService.getContent(10002);
			
		Assert.assertEquals("�Խñ۰Խñ۰Խñ�", content.getContentName());
		Assert.assertEquals("�Խñ۰Խñ۰Խñ�", content.getContentBody());////null�� ���;;;;;;;;;;;
	 }
//////////////////////////////////////////////////////////
	 //////////////testDeleteContent////////////////////// content�� �ʿ���� reply�� �ʿ��ҰŰ��� Test�ʿ� 
	//@Test
//			public void deleteContent() throws Exception {
//
//				communityService.deleteContent(10002);
//	}

//////////////////////////////////////////////////////////
	 //////////////testselectListContent//////////////////////
	 //@Test
	 public void selectListContent() throws Exception{
		 
	 	Search search = new Search();
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	Map<String,Object> map = communityService.getContentList(search);
	 	
	 	List<Object> list = (List<Object>)map.get("list");
	 	Assert.assertEquals(3, list.size());
	 	
	 	Integer totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	
	 	search.setCurrentPage(1);
	 	search.setPageSize(3);
	 	search.setSearchCondition("0");
	 	search.setSearchKeyword("");
	 	map = communityService.getContentList(search);
	 	
	 	totalCount = (Integer)map.get("totalCount");
	 	System.out.println(totalCount);
	 }
}