package team1.togather.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import team1.togather.domain.GroupTab;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;
import team1.togather.mapper.GroupTabMapper;

@Service
@AllArgsConstructor
public class GroupTabServiceImpl implements GroupTabService {
	private GroupTabMapper groupTabMapper;
	
	@Override
	public List<GroupTab> selectAllS() {
		List<GroupTab> list = groupTabMapper.selectAll();
		return list;
	}

	@Override
	public GroupTab selectByGSeqS(long gseq) {
		return groupTabMapper.selectByGSeq(gseq);
	}

	@Override
	public void insertS(GroupTab groupTab) {
		groupTabMapper.insert(groupTab);
	}

	@Override
	public void updateS(GroupTab groupTab) {
		groupTabMapper.update(groupTab);
	}

	@Override
	public void deleteS(long gseq) {
		groupTabMapper.delete(gseq);
	}
	//03.16지수추가 
	@Override
	public List<Member> selectAllname() {
		
		return groupTabMapper.selectAllname();
	}

	@Override
	public long groupCount() {
		
		return groupTabMapper.groupCount();
	}

	@Override
	public Long groupMemberCount(long gseq) {
		
		return groupTabMapper.groupMemberCount(gseq);
	}

	@Override
	public Member groupInfoMemberName(long gseq) {
		
		return groupTabMapper.groupInfoMemberName(gseq);
	}

	@Override
	public void memInGroup(MemInGroup memInGroup) {
		groupTabMapper.memInGroup(memInGroup);
	}

	@Override
	public Long grade(MemInGroup memInGroup) {

		
		return groupTabMapper.grade(memInGroup);
	}
	//03.17지수추가
	@Override
	public Long memInGroupCheck(MemInGroup memInGroup) {
		return groupTabMapper.memInGroupCheck(memInGroup);
	}

	@Override
	public void groupQuit(MemInGroup memInGroup) {
		groupTabMapper.groupQuit(memInGroup);
		
	}

	@Override
	public List<Map<String,String>> memInGroupName(MemInGroup memInGroup) {
		
		return groupTabMapper.memInGroupName(memInGroup);
	}

	@Override
	public void memInGroupDelete(long gseq) {
		groupTabMapper.memInGroupDelete(gseq);
		
	}

	@Override
	public List<GroupTab> myGroup(MemInGroup memInGroup) {
		
		return groupTabMapper.myGroup(memInGroup);
	}

	@Override
	public GroupTab insertGroupInfo(GroupTab groupTab) {
		
		return groupTabMapper.insertGroupInfo(groupTab);
	}

	

	

}