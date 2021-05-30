package ssn.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ssn.model.Like;

@Repository
@Transactional
public class LikeDAO {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public boolean checkLikeExist(Like like) {
		String sql = "SELECT COUNT(postID) FROM post_like WHERE postID=" + like.getPostID() + " AND userID="
				+ like.getUserID();
		int check = jdbcTemplate.queryForObject(sql, Integer.class);
		return (check==1);
	}

	public void insertLike(Like like) {
		String sql = "INSERT INTO post_like VALUES (" + like.getPostID() + ", " + like.getUserID() + ");";
		jdbcTemplate.update(sql);
	}
	
	public void deleteLike(Like like) {
		String sql = "DELETE FROM post_like WHERE (postID=" + like.getPostID() + ") AND (userID= " + like.getUserID() + ");";
		jdbcTemplate.update(sql);
	}
	
}
