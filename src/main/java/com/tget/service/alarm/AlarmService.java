package com.tget.service.alarm;

import java.util.Map;

import com.tget.common.domain.Search;
import com.tget.service.alarm.domain.Alarm;

public interface AlarmService {
	
	public void addAlarm(Alarm alarm) throws Exception;
	
	public int getNoReadAlarmCount(String userId) throws Exception;

	public Map<String,Object> getAlarmList(Search search) throws Exception;
	
	public void deleteAlarm(int alarmNo) throws Exception;
	
	public void updateAlarmRead(int alarmNo) throws Exception;
		
}
