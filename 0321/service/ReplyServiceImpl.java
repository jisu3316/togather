package team1.togather.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team1.togather.domain.Reply;
import team1.togather.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyMapper replymapper;

	@Override
	public ArrayList<Reply> getReply(Long bnum) {
		System.out.println("##replyserviceimple실행됨 bnum: "+bnum );
		return replymapper.getReply(bnum);
	}


}
