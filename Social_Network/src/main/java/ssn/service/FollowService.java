package ssn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssn.dao.FollowDAO;
import ssn.model.Follow;

@Service
@Transactional
public class FollowService {
	@Autowired
	private FollowDAO followDAO;
	
	public void addFollow(int userID1, int userID2) {
		Follow follow = new Follow(userID1, userID2);
		followDAO.addFollow(follow);
	}
}
