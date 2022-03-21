package team1.togather.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team1.togather.domain.WishList;
import team1.togather.mapper.WishListMapper;

@Service
public class WishListServiceImpl implements WishListService {
	@Autowired
	private WishListMapper wishmapper;
	
	@Override
	public ArrayList<WishList> getWishLists(Long usermnum) {
		return wishmapper.getWishLists(usermnum);
	}

	@Override
	public void insertWishList(Long usermnum, Long gseq) {
		Map<String, Object> wishMap = new HashMap<String, Object>();
		wishMap.put("mnum", usermnum);
		wishMap.put("gseq", gseq);
		wishmapper.insertWishList(wishMap);
	}

	@Override
	public void deleteWishList(Long usermnum, Long gseq) {
		Map<String, Object> wishMap = new HashMap<String, Object>();
		wishMap.put("mnum", usermnum);
		wishMap.put("gseq", gseq);
		wishmapper.deleteWishList(wishMap);
	}

}
