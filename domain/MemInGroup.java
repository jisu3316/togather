package team1.togather.domain;

public class MemInGroup {
	private long gSeq;
	private long mNum;
	private long grade;
	
	public MemInGroup() {}
	public MemInGroup(long gSeq, long mNum, long grade) {
		super();
		this.gSeq = gSeq;
		this.mNum = mNum;
		this.grade = grade;
	}
	public long getgSeq() {
		return gSeq;
	}
	public void setgSeq(long gSeq) {
		this.gSeq = gSeq;
	}
	public long getmNum() {
		return mNum;
	}
	public void setmNum(long mNum) {
		this.mNum = mNum;
	}
	public long getGrade() {
		return grade;
	}
	public void setGrade(long grade) {
		this.grade = grade;
	}
	
}
