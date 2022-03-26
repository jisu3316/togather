package team1.togather.service;

import java.util.List;
import java.util.Map;

import team1.togather.domain.GroupTab;
import team1.togather.domain.IndexCriteria;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;
import team1.togather.domain.QandA;

public interface GroupTabService {
	List<GroupTab> selectAllS(IndexCriteria cri);//로그인안했을때 리스트
	List<GroupTab> loginGroupList(Map<String,Object> map);//로그인했을때 그룹리스트
	public Integer pageCount(Member member); //로그인했을때 그멤버의 카테고리로 검색한 그룹의 총 갯수
	public Integer notCategorypageCount();//로그인했는데 카테고리에 관한글 없을때 모든그룹 갯수
	GroupTab selectByGSeqS(long gseq);
	void insertS(GroupTab groupTab);
	void updateS(GroupTab groupTab);
	void deleteS(long gseq);
	//03.16 지수 추가
	List<Member> selectAllname();
	long groupCount();
	Long groupMemberCount(long gseq);
	Member groupInfoMemberName(long gseq);
	void memInGroup(MemInGroup memInGroup);
	Long grade(MemInGroup memInGroup);
	//03.17 지수 추가
	Long memInGroupCheck(MemInGroup memInGroup);
	void groupQuit(MemInGroup memInGroup);//그룹 탈퇴
	List<Map<String,String>> memInGroupName(MemInGroup memInGroup);//그룹내 모임가입멤버 이름
	//long memInGroupGseq(MemInGroup memInGroup);//그룹인포 gseq구하는sql
	//03.18
	void memInGroupDelete(long gseq);//그룹탈퇴
	List<GroupTab> myGroup(MemInGroup memInGroup);//가입한 그룹
	GroupTab insertGroupInfo(GroupTab groupTab);//그룹만들고 그 그룹인포로가는거
}