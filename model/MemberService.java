package team1.togather.model;

import team1.togather.domain.Member;

public class MemberService {
	private MemberDAO dao;
	private static final MemberService instance = new MemberService();
	private MemberService() {
		dao = new MemberDAO();
	}
	public static MemberService getInstance() {
		return instance;
	}
	public boolean joinS(Member dto) {
		return dao.join(dto);
	}
	public Member loginS(String phone) {
		Member m =dao.login(phone);
		return m;	
	}
	public Member loginemailS(String email) {
		Member m =dao.loginemail(email);
		return m;	
	}
	public Member findpasswordS(String phone) {
		Member m =dao.findpassword(phone);	
		return m;
	}
	public Member kakaologincheck(String email) {
		Member m =dao.kakaologincheck(email);
		return m;	
	}
	
}
