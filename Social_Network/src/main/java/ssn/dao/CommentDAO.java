package ssn.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ssn.method.DatetimeMethod;
import ssn.model.Comment;
import ssn.model.CommentMapper;

@Repository
@Transactional
public class CommentDAO {
	@Autowired
	JdbcTemplate jtemplate;
	
	public List<Comment> getCommentByPostID(int postID) {
		String sql = "SELECT * FROM comments WHERE postID = " + postID;
		return jtemplate.query(sql, new CommentMapper());
	}
	
	public void comment(int postID, int userID, String content) {
		String timeNow = DatetimeMethod.getNow();
		String sql = "INSERT INTO comments (postID, userID, detail, timed) VALUES (?, ?, ?, ?);";
		jtemplate.update(sql, postID, userID, content, timeNow);
	}
	
}
