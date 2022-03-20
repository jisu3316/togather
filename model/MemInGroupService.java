package team1.togather.model;

import team1.togather.domain.MemInGroup;

public class MemInGroupService {
	private MemInGroupDAO dao;
	
	private static final MemInGroupService instance = new MemInGroupService();
	
	public MemInGroupService() {
		dao = new MemInGroupDAO();
	}
	public static MemInGroupService getInstance() {
		return instance;
	}
	
	public boolean MemInGroupJoinS(MemInGroup dto) {
		return dao.MemInGroupJoin(dto);
	}
	public boolean MemInGroupDelS(long gSeq, long mnum) {
		return dao.MemInGroupDel(gSeq, mnum);
	}
	public boolean MemInGroupDelS(long gSeq) {
		return dao.MemInGroupDel(gSeq);
	}
}





	