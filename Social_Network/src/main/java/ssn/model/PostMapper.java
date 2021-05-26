package ssn.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class PostMapper implements RowMapper<Post> {
	@Override
	public Post mapRow(ResultSet rs, int rowNum) throws SQLException {
		Post post = new Post(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
				rs.getInt(6));
		return post;
	}
}
