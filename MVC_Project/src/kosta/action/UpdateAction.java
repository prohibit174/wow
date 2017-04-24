package kosta.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kosta.model.Board;
import kosta.model.BoardDao;

public class UpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		
		String num = request.getParameter("seq");
		int seq = 1;

		//seq값이 없으면 넘버포멘 익셉션이 발생할수 있음
		if (num != null) {
		   seq = Integer.parseInt(num);
		}
		BoardDao dao = BoardDao.getInstance();
		Board board = dao.detailBoard(seq);
		ActionForward forward = new ActionForward();

		forward.setRedirect(false);
		forward.setPath("updateForm.jsp");
		return forward;
	}

}
