package com.tget.service.alarm;

import java.util.List;

import com.tget.common.domain.Search;
import com.tget.service.alarm.domain.Alarm;

public interface AlarmDao {
	
	public void insertAlarm(Alarm alarm) throws Exception;
	
	public int selectNoReadAlarmCount(String userId) throws Exception;

	public List<Alarm> selectListAlarm(Search search) throws Exception;
	
	public int selectTotalCount(Search search) throws Exception;
	
	public void deleteAlarm(int alarmNo) throws Exception;
	
	public void updateAlarmRead(int alarmNo) throws Exception;
	
}
