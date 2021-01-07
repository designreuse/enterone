package com.yedam.fandemic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.impl.ReplyMapper;
import com.yedam.fandemic.service.ReplyService;
import com.yedam.fandemic.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired ReplyMapper replyDAO;

	@Override
	public List<Reply> getReplyList(Reply reply) {
		return replyDAO.getReplyList(reply);
	}

	@Override
	public int insertReply(Reply reply) {
		return replyDAO.insertReply(reply);
	}

	@Override
	public int updateReply(Reply reply) {
		return replyDAO.updateReply(reply);
	}

	@Override
	public int deleteReply(Reply reply) {
		return replyDAO.deleteReply(reply);
	}
}
