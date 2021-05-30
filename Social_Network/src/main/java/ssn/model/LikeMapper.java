package ssn.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class LikeMapper implements RowMapper<Like> {
	@Override
	public Like mapRow(ResultSet rs, int rowNum) throws SQLException {
		Like like = new Like(rs.getInt(1), rs.getInt(2));
		return like;
	}
}
