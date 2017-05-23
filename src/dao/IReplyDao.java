package dao;

import java.util.List;

import model.Reply;

public interface IReplyDao {
	public int insertReply(Reply reply);
	public int updateReply(Reply reply);
	public int deleteReply(Reply reply);
	public Reply selectOne(int re_num);
	public List<Reply> selectAllByBoard(int board_num);

}
