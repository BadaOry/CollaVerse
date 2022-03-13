package com.collaverse.mvc.schedule.mapper;

import java.util.List;

import com.collaverse.mvc.schedule.model.ScheduleVO;

public interface ScheduleMapper {

	public List<ScheduleVO> showSchedule();
	
	public void addSchedule(ScheduleVO vo);
	
	public ScheduleVO getSchedule(int no);
	
	public int deleteSchedule(int no);
}
