package hospital.Service;

import java.util.List;

import hospital.DAO.CommentDAO;
import hospital.DTO.Comment;
import hospital.DTO.Reservation;


// 비즈니스 로직 계층
public class CmmtServiceImpl implements CmmtService {

	private CommentDAO commentDAO = new CommentDAO();

	//댓글 불러오기
		@Override
		public List<Comment> list(int boardNo) {
			List<Comment> cmmtList = commentDAO.list(boardNo);
			
			return cmmtList;
		}
		
	//댓글 등록
	@Override
	public int insert(Comment comment) {
		int result = 0;
		result = commentDAO.insert(comment);
		return result;
	}

	// 댓글 삭제
	@Override
	public int delete(int c_no) {
		int result = 0;
		result = commentDAO.delete(c_no);
		
		return result;
	}
	
	
	
	
}
