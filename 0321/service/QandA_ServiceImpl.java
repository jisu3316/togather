package team1.togather.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team1.togather.domain.BoardCriteria;
import team1.togather.domain.Member;
import team1.togather.domain.QandA;
import team1.togather.domain.Qreply;
import team1.togather.mapper.QandA_Mapper;

@Service
public class QandA_ServiceImpl implements QandA_Service {
	@Autowired
	private QandA_Mapper mapper;
	@Override
	public List<QandA> QAlist() {
		return mapper.QAlist();
	}
	@Override
	public QandA qaContent(QandA qanda) {
		
		return mapper.qaContent(qanda);
	}
	@Override
	public List<Qreply> qreplyList(QandA qanda) {
		return mapper.qreplyList(qanda);
	}
	@Override
	public List<Member> qaNameList() {
		// TODO Auto-generated method stub
		return mapper.qaNameList();
	}
	@Override
	public void qaCreate(QandA qanda) {
		mapper.qaCreate(qanda);
		
	}
	@Override
	public QandA createqaInfo(QandA qanda) {
		return mapper.createqaInfo(qanda);
	}
	@Override
	public List<QandA> listPage(int page) {
		if(page <= 0) {
			page = 1;
		}
		page = (page - 1)*10;
		return mapper.listPage(page);
	}
	@Override
	public List<QandA> listCri(BoardCriteria cri) {
		return mapper.listPageCri(cri);
	}
	@Override
	public Integer pageCount() {	
		return mapper.pageCount();
	}

}
