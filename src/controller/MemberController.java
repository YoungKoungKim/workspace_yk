package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.Member;
import service.IMemberService;

@Controller
public class MemberController {
	
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping("join.do")
	public @ResponseBody HashMap<String, Object> join(Member member) {
		HashMap<String, Object> params = new HashMap<>();
		boolean result = memberService.joinMember(member);
		if (result)
			params.put("msg", "가입이 완료되었습니다.");
		else {
			params.put("msg", "가입이 실패했습니다.");
		}
		return params;
	}
	
	@RequestMapping("idCheck.do")
	public @ResponseBody HashMap<String,Object> idCheck(String id) {
		HashMap<String, Object> response = new HashMap<>();
		boolean result = memberService.checkId(id);
		response.put("result", result);
		System.out.println(result);
		return response;
	}
	
	@RequestMapping(value="nickCheck.do", method=RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> nickCheck(String nick) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("result", memberService.checkNick(nick));
		return params;
	}
	
	@RequestMapping("login.do")
	public @ResponseBody HashMap<String, Object> login(HttpSession session, String id, String pass) {
		HashMap<String, Object> params = memberService.checkPass(id, pass);
		HashMap<String, Object> response = new HashMap<>();
		
		boolean result = (boolean) params.get("result");
		Member member = (Member) params.get("member");
		
		if (result) {
			response.put("msg", "로그인하셨습니다.");
			response.put("result", result);
			response.put("next", "list.do");
			session.setAttribute("id_index", member.getId_index());
		} else {
			response.put("msg", "아이디 또는 비밀번호가 다릅니다.");
			response.put("result", result);
		}
		
		return response;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("id_index");
		return "main";
	}

}
