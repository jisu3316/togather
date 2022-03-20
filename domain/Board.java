package team1.togather.domain;

import java.sql.Date;

public class Board {
	private long bnum;
	private String bcategory;
	private String btitle;
	private long mnum;
	private String mname;
	private String bcontent;
	private String bfile;
	private long blike;
	private long bview;
	private Date rdate;
	public Board(long bnum, String bcategory, String btitle, long mnum, String mname, String bcontent, String bfile, long blike,
			long bview, Date rdate) {
		super();
		this.bnum = bnum;
		this.bcategory = bcategory;
		this.btitle = btitle;
		this.mnum = mnum;
		this.bcontent = bcontent;
		this.bfile = bfile;
		this.blike = blike;
		this.bview = bview;
		this.rdate = rdate;
		this.mname = mname;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public long getBnum() {
		return bnum;
	}
	public void setBnum(long bnum) {
		this.bnum = bnum;
	}
	public String getBcategory() {
		return bcategory;
	}
	public void setBcategory(String bcategory) {
		this.bcategory = bcategory;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public long getMnum() {
		return mnum;
	}
	public void setMnum(long mnum) {
		this.mnum = mnum;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBfile() {
		return bfile;
	}
	public void setBfile(String bfile) {
		this.bfile = bfile;
	}
	public long getBlike() {
		return blike;
	}
	public void setBlike(long blike) {
		this.blike = blike;
	}
	public long getBview() {
		return bview;
	}
	public void setBview(long bview) {
		this.bview = bview;
	}
	
}
