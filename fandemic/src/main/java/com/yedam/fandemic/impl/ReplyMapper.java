package com.yedam.fandemic.impl;

import java.util.List;

import com.yedam.fandemic.vo.Notify;
import com.yedam.fandemic.vo.Reply;

public interface ReplyMapper {
	public List<Reply> getReplyList(Reply reply);
	public Reply getReply(Reply reply);
	public int insertReply(Reply reply);
	public int updateReply(Reply reply);
	public int deleteReply(Reply reply);
	public int insertNotify(Notify notify);
}
