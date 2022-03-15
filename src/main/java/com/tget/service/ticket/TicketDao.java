package com.tget.service.ticket;

import java.util.List;

import com.tget.common.domain.Search;
import com.tget.service.ticket.domain.SellProb;
import com.tget.service.ticket.domain.Ticket;

public interface TicketDao {

	public void insertTicket(Ticket ticket) throws Exception;
	
	public void updateTicketCode(Ticket ticket) throws Exception;
	
	public void updateTicketAmount(Ticket ticket) throws Exception;
	
	public List<Ticket> selectListTicket(Search search) throws Exception;
	
	public Ticket selectTicket(int ticketNo) throws Exception;
	
	/*public int selectHighPrice(Search search) throws Exception;
	
	public int selectLowPrice(Search search) throws Exception;
	
	public int selectTotalCount(Search search) throws Exception;*/
	
	public SellProb selectSellProb(Search search) throws Exception;
	

}
