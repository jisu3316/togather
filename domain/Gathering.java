package team1.togather.domain;

public class Gathering {
	private long ga_seq;
	private String ga_name;
	private String ga_date;
	private String time;
	private String ga_place;
	private String price;
	private int ga_limit;
	private long gSeq;
	
	public Gathering(long ga_seq, String ga_name, String ga_date, String time, String ga_place, String price,
			int ga_limit, long gSeq) {
		super();
		this.ga_seq = ga_seq;
		this.ga_name = ga_name;
		this.ga_date = ga_date;
		this.time = time;
		this.ga_place = ga_place;
		this.price = price;
		this.ga_limit = ga_limit;
		this.gSeq = gSeq;
	}
	
	public Gathering(long ga_seq, String ga_name, String ga_place, String price, int ga_limit) {
		super();
		this.ga_seq = ga_seq;
		this.ga_name = ga_name;
		this.ga_place = ga_place;
		this.price = price;
		this.ga_limit = ga_limit;
	}

	public long getGa_seq() {
		return ga_seq;
	}
	public void setGa_seq(long ga_seq) {
		this.ga_seq = ga_seq;
	}
	public String getGa_name() {
		return ga_name;
	}
	public void setGa_name(String ga_name) {
		this.ga_name = ga_name;
	}
	public String getGa_date() {
		return ga_date;
	}
	public void setGa_date(String ga_date) {
		this.ga_date = ga_date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getGa_place() {
		return ga_place;
	}
	public void setGa_place(String ga_place) {
		this.ga_place = ga_place;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getGa_limit() {
		return ga_limit;
	}
	public void setGa_limit(int ga_limit) {
		this.ga_limit = ga_limit;
	}
	public long getgSeq() {
		return gSeq;
	}
	public void setgSeq(long gSeq) {
		this.gSeq = gSeq;
	}
	
}
