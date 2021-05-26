package ssn.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssn.dao.PostDAO;
import ssn.dao.UserDAO;
import ssn.method.DatetimeMethod;
import ssn.model.Comment;
import ssn.model.Post;

@Service
@Transactional
public class PostService {
	@Autowired
	private PostDAO postDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CommentService commentService;
	
	public List<Post> getPostForNewsfeed(int userID) {
		System.out.println(userID);
		List<Integer> listFollowingUserID = userDAO.getAllFollowingUserID(userID);
		List<Post> listPostForNewsfeed = postDAO.getNewPostByUserIDs(listFollowingUserID);
		for (Post post : listPostForNewsfeed) {
			int postID = post.getPostID();
			post.setTimeAgo(DatetimeMethod.calTimeAgo(post.getTimed()));
			post.setComments(commentService.getComment(postID));
			post.setLatestLikeUser(postDAO.getLastestLikeUser(postID));
			post.setUserPosted(userDAO.getUserByUserID(post.getUserID_posted()));
		}
		return listPostForNewsfeed;
	}
	
	public int getNumPost (int userID) {
		return postDAO.getNumOfPostByUserID(userID);
	}
}
