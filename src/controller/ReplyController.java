package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.Reply;
import service.IMemberService;
import service.IReplyService;

@Controller
public class ReplyController {
	@Autowired
	private IReplyService replyService;
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping("writeReply.do")
	public String writeReply(Reply reply) {
		//그냥 쓰이는 댓글
		replyService.insertReply(reply);
		return "redirect:view.do?board_num=" + reply.getBoard_num();
	}
	
	@RequestMapping("writeReReply.do")
	public String wrtieReReply(Reply reply) {
		replyService.insertReReply(reply);
		return "redirect:view.do?board_num=" + reply.getBoard_num();
	}
	
}
