package ssn.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ssn.model.Post;
import ssn.model.User;
import ssn.service.PostService;
import ssn.service.TrendingService;
import ssn.service.UserService;

@Controller
public class PostDetailController {
	@Autowired
	private PostService postService;
	@Autowired
	private UserService userService;
	@Autowired
	private TrendingService trendingService;
	
	@RequestMapping(value = "/postDetail")
	public ModelAndView getPostDetail(@RequestParam int postID, HttpSession session) {
		User user = (User) session.getAttribute("currentUser");
		int userID = user.getUserId();
		Post post = postService.getPostByPostID(postID);
		post = postService.initPost(post, userID);
		List<User> listSuggestFollowing = userService.getSuggestFollowing(userID);
		List<String> listTrendingContent = trendingService.getTrendingContent();
		
		ModelAndView mav = new ModelAndView("postDetail");
		mav.addObject("currentUser", user);
		mav.addObject("postNF", post);
		mav.addObject("suggestFollowing", listSuggestFollowing);
		mav.addObject("trendingContent", listTrendingContent);
		return mav;
	}	
}
