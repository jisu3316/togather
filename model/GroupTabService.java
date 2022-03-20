package team1.togather.model;

import java.util.ArrayList;

import team1.togather.domain.Gathering;
import team1.togather.domain.GroupTab;
import team1.togather.domain.MemInGroup;
import team1.togather.domain.Member;
import team1.togather.domain.WishList;

public class GroupTabService {
	private GroupTabDAO dao;
	
	private static final GroupTabService instance = new GroupTabService();
	
	private GroupTabService() {
		dao = new GroupTabDAO();
	}
	public static GroupTabService getInstance() {
		return instance;
	}
	//=== Âò ===
	public int selectWishListS(long usermnum, long gseq) {
		return dao.selectWishList(usermnum, gseq);
	}
	public void insertWishListS(long usermnum, long gseq) {
		dao.insertWishList(usermnum, gseq);
	}
	public ArrayList<WishList> getWishListsS(long usermnum){
		return dao.getWishLists(usermnum);
	}
	public void deleteWishList(long usermnum, long gseq) {
		dao.deleteWishList(usermnum, gseq);
	}
	//==========
	public ArrayList<GroupTab> groupListS(){
		return dao.groupList();
	}
	public GroupTab getGroupS(long gSeq) {
		return dao.getGroup(gSeq);
	}
	public ArrayList<GroupTab> groupInfoS(long gSeq){ 
		return dao.groupInfo(gSeq);
	}
	public ArrayList<Member> MemInGroupListS(long gSeq){
		return dao.MemInGroupList(gSeq);
	}
	public ArrayList<MemInGroup> MemInGroupListS2(long gseq,long mnum){
		return dao.MemInGroupList2(gseq,mnum);
	}
	public boolean groupInsertS(GroupTab dto) {
		return dao.groupInsert(dto);
	}
	public ArrayList<GroupTab> groupGetUpdateS(long gSeq){
		return dao.groupGetUpdate(gSeq);
	}
	public void groupUpdateS(GroupTab dto) {
		dao.groupUpdate(dto);
	}
	public void groupDeleteS(long gSeq) {
		dao.groupDelete(gSeq);
	}
	public void wishDelS(long usermnum, long gseq) {
		dao.wishDel(usermnum, gseq);
	}
	/*
	public ArrayList<GroupTab> getGroupByMnum(long mnum){
		return dao.getGroupByMnum(mnum);
	}
	*/
	
	public boolean gatheringInsertS(Gathering dto) {
		return dao.gatheringInsert(dto);
	}
	public ArrayList<Gathering> gatheringListS(long gSeq){
		return dao.gatheringList(gSeq);
	}
	public ArrayList<Gathering> gatheringInfoS(long gSeq, long ga_seq){
		return dao.gatheringInfo(gSeq, ga_seq);
	}
	public void gatheringDeleteS(long ga_seq) {
		dao.gatheringDelete(ga_seq);
	}
	public ArrayList<Gathering> gatheringGetUpdateS(long ga_seq) {
		return dao.gatheringGetUpdate(ga_seq);
	}
	public void gatheringUpdateS(Gathering dto) {
		dao.gatheringUpdate(dto);
	}

}
