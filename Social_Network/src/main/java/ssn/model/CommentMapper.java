package ssn.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CommentMapper implements RowMapper<Comment> {
	@Override
	public Comment mapRow(ResultSet rs, int rowNum) throws SQLException {
		Comment comment = new Comment(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5));
		return comment;
	}
}
