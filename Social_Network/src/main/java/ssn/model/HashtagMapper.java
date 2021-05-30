package ssn.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class HashtagMapper implements RowMapper<Hashtag> {
	@Override
	public Hashtag mapRow(ResultSet rs, int rowNum) throws SQLException {
		Hashtag hashtag = new Hashtag(rs.getString(1), rs.getInt(2), rs.getString(3));
		return hashtag;
	}
}
