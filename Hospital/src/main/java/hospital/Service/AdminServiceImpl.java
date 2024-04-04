package hospital.Service;

import hospital.DAO.AdminDAO;
import hospital.DTO.Admin;

public class AdminServiceImpl implements AdminService {


	private AdminDAO adminDAO = new AdminDAO();
	
	@Override
	public Admin login(Admin admin) {
		Admin loginAdmin = adminDAO.login(admin);
		
		if( loginAdmin != null) {
			System.out.println("로그인 성공!");
			return loginAdmin;
		}
		// 로그인 실패
		System.out.println("로그인 실패!");
		return null;
	}

	
}
