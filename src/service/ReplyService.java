package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IMemberDao;
import dao.IReplyDao;
import model.Reply;

@Service
public class ReplyService implements IReplyService {
	@Autowired
	private IReplyDao replyDao;
	@Autowired
	private IMemberDao memberDao;

	@Override
	public boolean insertReply(Reply reply) {
		reply.setRewriter(memberDao.selectOne(reply.getId_index()).getNick());
		reply.setReparent(reply.getRe_num());
		reply.setRedepth(0);
		reply.setReorder(replyDao.selectBoardReplyMaxOrder(reply.getBoard_num()));
		int result = replyDao.insertReply(reply);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateReply(Reply reply) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteReply(Reply reply) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Reply selectOneReply(int re_num) {
		return replyDao.selectOne(re_num);
	}

	@Override
	public List<Reply> selectAllReplyByBoard(int board_num) {
		// TODO Auto-generated method stub
		return replyDao.selectAllByBoard(board_num);
	}

	@Override
	public boolean insertReReply(Reply reply) {
		Reply reParent = replyDao.selectOne(reply.getReparent());
		reply.setRewriter(memberDao.selectOne(reply.getId_index()).getNick());
		reply.setRedepth(reParent.getRedepth()+1);
		reply.setReorder(reParent.getReorder()+1);
		
		replyDao.updateBoardReplyOrder(reply);
		
		int result = replyDao.insertReply(reply);
		
		if (result > 0)
			return true;
		return false;
	}

}
