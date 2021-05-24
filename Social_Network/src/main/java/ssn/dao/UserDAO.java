package ssn.dao;

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
		String sql = "SELECT * FROM Users";
		return jtemplate.query(sql, new UserMapper());
	}

}
