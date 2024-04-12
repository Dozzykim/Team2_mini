package hospital.Service;

import java.util.List;

import hospital.DTO.Board;
import hospital.DTO.Reservation;


/*
 * 게시판의 인터페이스
 *  * 게시판 기능 메소드
 *  - 게시글 목록 
 *  - 게시글 조회 
 *  - 게시글 등록 
 *  - 게시글 수정 
 *  - 게시글 삭제 
 *  
 */


public interface BoardService {
	
	// - 게시글 목록 
		List<Board> list();
		
		
		// - 게시글 조회 
		Board select(int no);
		
		
		// - 게시글 등록 
		int insert(Board board);
		
		
		// - 게시글 수정
		int update(Board board); //반환타입을 int로 설정한 이유: 게시글번호를 return으로 넘겨주어 해당 글 수정하게끔
		
		
		// - 게시글 삭제 
		int delete(int no); //반환타입을 int로 설정한 이유: 게시글번호를 return으로 넘겨주어 삭제하게끔

		
		// 사용자 아이디에 해당하는 예약 목록 조회 (사용자)
	    List<Board> listByUserId(String userId);
}
