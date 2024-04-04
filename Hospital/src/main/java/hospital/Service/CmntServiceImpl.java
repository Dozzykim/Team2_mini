package hospital.Service;

import java.util.List;

import hospital.DAO.CmntDAO;
import hospital.DTO.Comment;


// 비즈니스 로직 계층
public class CmntServiceImpl implements CmntService {

	private CmntDAO cmntDAO = new CmntDAO();

	@Override
	public int insert(Comment comment) {
		int result = 0;
		result = cmntDAO.insert(comment);
		return result;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Comment> list(int boardNo) {
		List<Comment> cmntList = cmntDAO.list();
		
		return cmntList;
	}

}
