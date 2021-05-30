package ssn.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ssn.model.Trending;
import ssn.model.TrendingMapper;

@Repository
@Transactional
public class TrendingDAO {
	@Autowired
	JdbcTemplate jtemplate;
	
	public List<Trending> getListTrending() {
		String sql = "SELECT * FROM trending ORDER BY num DESC";
		return jtemplate.query(sql, new TrendingMapper());
	}
}
