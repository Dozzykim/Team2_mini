package hospital.Service;

import java.util.List;

import hospital.DAO.BoardDAO;
import hospital.DTO.Board;
import hospital.DTO.Reservation;


// 비즈니스 로직 계층
public class BoardServiceImpl implements BoardService {
	
	private BoardDAO boardDAO = new BoardDAO();

	@Override
	public List<Board> list() {
		// 1. DAO 객체에 게시글 목록 요청
		List<Board> boardList = boardDAO.list();
		
		// 2. 게시글 목록 데이터 가공
		// 우선 패스
		
		// 3. 게시글 목록 반환

		return boardList;
	}

	@Override
	public Board select(int no) {
		// 1. 게시글 번호에 대한 게시글 정보 데이터 요청
		Board board = boardDAO.select(no);
		
		// 2. 게시글 정보 반환
		return board;
	}

	@Override
	public int insert(Board board) {
		// 1. 게시글 정보를 전달하여 게시글 데이터 등록 요청
		int result = boardDAO.insert(board);
		// 2. 적용된 데이터 건수를 반환
		// if	-결과 : 0 --> 데이터 등록 실패
		//			   1 --> 데이터 등록 성공
		return result;
	}

	@Override
	public int update(Board board) {
		// 1. 게시글 정보를 전달하여 게시글 데이터 수정 요청
		int result = boardDAO.update(board);
		// 2. 적용된 데이터 건수를 반환
		// if	-결과 : 0 --> 데이터 수정 실패
		//			   1 --> 데이터 수정 성공
		return result;
	}

	@Override
	public int delete(int no) {
		// 1. 게시글 정보를 전달하여 게시글 데이터 삭제 요청
		int result = boardDAO.delete(no);
		// 2. 적용된 데이터 건수를 반환
		// if	- 결과 : 0 --> 데이터 삭제 실패
		//			    1 --> 데이터 삭제 성공
		return result;
	}

	
	@Override // 회원용
	public List<Board> listByUserId(String userId) {
		return boardDAO.listByUserId(userId);
	}
	
	
	
}
