package ssn.model;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class Hashtag {
	private String content;
	private int postID;
	private String dated;

	public Hashtag() {
		super();
	}

	public Hashtag(String content, int postID, String dated) {
		super();
		this.content = content;
		this.postID = postID;
		this.dated = dated;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPostID() {
		return postID;
	}

	public void setPostID(int postID) {
		this.postID = postID;
	}

	public String getDated() {
		return dated;
	}

	public void setDated(String dated) {
		this.dated = dated;
	}

}
