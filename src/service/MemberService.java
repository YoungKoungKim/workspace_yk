package service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.apache.catalina.tribes.MembershipListener;
import org.apache.ibatis.binding.BindingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IMemberDao;
import model.Member;

@Service
public class MemberService implements IMemberService {
	
	@Autowired
	private IMemberDao memberDao;

	@Override
	public boolean joinMember(Member member) {
		int result = memberDao.insertMember(member);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean updateMember(Member member) {
		int result = memberDao.updateMember(member);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean deleteMember(int id_index) {
		int result = memberDao.deleteMember(id_index);
		if (result > 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean checkId(String id) {
		List<Member> memberList = null;
		try {
			memberList = memberDao.selectAll();
			for (Member m : memberList) {
				if (m.getId().equals(id))
					return false;
			}
			return true;
		} catch (BindingException e) {
			return true;
		}
		
	}

	@Override
	public HashMap<String, Object> checkPass(String id, String pass) {
		HashMap<String, Object> resp = new HashMap<>();
		boolean result = false;
		Member member = null;
		try {
			int id_index = memberDao.selectIndex(id);
			member = memberDao.selectOne(id_index);
			if (member != null) {
				if (member.getPass().equals(pass))
					result = true;
				else
					result = false;
			} else
				result = false;
		} catch(BindingException e) {
			result =  false;
		}
		
		resp.put("result", result);
		resp.put("member", member);
		return resp;
	}

	@Override
	public boolean checkNick(String nick) {
		List<Member> memberList = memberDao.selectAll();
		for (Member m : memberList) {
			if (m.getNick().equals(nick))
				return false;
		}
		return true;
	}

	@Override
	public Member selectOneMember(int id_index) {
		return memberDao.selectOne(id_index);
	}

}
