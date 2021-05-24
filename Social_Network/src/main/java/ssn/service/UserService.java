package ssn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssn.dao.UserDAO;
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
	
}
