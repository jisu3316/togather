package team1.togather.mapper;

import java.util.ArrayList;
import java.util.Map;

import team1.togather.domain.WishList;

public interface WishListMapper {
	public ArrayList<WishList> getWishLists(Long usermnum);
	public void insertWishList(Map<String,Object> map);
	public void deleteWishList(Map<String,Object> map);
}
