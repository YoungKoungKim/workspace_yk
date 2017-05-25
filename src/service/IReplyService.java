package service;

import java.util.List;

import model.Reply;

public interface IReplyService {
	public boolean insertReply(Reply reply);
	public boolean insertReReply(Reply reply);
	public boolean updateReply(Reply reply);
	public boolean deleteReply(Reply reply);
	public Reply selectOneReply(int re_num);
	public List<Reply> selectAllReplyByBoard(int board_num);

}
