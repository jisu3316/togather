package team1.togather.model;

import java.util.ArrayList;

import team1.togather.domain.Reply;

public class ReplyService {
private ReplyDAO dao;
   
   private static final ReplyService instance = new ReplyService();
   private ReplyService() {
      dao = new ReplyDAO();
   }
   public static ReplyService getInstance() {
      return instance;
   }
   public ArrayList<Reply> listS(){
		return dao.list();
	}
   public ArrayList<Reply> listS(long bnum){
		return dao.list(bnum);
	}
	public boolean insertS(Reply dto) {
		return dao.insert(dto);
	}
	public ArrayList<Reply> updateS1(long rseq){
		return dao.update1(rseq);
	}
	public boolean updateS2(Reply dto) {
		return dao.update2(dto);
	}
	public void deleteS(long rseq) {
		dao.delete(rseq);
	}
	public boolean r_likeS(Reply dto) {
		return dao.r_like(dto);
	}
	public int like_checkS(String userphone, long rseq) {
		return dao.like_check(userphone, rseq);
	}
	public void like_insertS(String userphone, long rseq) {
		dao.like_insert(userphone, rseq);
	}
	public void like_updateS(String userphone, long rseq, int flag) {
		dao.like_update(userphone, rseq, flag);
	}
}