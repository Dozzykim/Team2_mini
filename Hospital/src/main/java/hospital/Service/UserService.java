package hospital.Service;

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
    
    // 아이디 중복 확인
    public String doubleCheck(String user_id);
}
