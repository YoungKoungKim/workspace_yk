package model;

import java.util.Date;

public class Board {
	private int board_num;
	private int id_index;
	private String title;
	private String content;
	private Date writedate;
	private int readcount;
	private String fileuri;
	private int fileid;
	private String writer;

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public int getId_index() {
		return id_index;
	}

	public void setId_index(int id_index) {
		this.id_index = id_index;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getFileuri() {
		return fileuri;
	}

	public void setFileuri(String fileuri) {
		this.fileuri = fileuri;
	}

	public int getFileid() {
		return fileid;
	}

	public void setFileid(int fileid) {
		this.fileid = fileid;
	}
	

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "Board [board_num=" + board_num + ", id_index=" + id_index + ", title=" + title + ", content=" + content
				+ ", writedate=" + writedate + ", readcount=" + readcount + ", fileuri=" + fileuri + ", fileid="
				+ fileid + ", writer=" + writer + "]";
	}

	

}
