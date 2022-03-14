package com.collaverse.mvc.schedule.model;

public class ScheduleVO {

	private int no;
	private int memberNo;
	private String subject;
	private String startDate;
	private String endDate;
	private String memo;
	private String color;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	@Override
	public String toString() {
		return "ScheduleVO [no=" + no + ", memberNo=" + memberNo + ", subject=" + subject + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", memo=" + memo + ", color=" + color + "]";
	}
	
	
}
