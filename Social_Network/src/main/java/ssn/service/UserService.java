package ssn.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssn.dao.UserDAO;
import ssn.model.Hashtag;
import ssn.model.User;
import ssn.service.UserService;

@Service
@Transactional
public class UserService {
	@Autowired
	UserDAO userDao;
	
	public boolean checkLoginUser(String username, String password) {
		List<User> listUser = userDao.getAllUser();
		for (User user : listUser) {
			if(user.getUsername().equals(username)) {
				if(user.getPassword().equals(password)) return true;
				return false;
			}
		}
		return false;
	}
	
	public User getUserByUsername(String username) {
		return userDao.getUserByUsername(username);
	}
	
	public User getUserByUserID(int userID) {
		return userDao.getUserByUserID(userID);
	}
	
	public List<User> getUsersByUserIDs(List<Integer> userIDList) {
		List<User> listUser = new ArrayList<User>();
		for (Integer userID : userIDList) {
			User user = getUserByUserID(userID);
			listUser.add(user);
		}
		return listUser;
	}
	
	public List<Integer> getListFollowingID (int userId) {
		return userDao.getAllFollowingUserID(userId);
	}
	
	public List<User> getSuggestFollowing(int userID) {
		List<Integer> userIDList = userDao.getSuggestFollow(userID);
		return getUsersByUserIDs(userIDList);
	}
	
	public List<User> getUserSearch(String input) {
		String[] listInput = input.split(" ");
		List<User> listUser = new ArrayList<User>();
		listUser.addAll(userDao.getUserLikeNameShowed(input));
		for (String inp : listInput) {
			if(listUser.size() >=5) break;
			listUser.addAll(userDao.getUserLikeNameShowed(inp));
		}
		return listUser;
	}
}
