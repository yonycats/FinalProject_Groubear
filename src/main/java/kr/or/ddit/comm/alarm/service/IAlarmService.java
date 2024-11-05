package kr.or.ddit.comm.alarm.service;

import java.util.List;

import kr.or.ddit.comm.alarm.vo.AlarmVO;

public interface IAlarmService {

	public List<AlarmVO> selectList(AlarmVO alarmVO);

	public void insertAlarm(AlarmVO alarmVO);

	public int countList(int count);

}
