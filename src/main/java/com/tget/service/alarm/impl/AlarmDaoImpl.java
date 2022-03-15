package com.tget.service.alarm.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tget.common.domain.Search;
import com.tget.service.alarm.AlarmDao;
import com.tget.service.alarm.domain.Alarm;

@Repository("alarmDaoImpl")
public class AlarmDaoImpl implements AlarmDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public AlarmDaoImpl() {
		// TODO Auto-generated constructor stub
		System.out.println(this.getClass());
	}

	@Override
	public void insertAlarm(Alarm alarm) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("AlarmMapper.insertAlarm", alarm);
	}

	@Override
	public int selectNoReadAlarmCount(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AlarmMapper.selectNoReadAlarmCount", userId);
	}

	@Override
	public List<Alarm> selectListAlarm(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("AlarmMapper.selectListAlarm", search);
	}

	@Override
	public int selectTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AlarmMapper.selectTotalCount", search);
	}

	@Override
	public void deleteAlarm(int alarmNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("AlarmMapper.deleteAlarm", alarmNo);
	}

	@Override
	public void updateAlarmRead(int alarmNo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("AlarmMapper.updateAlarmRead", alarmNo);
	}

}
