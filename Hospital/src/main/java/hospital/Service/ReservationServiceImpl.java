package hospital.Service;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import hospital.DAO.ReservationDAO;
import hospital.DTO.Reservation;


public class ReservationServiceImpl implements ReservationService{

	
	
	private ReservationDAO reservationDAO = new ReservationDAO();
	
	
	@Override // 관리자용
	public List<Reservation> list() {
		// 1. DAO 객체에 게시글 목록 요청
		List<Reservation> reservationList = reservationDAO.list();
		// 2. 게시글 목록 데이터 가공
		// pass
		// 3. 게시글 목록 반환
		return reservationList;
	}

	
	@Override // 회원용
	public List<Reservation> listByUserId(String userId) {
		return reservationDAO.listByUserId(userId);
	}
	
	
	public int insert(HttpServletRequest request, Reservation reservation) {
		
		int result = reservationDAO.insert(request, reservation);

	    return result;
	}


	@Override // 예약 삭제
	public int delete(int no) {
		int result = reservationDAO.delete(no);
		// 1. 게시글 정보를 전달하여 게시글 데이터 등록 요청
		// 2. 등록된 데이터 건수를 반환
		// 	- 결과 :  0 --> 데이터 삭제 실패
		//		     1 --> 데이터 삭제 성공 
		return result;	
	}


	@Override // 중복검사
	public boolean check(HttpServletRequest request, Reservation reservation) {
	    boolean result = false;

	    // 세션에서 user_id 가져오기
	    HttpSession session = request.getSession();
	    String sessionUserId = (String) session.getAttribute("user_id");

	    // 사용자의 세션 user_id와 예약 객체의 user_id가 일치하는 경우에만 예약을 추가하고 중복을 확인
	    if (sessionUserId != null && sessionUserId.equals(reservation.getUser_id())) {
	        // DAO의 insertAndCheckDuplicate 메서드를 호출하여 예약을 추가하고 중복을 확인
	        result = reservationDAO.check(request, reservation);
	    } else {
	        System.err.println("사용자 세션 정보와 예약 객체의 user_id가 일치하지 않습니다.");
	    }

	    return result;
	}


	
}

	


	

	


