package ssn.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ssn.model.Follow;

@Repository
@Transactional
public class FollowDAO {
	@Autowired
	JdbcTemplate jtemplate;
	
	public void addFollow(Follow follow) {
		String sql = "INSERT INTO following VALUES(?, ?);";
		jtemplate.update(sql, follow.getUserId1(), follow.getUserId2());
	}
}
