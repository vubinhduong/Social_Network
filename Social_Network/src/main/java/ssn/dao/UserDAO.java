package ssn.dao;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ssn.model.User;
import ssn.model.UserMapper;

@Repository
@Transactional
public class UserDAO {
	@Autowired
	private JdbcTemplate jtemplate;

	public List<User> getAllUser() {
		String sql = "SELECT * FROM users";
		return jtemplate.query(sql, new UserMapper());
	}
	
	public List<Integer> getAllUserID() {
		String sql = "SELECT userID FROM users";
		return jtemplate.queryForList(sql, Integer.class);
	}

	public List<Integer> getAllFollowingUserID(int userID) {
		String sql = "SELECT userID FROM users WHERE userID IN (SELECT userID_2 FROM following WHERE userID_1 = '" + userID
				+ "')";
		return jtemplate.queryForList(sql, Integer.class);
	}
	
	public User getUserByUsername(String username) {
		String sql = "SELECT * FROM users WHERE user_name = '" + username + "' LIMIT 1";
		return jtemplate.queryForObject(sql, new UserMapper());
	}
	
	public List<User> getUserLikeNameShowed(String nameShowed) {
		String sql = "SELECT * FROM users WHERE nameShowed LIKE '%" + nameShowed + "%' LIMIT 5";
		return jtemplate.query(sql, new UserMapper());
	}
	
	public User getUserByUserID(int userID) {
		String sql = "SELECT * FROM users WHERE userID = '" + userID + "' LIMIT 1";
		return jtemplate.queryForObject(sql, new UserMapper());
	}
	
	public List<Integer> getSuggestFollow(int userID) {
		List<Integer> listFollowingID = getAllFollowingUserID(userID);
		List<Integer> listAllUserID = getAllUserID();
		listFollowingID.add(userID);
		listAllUserID.removeAll(listFollowingID);
		Collections.shuffle(listAllUserID);
		return listAllUserID;
	}
}
