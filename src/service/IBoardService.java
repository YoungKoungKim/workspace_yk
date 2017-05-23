package service;

import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import model.Board;
import model.BoardFile;

public interface IBoardService {
	public void writeBoard(Board board, MultipartFile file);
	public boolean updateBoard(Board board, MultipartFile file);
	public boolean deleteBoard(int board_num);
	public HashMap<String, Object> readBoard(int board_num);
	public HashMap<String, Object> getBoard(int board_num);
	public HashMap<String, Object> getBoardList(int page);
	public String getFileUri(int num);
	public boolean isWriter(int board_num, int id_index);
	public BoardFile getBoardFile(int id);
}
