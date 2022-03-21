package team1.togather.mapper;

import java.util.List;
import java.util.Map;

import team1.togather.domain.GroupTab;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;

public interface GroupTabMapper {
	List<GroupTab> selectAll();
	GroupTab selectByGSeq(long gseq);
	void insert(GroupTab groupTab);
	void update(GroupTab groupTab);
	void delete(long gseq);
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
	List<Map<String,String>> memInGroupName(MemInGroup memInGroup);
	//long memInGroupGseq(MemInGroup memInGroup);
	//03.18
	void memInGroupDelete(long gseq);
	List<GroupTab> myGroup(MemInGroup memInGroup);
	GroupTab insertGroupInfo(GroupTab groupTab);
}

