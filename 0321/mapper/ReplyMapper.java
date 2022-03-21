package team1.togather.mapper;

import java.util.ArrayList;

import team1.togather.domain.Reply;

public interface ReplyMapper {
	public ArrayList<Reply> getReply(Long bnum);
	public void delete(Long bnum);
}
