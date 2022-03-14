package com.collaverse.mvc.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.collaverse.mvc.schedule.mapper.ScheduleMapper;
import com.collaverse.mvc.schedule.model.ScheduleVO;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	private ScheduleMapper mapper;
	
//	@Override
//	public List<ScheduleVO> showSchedule() {
//		
//		System.out.println();
//		return mapper.showSchedule();
//	}
	
	@Override
	public void addSchedule(ScheduleVO vo) {
		mapper.addSchedule(vo);
	}

	@Override
	public ScheduleVO getSchedule(int no) {
		
		return mapper.getSchedule(no);
	}
	
	 @Override
    public ScheduleVO deleteSchedule(int no) {
        
        return mapper.deleteSchedule(no);
    }

	@Override
	public List<ScheduleVO> showSchedule(int memberNo) {
		
		System.out.println("[ServiceImpl] memberNo 잘 오는지 확인 : " + memberNo);
		
		return mapper.showSchedule(memberNo);
	}
}
