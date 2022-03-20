package team1.togather.domain;

public class Category {
	private long catenum;
	private String theme;
	public Category(long catenum, String theme) {
		super();
		this.catenum = catenum;
		this.theme = theme;
	}
	public long getCatenum() {
		return catenum;
	}
	public void setCatenum(long catenum) {
		this.catenum = catenum;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
}
