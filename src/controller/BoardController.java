package controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import model.Board;
import model.BoardFile;
import model.Member;
import service.IBoardService;
import service.IMemberService;
import service.IReplyService;

@Controller
public class BoardController {

	@Autowired
	private IBoardService boardService;
	@Autowired
	private IMemberService memberService;
	@Autowired
	private IReplyService replyService;

	@RequestMapping("list.do")
	public ModelAndView list(@RequestParam(defaultValue = "1") int page) {
		ModelAndView mav = new ModelAndView();

		mav.addAllObjects(boardService.getBoardList(page));
		mav.setViewName("list");

		return mav;
	}

	@RequestMapping("writeForm.do")
	public ModelAndView writeForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Member member = memberService.selectOneMember((int) session.getAttribute("id_index"));
		mav.addObject("member", member);
		mav.setViewName("writeForm");
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, value = "write.do")
	public String write(Board board, @RequestParam("ufile") MultipartFile ufile) {
		boardService.writeBoard(board, ufile);
		return "redirect:view.do?board_num=" + board.getBoard_num();
	}

	@RequestMapping("view.do")
	public ModelAndView view(HttpSession session, int board_num) {
		ModelAndView mav = new ModelAndView();
		boolean myBoard = false;

		if (session.getAttribute("id_index") != null) {
			myBoard = boardService.isWriter(board_num, (int) session.getAttribute("id_index"));
		}

		mav.addAllObjects(boardService.readBoard(board_num));
		mav.addObject("replylist", replyService.selectAllReplyByBoard(board_num));
		mav.addObject("isMyBoard", myBoard);
		mav.setViewName("view");
		return mav;
	}

	@RequestMapping("deleteBoard.do")
	public String deleteBoard(int board_num) {
		boardService.deleteBoard(board_num);
		return "redirect:list.do";
	}

	@RequestMapping("updateBoardForm.do")
	public ModelAndView updateBoardForm(int board_num) {
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardService.getBoard(board_num));
		mav.setViewName("updateForm");
		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, value = "updateBoard.do")
	public String updateBoard(Board board, @RequestParam("ufile") MultipartFile ufile) {
		System.out.println("updateBoard.do");
		boolean result = boardService.updateBoard(board, ufile);
		if (result)
			return "redirect:view.do?board_num=" + board.getBoard_num();
		else
			return "redirect:updateBoardForm.do?board_num=" + board.getBoard_num();
	}

	@RequestMapping("download.do")
	public View download(int id){
		BoardFile boardFile = boardService.getBoardFile(id);
		File file = new File(boardFile.getUri());
		return new DownloadView(file, boardFile.getOriginFileName());
	}

}
