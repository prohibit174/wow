package kosta.mapper;

import java.util.List;

import kosta.model.Board;

public interface BoardMapper {
	public int insertBoard(Board board);
	public Integer selectB_id();
	public List<Board> listBoard();
	public Board selectBoard(int b_id);
	public void updateHit(int b_id);
}
