package ssn.model;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class Post {
	private int postID;
	private int userID_posted;
	private String content;
	private String image;
	private String timed;
	private int liked;
	private String timeAgo;
	private List<Comment> comments;
	private User userPosted;
	private String latestLikeUser;

	public Post() {
		super();
	}

	public Post(int postID, int userID_posted, String content, String image, String timed, int liked) {
		super();
		this.postID = postID;
		this.userID_posted = userID_posted;
		this.content = content;
		this.image = image;
		this.timed = timed;
		this.liked = liked;
	}

	public int getPostID() {
		return postID;
	}

	public void setPostID(int postID) {
		this.postID = postID;
	}

	public int getUserID_posted() {
		return userID_posted;
	}

	public void setUserID_posted(int userID_posted) {
		this.userID_posted = userID_posted;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getTimed() {
		return timed;
	}

	public void setTimed(String timed) {
		this.timed = timed;
	}

	public int getLiked() {
		return liked;
	}

	public void setLiked(int liked) {
		this.liked = liked;
	}

	public String getTimeAgo() {
		return timeAgo;
	}

	public void setTimeAgo(String timeAgo) {
		this.timeAgo = timeAgo;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public User getUserPosted() {
		return userPosted;
	}

	public void setUserPosted(User userPosted) {
		this.userPosted = userPosted;
	}

	public String getLatestLikeUser() {
		return latestLikeUser;
	}

	public void setLatestLikeUser(String latestLikeUser) {
		this.latestLikeUser = latestLikeUser;
	}

}
