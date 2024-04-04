package hospital.Service;

import java.util.List;

import hospital.DTO.Comment;

public interface CmntService {

	
// 댓글 기능 인터페이스
	
	// 댓글 전체 가져오기
	List<Comment> list(int boardNo);
	
	
	// 등록
	int insert (Comment comment);

	// 삭제
	int delete (int no);
	
}
