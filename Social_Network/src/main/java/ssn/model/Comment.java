package ssn.model;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class Comment {
	private int commentID;
	private int postID;
	private int userID;
	private String detail;
	private String timed;
	private User userComment;

	public Comment() {

	}

	public Comment(int commentID, int postID, int userID, String detail, String timed) {
		this.commentID = commentID;
		this.postID = postID;
		this.userID = userID;
		this.detail = detail;
		this.timed = timed;
	}

	public int getCommentID() {
		return commentID;
	}

	public void setCommentID(int commentID) {
		this.commentID = commentID;
	}

	public int getPostID() {
		return postID;
	}

	public void setPostID(int postID) {
		this.postID = postID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getTimed() {
		return timed;
	}

	public void setTimed(String timed) {
		this.timed = timed;
	}

	public User getUserComment() {
		return userComment;
	}

	public void setUserComment(User userComment) {
		this.userComment = userComment;
	}

}
