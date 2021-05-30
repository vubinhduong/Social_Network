package ssn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssn.dao.LikeDAO;
import ssn.model.Like;

@Service
@Transactional
public class LikeService {
	@Autowired
	private LikeDAO likeDAO;
	
	public int like(Like like) {
		if(likeDAO.checkLikeExist(like)) {
			likeDAO.deleteLike(like);
			return 0;
		} else {
			likeDAO.insertLike(like);
			return 1;
		}
	}
	
}
