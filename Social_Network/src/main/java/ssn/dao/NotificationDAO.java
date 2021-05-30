package ssn.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ssn.method.DatetimeMethod;
import ssn.model.Notification;
import ssn.model.NotificationMapper;

@Repository
@Transactional
public class NotificationDAO {
	@Autowired
	JdbcTemplate jtemplate;

	public List<Notification> getNotiByPostID(int postID) {
		String sql = "SELECT * FROM notification WHERE postID = " + postID;
		return jtemplate.query(sql, new NotificationMapper());
	}

	public List<Notification> getNotiByPostIDs(List<Integer> listPostID) {
		if (listPostID.size() == 0) {
			return null;
		}
		String input = "";
		for (int i = 0; i < listPostID.size(); i++) {
			input += listPostID.get(i);
			if (i != listPostID.size() - 1)
				input += ", ";
		}
		String sql = "SELECT * FROM notification WHERE postID IN (" + input + ") ORDER BY timed DESC";
		return jtemplate.query(sql, new NotificationMapper());
	}

	public void addNoti(int postID, int userID, int act) {
		String timeNow = DatetimeMethod.getTimeNow();
		String sql = "INSERT INTO notification (postID, userID, act, timed) VALUES (?, ?, ?, ?)";
		jtemplate.update(sql, postID, userID, act, timeNow);
	}

}
