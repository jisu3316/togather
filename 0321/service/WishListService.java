package team1.togather.service;

import java.util.ArrayList;

import team1.togather.domain.WishList;

public interface WishListService {
	public ArrayList<WishList> getWishLists(Long usermnum);
	public void insertWishList(Long usermnum, Long gseq);
	public void deleteWishList(Long usermnum, Long gseq);
}
