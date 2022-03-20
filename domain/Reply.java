package team1.togather.domain;

import java.sql.Date;

public class Reply {
   private long rseq;
   private long bnum;
   private String mname;
   private long mnum;
   private String content;
   private long r_like;
   private Date rdate;
   private long lev;
   
   public Reply() {}
   public Reply(long rseq, long bnum, String mname, long mnum, String content, long r_like, Date rdate, long lev) {
      super();
      this.rseq = rseq;
      this.bnum = bnum;
      this.mname = mname;
      this.mnum = mnum;
      this.content = content;
      this.r_like = r_like;
      this.rdate = rdate;
      this.lev = lev;
   }

   public long getRseq() {
      return rseq;
   }

   public void setRseq(long rseq) {
      this.rseq = rseq;
   }

   public long getBnum() {
      return bnum;
   }

   public void setBnum(long bnum) {
      this.bnum = bnum;
   }

   public String getMname() {
      return mname; 
   }

   public void setMname(String mname) {
      this.mname = mname;
   }

   public long getMnum() {
      return mnum;
   }

   public void setMnum(long mnum) {
      this.mnum = mnum;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public long getR_like() {
      return r_like;
   }

   public void setR_like(long r_like) {
      this.r_like = r_like;
   }

   public Date getRdate() {
      return rdate;
   }

   public void setRdate(Date rdate) {
      this.rdate = rdate;
   }

   public long getLev() {
      return lev;
   }

   public void setLev(long lev) {
      this.lev = lev;
   }

   
   

}
