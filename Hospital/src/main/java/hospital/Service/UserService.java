package hospital.Service;



import java.util.List;

import hospital.DTO.PersistentLogins;
import hospital.DTO.Users;

public interface UserService {

    // 회원 가입
    public int join(Users user);
    
    // 로그인
    public Users login(Users user);
    
    // 자동 로그인 - 토큰 갱신
    public String refreshToken(String p_userId);
    
    // 자동 로그인 - 토큰 삭제
    public int deleteToken(String p_userId);
    
    // 자동 로그인 - 토큰 조회
    public PersistentLogins selectTokenByToken(String p_token);

	public boolean idCheck(String user_id);

	// 마이페이지 내 정보 조회
	Users myinfo(String user_id);
	
	// 관리자용 전체 회원 정보 조회
	List<Users> list();
	
	// 아이디 찾기
	public List<String> findId(Users user);

	// 비밀번호 찾기
	public String findPw(Users user);
}
