package com.tget.service.rnp.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tget.service.rnp.domain.PointHistory;
import com.tget.service.rnp.domain.Review;
import com.tget.service.user.domain.User;
import com.tget.common.domain.Search;
import com.tget.service.event.EventDao;
import com.tget.service.rnp.RNPDao;

@Repository("rNPDaoImpl")
public class RNPDaoImpl implements RNPDao {
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public RNPDaoImpl(){
		System.out.println(this.getClass());
	}

//	public void InsertReview(Review review) throws Exception{
//		sqlSession.insert("RNPMapper.InsertReview",review);
//	}
	//���ʿ� transaction ���̺� ���� ���� ���� Į���� ���� �ִ� �Ŷ� insert���� �� �� ����. ������ update ������������

	public List<PointHistory> selectPointHistory(String userId)  throws Exception{
		
		return sqlSession.selectList("RNPMapper.selectPointHistory",userId);
	}

	public void insertPointHistory(PointHistory pointHistory)  throws Exception{
		sqlSession.insert("RNPMapper.insertPointHistory", pointHistory);
	}
	
	public List<Review> selectReviewList(String buyerId)  throws Exception{
		//searchCondition==0 buyerId �� �˻�
		Search search = new Search();
		search.setSearchCondition("0");
		search.setSearchKeyword(buyerId);
		
		return sqlSession.selectList("RNPMapper.selectReviewList",search);
	}
	
	public List<Review> selectSellerEstimationList(String sellerId)  throws Exception{
		//searchCondition==1  sellerId �� �˻�
		Search search = new Search();
		search.setSearchCondition("1");
		search.setSearchKeyword(sellerId);
		
		return sqlSession.selectList("RNPMapper.selectReviewList",search);
	}
	
	public Review selectReview(int tranNo)  throws Exception{
		return sqlSession.selectOne("RNPMapper.selectReview",tranNo);
	}
	
	public void updateReview(Review review)  throws Exception{
		sqlSession.update("RNPMapper.updateReview",review);
	}
	
	public void updatePoint(User user) throws Exception{
		sqlSession.update("RNPMapper.updatePoint",user);
	}
	
	public int selectPointHistoryCount(String userId) throws Exception{
		return sqlSession.selectOne("RNPMapper.selectPointHistoryCount",userId);
	}
	
//	public  PointHistory selectPointHistoryByTranNo(int tranNo)  throws Exception{
//		return null;
//	}
	
	
}