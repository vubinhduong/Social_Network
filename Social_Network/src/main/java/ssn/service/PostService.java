package ssn.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ssn.dao.PostDAO;
import ssn.dao.UserDAO;
import ssn.method.DatetimeMethod;
import ssn.model.Comment;
import ssn.model.Hashtag;
import ssn.model.Post;
import ssn.model.User;

@Service
@Transactional
public class PostService {
	@Autowired
	private PostDAO postDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CommentService commentService;
	@Autowired
	private HashtagService htagService;
	@Autowired
	private TrendingService trendingService;

	public Post getPostByPostID(int postID) {
		return postDAO.getPostByPostID(postID);
	}
	
	public List<Post> getPostByUserID(int userID) {
		return postDAO.getNewPostByUserID(userID);
	}
	
	public Post initPost(Post post, int userID) {
		int postID = post.getPostID();
		String lastestLikeUser = postDAO.getLastestLikeUser(postID);
		post.setTimeAgo(DatetimeMethod.calTimeAgo(post.getTimed()));
		post.setComments(commentService.getComment(postID));
		if (lastestLikeUser != null)
			post.setLatestLikeUser(lastestLikeUser);
		post.setUserPosted(userDAO.getUserByUserID(post.getUserID_posted()));
		post.setLikeYet(postDAO.getLikeYet(post.getPostID(), userID));
		return post;
	}
	
	public List<Post> initPosts(List<Post> listPost, int userID) {
		for (Post post : listPost) {
			post = initPost(post, userID);
		}
		return listPost;
	}
	
	public List<Post> getPostForNewsfeed(int userID) {
		List<Integer> listFollowingUserID = userDAO.getAllFollowingUserID(userID);
		listFollowingUserID.add(userID);
		List<Post> listPostForNewsfeed = postDAO.getNewPostByUserIDs(listFollowingUserID);
		for (Post post : listPostForNewsfeed) {
			post = initPost(post, userID);
		}
		return listPostForNewsfeed;
	}

	public int getNumPost(int userID) {
		return postDAO.getNumOfPostByUserID(userID);
	}

	public boolean createPost(Post post) {
		if (postDAO.post(post) == 1)
			return true;
		else
			return false;
	}

	public int getTotalPost() {
		return postDAO.getTotalPost();
	}
	
	public List<Post> getPostSearch(String input, HttpSession session) {
		int userID = ((User) session.getAttribute("currentUser")).getUserId();
		List<Hashtag> listHtag = htagService.getHashtagByInput(input);
		List<Post> listPost = new ArrayList<Post>();
		for (Hashtag h : listHtag) {
			if(listPost.size() >= 5) break;
			Post post = getPostByPostID(h.getPostID());
			post = initPost(post, userID);
			listPost.add(post);
		}
		return listPost;
	}
	
	public List<Post> getPostTrending(HttpSession session) {
		List<String> listContent = trendingService.getTrendingContent();
		String input = "";
		for (String string : listContent) {
			input += string + " ";
		}
		int userID = ((User) session.getAttribute("currentUser")).getUserId();
		List<Hashtag> listHtag = htagService.getHashtagByInput(input);
		List<Post> listPost = new ArrayList<Post>();
		for (Hashtag h : listHtag) {
			if(listPost.size() >= 5) break;
			Post post = getPostByPostID(h.getPostID());
			post = initPost(post, userID);
			listPost.add(post);
		}
		return listPost;
	}

	public int getNewestPostID() {
		return postDAO.getNewestPostID();
	}
	
}
