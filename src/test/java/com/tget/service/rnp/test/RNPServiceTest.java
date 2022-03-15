package com.tget.service.rnp.test;

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
import com.tget.service.event.EventService;
import com.tget.service.event.domain.Category;
import com.tget.service.event.domain.Event;
import com.tget.service.event.domain.RecommEvent;
import com.tget.service.rnp.RNPService;
import com.tget.service.rnp.domain.PointHistory;
import com.tget.service.rnp.domain.Review;
import com.tget.service.user.domain.User;



/*
 *	FileName :  EventServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data �� �پ��ϰ� Wiring ����...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })
//@ContextConfiguration(locations = { "classpath:config/context-common.xml" })
public class RNPServiceTest {

	//==>@RunWith,@ContextConfiguration �̿� Wiring, Test �� instance DI
	@Autowired
	@Qualifier("rNPServiceImpl")
	private RNPService rNPService;

	
	@Test
	public void addReview() throws Exception {

		User user = new User();
		user.setUserId("buyer");
		user.setPoint(500000);
		rNPService.updatePoint(user);
		
	}
	
	//@Test
	public void addPoint() throws Exception {
		PointHistory pointHistory = new PointHistory();
		pointHistory.setPointUpdateCode("1");
		pointHistory.setTotalPoint(500);
		pointHistory.setTranNo(10003);
		pointHistory.setUpdatePoint(1000);
		pointHistory.setUserId("buyer");
		rNPService.addPoint(pointHistory);

	}
	
	//@Test
	public void getPointHistory() throws Exception {
			
		System.out.println(rNPService.getPointHistory("buyer"));		
	}
		
	//@Test
	public void getReviewList() throws Exception {
			
		System.out.println(rNPService.getReviewList("buyer"));		
			
	}
		
	//@Test
	public void getSellerEstimationList() throws Exception {
			
		System.out.println(rNPService.getSellerEstimationList("seller"));		

	}
		
	//@Test
	public void updateReview() throws Exception {
		Review review = new Review();
		review.setReviewBody("���� �����̿�!!");
		review.setScore(4);
		review.setTranNo(10000);
		rNPService.updateReview(review);		
	}
				
	//@Test
	public void getReview() throws Exception {
			
		System.out.println(rNPService.getReview(10000));
	
	}
		
}