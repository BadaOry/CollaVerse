package com.collaverse.mvc.schedule.service;

import java.util.List;

import com.collaverse.mvc.schedule.model.ScheduleVO;

public interface ScheduleService {

//	public List<ScheduleVO> showSchedule();
	
	public void addSchedule(ScheduleVO vo);
	
	public ScheduleVO getSchedule(int no);

	public ScheduleVO deleteSchedule(int no);
	
//    public int deleteSchedule(int no);

	public List<ScheduleVO> showSchedule(int memberNo);
}
