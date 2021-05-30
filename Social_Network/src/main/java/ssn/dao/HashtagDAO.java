package ssn.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ssn.method.DatetimeMethod;
import ssn.method.StringMethod;
import ssn.model.Hashtag;
import ssn.model.HashtagMapper;

@Repository
@Transactional
public class HashtagDAO {
	private final int DAYS = 7;
	@Autowired
	JdbcTemplate jtemplate;

	public List<String> getAllHtagContent() {
		String sql = "SELECT content FROM trending_post";
		return jtemplate.queryForList(sql, String.class);
	}

	public List<Hashtag> getTrendingHashtag() {
		Date dateNow = new Date();
		Date dateBefore = DatetimeMethod.subtractDays(dateNow, DAYS);
		String sql = "SELECT * FROM trending_post WHERE dated BETWEEN "
				+ DatetimeMethod.formatDate(dateBefore, "yyyy-MM-dd") + " AND "
				+ DatetimeMethod.formatDate(dateNow, "yyyy-MM-dd");
		return jtemplate.query(sql, new HashtagMapper());
	}

	public List<Hashtag> getHastagByContent(String input) {
		String[] listInput = input.split(" ");
		List<Hashtag> listHashtag = new ArrayList<Hashtag>();
		for (String inp : listInput) {
			if (listHashtag.size() >= 5) {
				break;
			}
			String sql = "SELECT * FROM trending_post WHERE content = '" + inp + "';";
			listHashtag.addAll(jtemplate.query(sql, new HashtagMapper()));
		}
		return listHashtag;
	}

	public void addHashtag(String content, int postID) {
		String timeNow = DatetimeMethod.getNow();
		List<String> listContent = getAllHtagContent();
		List<String> listHtag = StringMethod.getHashTag(content);
		for (String string : listHtag) {
			System.out.println(string);
			if (listContent.contains(string)) {
				String sql1 = "UPDATE trending SET num = num + 1 WHERE content = '" + string + "'";
				jtemplate.update(sql1);
			} else {
				String sql1 = "INSERT INTO trending VALUES (?, ?)";
				jtemplate.update(sql1, string, 1);
			}
			String sql2 = "INSERT INTO trending_post VALUES (?, ?, ?)";
			jtemplate.update(sql2, string, postID, timeNow);
		}
	}
}
