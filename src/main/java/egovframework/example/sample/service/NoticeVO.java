package egovframework.example.sample.service;

import java.util.Date;

public class NoticeVO extends SampleDefaultVO{
	private String title;
	private String testId;
	private String content;
	private String name;
	private String reg_dt;
	private String filepath;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTestId() {
		return testId;
	}
	public void setTestid(String testid) {
		this.testId = testid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	

}
