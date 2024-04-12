package hospital.Service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import hospital.DTO.Reservation;

public interface ReservationService {
	
	// 전체 예약 현황 조회 (관리자)
	List<Reservation> list();
	
	// 사용자 아이디에 해당하는 예약 목록 조회 (사용자)
    List<Reservation> listByUserId(String userId);
    
	// 예약 등록
	int insert(Reservation reservation);
	
	// 예약 삭제
	int delete(int no);
	
    // 중복 검사
	int check(Reservation reservation);
}
