package ssn.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssn.dao.TrendingDAO;
import ssn.model.Trending;

@Service
@Transactional
public class TrendingService {
	@Autowired
	private TrendingDAO trendingDAO;
	
	public List<String> getTrendingContent() {
		List<Trending> listTrending = trendingDAO.getListTrending();
		List<String> listContent = new ArrayList<String>();
		for (Trending trending : listTrending) {
			listContent.add(trending.getContent());
		}
		return listContent;
	}
}
