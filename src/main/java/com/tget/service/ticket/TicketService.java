package com.tget.service.ticket;

import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.ticket.domain.SellProb;
import com.tget.service.ticket.domain.Ticket;

public interface TicketService {
	
	public void addTicket(Ticket ticket) throws Exception;
	
	public void updateTicketCode(Ticket ticket) throws Exception;
	
	public void updateTicketAmount(Ticket ticket) throws Exception;
	
	public Ticket getTicket(int ticketNo)	throws Exception;
	
	/*
		searchCondition event,user searchKeyword eventId, userID
		Return list,highPrice,lowPrice,totalCount
	*/
	
	public Map<String,Object> getTicketList(Search search)	throws Exception;
	
	public SellProb getTicketSellProb(Search search, int price) throws Exception;
		
	public SellProb getTicketPrice(String eventId) throws Exception;
}
