package dao;

import java.util.HashMap;
import java.util.List;

import model.Board;

public interface IBoardDao {
	public int insertBoard(Board board);
	public int updateBoard(Board board);
	public int deleteBoard(int board_num);
	public Board selectOne(int board_num);
	public List<Board> selectAll();
	public int getBoardCount();
	public List<Board> selectBoardLimit(HashMap<String, Object> params);
}
