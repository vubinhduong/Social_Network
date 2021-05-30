package ssn.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ssn.model.PostMapper;
import ssn.model.Post;

@Repository
@Transactional
public class PostDAO {
	@Autowired
	private JdbcTemplate jtemplate;

	public Post getPostByPostID(int postID) {
		String sql = "SELECT * FROM posts WHERE postID=" + postID;
		return jtemplate.queryForObject(sql, new PostMapper());
	}
	
	public int getNewestPostID() {
		String sql = "SELECT postID FROM posts ORDER BY postID DESC LIMIT 1";
		return jtemplate.queryForObject(sql, Integer.class);
	}
	
	public List<Post> getNewPostByUserID(int userID) {
		String sql = "SELECT * FROM posts WHERE userID_posted = '" + userID + "' LIMIT 10";
		return jtemplate.query(sql, new PostMapper());
	}

	
	public List<Post> getNewPostByUserIDs(List<Integer> listUserID) {
		String sql = "SELECT * FROM posts WHERE userID_posted IN (";
		for (Integer integer : listUserID) {
			sql += integer;
			if (integer != listUserID.get(listUserID.size() - 1))
				sql += ",";
			else
				sql += ") ORDER BY timed DESC LIMIT 10";
		}
		return jtemplate.query(sql, new PostMapper());
	}

	
	public int getNumOfPostByUserID(int userID) {
		String sql = "SELECT COUNT(postID) AS num_post FROM posts WHERE userID_posted = " + userID;
		return jtemplate.queryForObject(sql, Integer.class);
	}

	
	public String getLastestLikeUser(int postID) {
		String sql = "SELECT nameShowed FROM users INNER JOIN post_like ON users.userID = post_like.userID WHERE postID = "
				+ postID + " LIMIT 1";
		String rs;
		try {
			rs = jtemplate.queryForObject(sql, String.class);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
		return rs;
	}

	
	public int getTotalPost() {
		String sql = "SELECT COUNT(postID) FROM posts";
		return jtemplate.queryForObject(sql, Integer.class);
	}

	
	public int post(Post post) {
		String sql = "INSERT INTO posts (userID_posted, content, image, timed) VALUES ( ?, ?, ?, ?)";
		System.out.println(sql);
		return jtemplate.update(sql, post.getUserID_posted(), post.getContent(), post.getImage(), post.getTimed());
	}
	
	
	public int getLikeYet(int postID, int userID) {
		String sql = "SELECT COUNT(postID) FROM post_like WHERE postID=" + postID + " AND userID=" + userID;
		return jtemplate.queryForObject(sql, Integer.class);
	}
}
