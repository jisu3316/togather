package team1.togather.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import team1.togather.domain.Block;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;

public interface MemberService {
	int join(Member member);
	int joincheck(String phone);
	int joincheck2(String email);
	int logincheck(Member member);
	Member login(Member member);
	int kakaologincheck(Member member);
	Member kakaologin(Member member);
	long memberCount();
	Member memberInfo(MemInGroup meminGroup);
	void blocking(Block block);
	List<String> blockedNameList(HttpSession session);
	void blockingCancel(Block block);
}
