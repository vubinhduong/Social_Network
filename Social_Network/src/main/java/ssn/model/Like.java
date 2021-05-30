package ssn.model;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class Like {
	private int postID;
	private int userID;

	public Like() {
		super();
	}

	public Like(int postID, int userID) {
		super();
		this.postID = postID;
		this.userID = userID;
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

}
