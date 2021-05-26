package ssn.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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
	
}
