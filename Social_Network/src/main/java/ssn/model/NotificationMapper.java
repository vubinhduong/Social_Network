package ssn.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class NotificationMapper implements RowMapper<Notification>{
	@Override
	public Notification mapRow(ResultSet rs, int rowNum) throws SQLException {
		Notification notification = new Notification(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), rs.getString(5));
		return notification;
	}
}
