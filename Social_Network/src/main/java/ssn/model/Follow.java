package ssn.model;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class Follow {
	private int userId1;
	private int userId2;

	public Follow() {
		super();
	}

	public Follow(int userId1, int userId2) {
		super();
		this.userId1 = userId1;
		this.userId2 = userId2;
	}

	public int getUserId1() {
		return userId1;
	}

	public void setUserId1(int userId1) {
		this.userId1 = userId1;
	}

	public int getUserId2() {
		return userId2;
	}

	public void setUserId2(int userId2) {
		this.userId2 = userId2;
	}

}
