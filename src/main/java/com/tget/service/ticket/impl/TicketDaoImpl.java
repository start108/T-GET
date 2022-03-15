package com.tget.service.ticket.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tget.common.domain.Search;
import com.tget.service.ticket.TicketDao;
import com.tget.service.ticket.domain.SellProb;
import com.tget.service.ticket.domain.Ticket;

@Repository("ticketDaoImpl")
public class TicketDaoImpl implements TicketDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public TicketDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void insertTicket(Ticket ticket) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("TicketMapper.insertTicket", ticket);
	}

	@Override
	public void updateTicketCode(Ticket ticket) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("TicketMapper.updateTicketCode", ticket);		
	}

	@Override
	public void updateTicketAmount(Ticket ticket) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("TicketMapper.updateTicketAmount", ticket);		
		
	}

	@Override
	public List<Ticket> selectListTicket(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("TicketMapper.selectListTicket", search);
	}

	@Override
	public Ticket selectTicket(int ticketNo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("TicketMapper.selectTicket", ticketNo);
	}

	@Override
	public SellProb selectSellProb(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("TicketMapper.selectSellProb", search);
	}

}
