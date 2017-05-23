package model;

import java.util.Date;

public class Reply {
	private int board_num;
	private int re_num;
	private int id_index;
	private String recontent;
	private Date redate;
	private int reparent;
	private int redepth;
	private int reorder;
	private String rewriter;
	
	public String getRewriter() {
		return rewriter;
	}
	public void setRewriter(String rewriter) {
		this.rewriter = rewriter;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getId_index() {
		return id_index;
	}
	public void setId_index(int id_index) {
		this.id_index = id_index;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public Date getRedate() {
		return redate;
	}
	public void setRedate(Date redate) {
		this.redate = redate;
	}
	public int getReparent() {
		return reparent;
	}
	public void setReparent(int reparent) {
		this.reparent = reparent;
	}
	public int getRedepth() {
		return redepth;
	}
	public void setRedepth(int redepth) {
		this.redepth = redepth;
	}
	public int getReorder() {
		return reorder;
	}
	public void setReorder(int reorder) {
		this.reorder = reorder;
	}
	@Override
	public String toString() {
		return "Reply [board_num=" + board_num + ", re_num=" + re_num + ", id_index=" + id_index + ", recontent="
				+ recontent + ", redate=" + redate + ", reparent=" + reparent + ", redepth=" + redepth + ", reorder="
				+ reorder + ", rewriter=" + rewriter + "]";
	}
	
}
