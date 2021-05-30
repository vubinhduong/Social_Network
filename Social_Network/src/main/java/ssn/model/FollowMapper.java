package ssn.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class FollowMapper implements RowMapper<Follow> {
	@Override
	public Follow mapRow(ResultSet rs, int rowNum) throws SQLException {
		Follow follow = new Follow(rs.getInt(1), rs.getInt(2));
		return follow;
	}
}
