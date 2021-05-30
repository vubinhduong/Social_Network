package ssn.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class TrendingMapper implements RowMapper<Trending> {
	@Override
	public Trending mapRow(ResultSet rs, int rowNum) throws SQLException {
		Trending trending = new Trending(rs.getString(1), rs.getInt(2));
		return trending;
	}
}
