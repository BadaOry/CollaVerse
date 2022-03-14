package com.collaverse.mvc.schedule.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.collaverse.mvc.schedule.model.ScheduleVO;

public interface ScheduleMapper {

//	public List<ScheduleVO> showSchedule();
	
	public void addSchedule(ScheduleVO vo);
	
	public ScheduleVO getSchedule(int no);
	
//	public int deleteSchedule(@Param("no") int no);
	
	public ScheduleVO deleteSchedule(int no);

	public List<ScheduleVO> showSchedule(@Param("memberNo") int memberNo);
}
