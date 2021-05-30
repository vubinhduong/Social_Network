package ssn.model;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class Notification {
	private int notifiID;
	private int postID;
	private int userID;
	private int act;
	private String time;
	private String nameShowed;
	private String timeAgo;
	private String content;
	private String avatar;

	public Notification() {
		super();
	}

	public Notification(int notifiID, int postID, int userID, int act, String time) {
		super();
		this.notifiID = notifiID;
		this.postID = postID;
		this.userID = userID;
		this.act = act;
		this.time = time;
	}

	public int getNotifiID() {
		return notifiID;
	}

	public void setNotifiID(int notifiID) {
		this.notifiID = notifiID;
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

	public int getAct() {
		return act;
	}

	public void setAct(int act) {
		this.act = act;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getNameShowed() {
		return nameShowed;
	}

	public void setNameShowed(String nameShowed) {
		this.nameShowed = nameShowed;
	}

	public String getTimeAgo() {
		return timeAgo;
	}

	public void setTimeAgo(String timeAgo) {
		this.timeAgo = timeAgo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

}
