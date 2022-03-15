package com.tget.service.ticket.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tget.common.domain.Search;
import com.tget.service.ticket.TicketDao;
import com.tget.service.ticket.TicketService;
import com.tget.service.ticket.domain.SellProb;
import com.tget.service.ticket.domain.Ticket;

@Service("ticketServiceImpl")
public class TicketServiceImpl implements TicketService {
	
	@Autowired
	@Qualifier("ticketDaoImpl")
	private TicketDao ticketDao;
	
	public void setTicketDao(TicketDao ticketDao) {
		this.ticketDao = ticketDao;
	}
	
	public TicketServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public void addTicket(Ticket ticket) throws Exception {
		// TODO Auto-generated method stub
		ticketDao.insertTicket(ticket);
	}

	@Override
	public void updateTicketCode(Ticket ticket) throws Exception {
		// TODO Auto-generated method stub
		ticketDao.updateTicketCode(ticket);
	}

	@Override
	public void updateTicketAmount(Ticket ticket) throws Exception {
		// TODO Auto-generated method stub
		ticketDao.updateTicketAmount(ticket);
	}

	@Override
	public Ticket getTicket(int ticketNo) throws Exception {
		// TODO Auto-generated method stub
		return ticketDao.selectTicket(ticketNo);
	}
	
	

	@Override
	public Map<String, Object> getTicketList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Ticket> list = ticketDao.selectListTicket(search);				
		SellProb sellProb = ticketDao.selectSellProb(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("sellProb", sellProb);
		
		return map;
	}

	@Override
	public SellProb getTicketSellProb(Search search, int price) throws Exception {
		// TODO Auto-generated method stub
		SellProb sellProb = ticketDao.selectSellProb(search);
		
		if( price <= sellProb.getLowPrice() ) {
			sellProb.setSellprob(0);
		}else if( sellProb.getLowPrice()< price && price <= sellProb.getAvgPrice()) {
			sellProb.setSellprob(1);
		}else if( sellProb.getAvgPrice()< price && price <= sellProb.getHighPrice()){
			sellProb.setSellprob(2);
		}else {
			sellProb.setSellprob(3);
		}
			
		return sellProb;
	}

	@Override
	public SellProb getTicketPrice(String eventId) throws Exception {
		// TODO Auto-generated method stub
		
		Search search = new Search();
		search.setSearchCondition("0");
		search.setSearchKeyword(eventId);
				
		SellProb sellProb = ticketDao.selectSellProb(search);
		
		return sellProb;
	}

}
