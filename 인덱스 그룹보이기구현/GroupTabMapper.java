package team1.togather.mapper;

import java.util.List;
import java.util.Map;

import team1.togather.domain.GroupTab;
import team1.togather.domain.IndexCriteria;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;
import team1.togather.domain.QandA;

public interface GroupTabMapper {
	List<GroupTab> selectAll(IndexCriteria cri);//로그인 안했을때 그룹 리스트
	//페이징
	List<GroupTab> loginGroupList(Map<String,Object> map);//로그인했을때 그룹리스트
	public Integer pageCount(Member member); //db테이블 모든글 개수 계산 후 리턴
	public Integer notCategorypageCount();
	//
	GroupTab selectByGSeq(long gseq);
	void insert(GroupTab groupTab);
	void update(GroupTab groupTab);
	void delete(long gseq);
	//03.16 
	List<Member> selectAllname();
	long groupCount();
	Long groupMemberCount(long gseq);
	Member groupInfoMemberName(long gseq);
	void memInGroup(MemInGroup memInGroup);
	Long grade(MemInGroup memInGroup);
	//03.17 
	Long memInGroupCheck(MemInGroup memInGroup);
	void groupQuit(MemInGroup memInGroup);//그룹 탈퇴
	List<Map<String,String>> memInGroupName(MemInGroup memInGroup);
	//long memInGroupGseq(MemInGroup memInGroup);
	//03.18
	void memInGroupDelete(long gseq);
	List<GroupTab> myGroup(MemInGroup memInGroup);
	GroupTab insertGroupInfo(GroupTab groupTab);
}

