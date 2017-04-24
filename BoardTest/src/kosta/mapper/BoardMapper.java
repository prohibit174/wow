package kosta.mapper;

import java.util.List;

import kosta.model.Board;
import kosta.model.Reply;
import kosta.model.Search;

public interface BoardMapper {
	//게시판 부분
	public int insertBoard(Board board);
	public Integer selectB_id();
	public List<Board> listBoard(Search search);
	public Board selectBoard(int b_id);
	public int updateHit(int b_id);
	public int updateCheck(Board board);
	public int updateBoard(Board board);
	
	//댓글 부분
	public int insertReply(Reply reply);
	public Integer selectR_num();
	public List<Reply> selectReplyBoard(int b_id);
}
