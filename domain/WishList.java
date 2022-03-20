package team1.togather.domain;

public class WishList {
	private long wseq;
	private long mnum;
	private long gseq;
	private int flag;
	public WishList(long wseq, long mnum, long gseq, int flag) {
		super();
		this.wseq = wseq;
		this.mnum = mnum;
		this.gseq = gseq;
		this.flag = flag;
	}
	public long getWseq() {
		return wseq;
	}
	public void setWseq(long wseq) {
		this.wseq = wseq;
	}
	public long getMnum() {
		return mnum;
	}
	public void setMnum(long mnum) {
		this.mnum = mnum;
	}
	public long getGseq() {
		return gseq;
	}
	public void setGseq(long gseq) {
		this.gseq = gseq;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	
}
