package team1.togather.domain;

import java.sql.Date;

public class GroupTab {
	private long gSeq;
	private String gLoc;
	private String gName;
	private String gIntro;
	private String interest;
	private int limit;
	private Date rdate;
	private long mNum;
	private String fname;
	
	public GroupTab(long gSeq, String gLoc, String gName, String gIntro, String interest, int limit, Date rdate,
			long mNum, String fname) {
		super();
		this.gSeq = gSeq;
		this.gLoc = gLoc;
		this.gName = gName;
		this.gIntro = gIntro;
		this.interest = interest;
		this.limit = limit;
		this.rdate = rdate;
		this.mNum = mNum;
		this.fname = fname;
	}
	public GroupTab(long gSeq, String gLoc, String gName, String gIntro, int limit, String fname) {
		super();
		this.gSeq = gSeq;
		this.gLoc = gLoc;
		this.gName = gName;
		this.gIntro = gIntro;
		this.limit = limit;
		this.fname = fname;
	}

	public long getgSeq() {
		return gSeq;
	}

	public void setgSeq(long gSeq) {
		this.gSeq = gSeq;
	}

	public String getgLoc() {
		return gLoc;
	}

	public void setgLoc(String gLoc) {
		this.gLoc = gLoc;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public String getgIntro() {
		return gIntro;
	}

	public void setgIntro(String gIntro) {
		this.gIntro = gIntro;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public long getmNum() {
		return mNum;
	}

	public void setmNum(long mNum) {
		this.mNum = mNum;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	
}