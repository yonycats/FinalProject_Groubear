package kr.or.ddit.comm.alarm.mapper;

import java.util.List;

import kr.or.ddit.comm.alarm.vo.AlarmVO;

public interface IAlarmMapper {

	public List<AlarmVO> selectList(AlarmVO alarmVO);

	public void insertAlarm(AlarmVO alarmVO);

	public List<AlarmVO> countList();

	public int alarmRemove(int alarmNo);


}
