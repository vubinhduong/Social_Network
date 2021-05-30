package ssn.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssn.dao.HashtagDAO;
import ssn.model.Hashtag;

@Service
@Transactional
public class HashtagService {
	@Autowired
	private HashtagDAO hashtagDAO;
	
	public List<Hashtag> getHashtagByInput(String input) {
		return hashtagDAO.getHastagByContent(input);
	}

	public void addHashTag(String content, int postID) {
		hashtagDAO.addHashtag(content, postID);
	}
	
}
