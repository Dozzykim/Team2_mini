package hospital.Service;

import java.util.List;

import hospital.DTO.Comment;

public interface CmmtService {

	
// 댓글 기능 인터페이스
	
	// 댓글 불러오기
	List<Comment> list(int boardNo);
	
	
	// 등록
	int insert (Comment comment);

	// 삭제
	int delete (int c_no);
	
}
