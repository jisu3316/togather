package team1.togather.mapper;

import java.util.List;

import team1.togather.domain.Block;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;

public interface MemberMapper {
	int join(Member member);
	int joincheck(String phone);
	int joincheck2(String email);
	Member logincheck(Member member);
	int kakaologincheck(Member member);
	Member kakaologin(Member member);
	long memberCount();
	Member memberInfo(MemInGroup meminGroup);
	void blocking(Block block);
	List<String> blockedNameList(long mnum);
	void blockingCancel(Block block);
}

