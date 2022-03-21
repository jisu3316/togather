package team1.togather.service;

import java.util.List;

import team1.togather.domain.BoardCriteria;
import team1.togather.domain.Member;
import team1.togather.domain.QandA;
import team1.togather.domain.Qreply;

public interface QandA_Service {
	public List<QandA> listPage(int page); //특정페이지 글정보확인
	public List<QandA> listCri(BoardCriteria cri); // 페이징처리(cri객체사용)
	public Integer pageCount(); //db테이블 모든글 개수 계산 후 리턴
	
	List<QandA> QAlist();
	QandA qaContent(QandA qanda);
	List<Qreply> qreplyList(QandA qanda);//qna 댓글 리스트
	List<Member> qaNameList();//qna 작성자 목록
	void qaCreate(QandA qanda);//qna 작성
	QandA createqaInfo(QandA qanda);//qna만들고 그 작성글로 이동하는
	
	
}

