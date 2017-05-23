package service;

import java.util.HashMap;

import model.Member;

public interface IMemberService {
	public boolean joinMember(Member member);
	public boolean updateMember(Member member);
	public boolean deleteMember(int id_index);
	public boolean checkId(String id);
	public boolean checkNick(String nick);
	public HashMap<String, Object> checkPass(String id, String pass);
	public Member selectOneMember(int id_index);

}
