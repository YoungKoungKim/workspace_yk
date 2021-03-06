package service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.IBoardDao;
import dao.IBoardFileDao;
import dao.IMemberDao;
import model.Board;
import model.BoardFile;
import model.Member;

@Service
public class BoardService implements IBoardService {
	@Autowired
	private IBoardDao boardDao;
	@Autowired
	private IMemberDao memberDao;
	@Autowired
	private IBoardFileDao boardFileDao;

	@Override
	public void writeBoard(Board board, MultipartFile file) {
		String path = "/Users/KiM YK/Upload/";

		if (file.getOriginalFilename() != "") {
			String fileName = file.getOriginalFilename();
			int size = (int) file.getSize();
			String fileuri = path + UUID.randomUUID();
			BoardFile boardFile = new BoardFile();
			boardFile.setOriginFileName(fileName);
			boardFile.setSize(size);
			boardFile.setUri(fileuri);

			File localFile = new File(fileuri);
			try {
				file.transferTo(localFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			boardFileDao.insertBoardFile(boardFile);
			int fileid = boardFile.getId();
			board.setFileid(fileid);
		} else {
			board.setFileid(0);
		}

		boardDao.insertBoard(board);
	}

	//파일 수정 버전
	@Override
	public boolean updateBoard(Board board, MultipartFile file) {
		String path = "/Users/KiM YK/Upload/";
		//파일ㅇ ㅣ없을 때, 있을 때 나눔
		//1. board.getFileid == 0 이면, boardFile 하나 insert 하고, 그 아이디를 준다.
		//2. board.getFileid != 0 일때
		//   1) 파일이 그대로
		//   2) 파일이 바뀜
		if (board.getFileid() == 0) {
			if (file.getOriginalFilename() != "") {
				String fileName = file.getOriginalFilename();
				int size = (int) file.getSize();
				String fileuri = path + UUID.randomUUID();
				BoardFile boardFile = new BoardFile();
				boardFile.setOriginFileName(fileName);
				boardFile.setSize(size);
				boardFile.setUri(fileuri);

				File localFile = new File(fileuri);
				try {
					file.transferTo(localFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				boardFileDao.insertBoardFile(boardFile);
				int fileid = boardFile.getId();
				board.setFileid(fileid);
			} else {
				board.setFileid(0);
			}
		} else {
			BoardFile boardFile = boardFileDao.selectOne(board.getFileid());
			if (file.getOriginalFilename() != "") {
				String fileName = file.getOriginalFilename();
				int size = (int) file.getSize();
				
				String fileuri = path + UUID.randomUUID();
				System.out.println(board.getFileid());
				boardFile.setOriginFileName(fileName);
				boardFile.setSize(size);
				boardFile.setUri(fileuri);

				File localFile = new File(fileuri);
				try {
					file.transferTo(localFile);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				boardFileDao.updateBoardFile(boardFile);
			}
			int fileid = boardFile.getId();
			board.setFileid(fileid);
		}

		int result = boardDao.updateBoard(board);
		System.out.println(board);
		if (result > 0)
			return true;
		return false;
	}

	@Override
	public boolean deleteBoard(int board_num) {
		int result = boardDao.deleteBoard(board_num);
		if (result > 0)
			return true;
		return false;
	}

	@Override
	public HashMap<String, Object> readBoard(int board_num) {
		Board board = boardDao.selectOne(board_num);
		board.setReadcount(board.getReadcount() + 1);
		boardDao.updateBoard(board);
		BoardFile boardFile = boardFileDao.selectOne(board.getFileid());
		HashMap<String, Object> attr = new HashMap<>();
		attr.put("board", board);
		attr.put("boardFile", boardFile);
		return attr;
	}

	@Override
	public HashMap<String, Object> getBoard(int board_num) {
		// TODO Auto-generated method stub
		Board board = boardDao.selectOne(board_num);
		BoardFile boardFile = boardFileDao.selectOne(board.getFileid());
		HashMap<String, Object> attr = new HashMap<>();
		attr.put("board", board);
		attr.put("boardFile", boardFile);
		return attr;
	}

	@Override
	public HashMap<String, Object> getBoardList(int page) {
		// 시작페이지와 끝페이지
		int start = (page - 1) / 10 * 10 + 1;
		int end = ((page - 1) / 10 + 1) * 10;
		// 첫페이지와 마지막페이지
		int first = 1;
		int last = (boardDao.getBoardCount() - 1) / 10 + 1;
		// 끝페이지 검증
		end = last < end ? last : end;
		// 해당페이지의 게시물을 쿼리하기 위한 skip과 count
		int skip = (page - 1) * 10;
		int count = 10;

		HashMap<String, Object> params = new HashMap<>();
		params.put("skip", skip);
		params.put("count", count);
		List<Board> list = boardDao.selectBoardLimit(params);

		HashMap<String, Object> result = new HashMap<>();
		result.put("start", start);
		result.put("first", first);
		result.put("end", end);
		result.put("last", last);
		result.put("current", page);
		result.put("boardList", list);

		return result;
	}

	@Override
	public String getFileUri(int num) {
		return boardDao.selectOne(num).getFileuri();
	}

	// 내 글인지 아닌지 판별
	@Override
	public boolean isWriter(int board_num, int id_index) {
		Board board = boardDao.selectOne(board_num);
		Member member = memberDao.selectOne(id_index);

		if (board.getId_index() == member.getId_index())
			return true;
		return false;
	}

	@Override
	public BoardFile getBoardFile(int id) {
		// TODO Auto-generated method stub
		return boardFileDao.selectOne(id);
	}

}
