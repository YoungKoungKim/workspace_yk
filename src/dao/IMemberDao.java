package dao;

import java.util.List;

import model.Member;

public interface IMemberDao {
	public int insertMember(Member member);
	public int updateMember(Member member);
	public int deleteMember(int id_index);
	public Member selectOne(int id_index);
	public int selectIndex(String id);
	public List<Member> selectAll();

}
