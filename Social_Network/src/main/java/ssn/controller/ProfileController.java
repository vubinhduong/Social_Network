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
import ssn.service.UserService;

@Controller
public class ProfileController {
	@Autowired
	UserService userService;
	@Autowired
	PostService postService;
	
	@RequestMapping(value = "/profile")
	public ModelAndView profilePage(@RequestParam int userId, HttpSession session) {
		if(session.getAttribute("currentUser") == null) return new ModelAndView("404");
		User user = userService.getUserByUserID(userId);
		User currentUser = (User) session.getAttribute("currentUser");
		int numPost = postService.getNumPost(userId);
		List<Post> listPost = postService.getPostByUserID(userId);
		listPost = postService.initPosts(listPost, currentUser.getUserId());
		List<Integer> listFollowingID = userService.getListFollowingID(currentUser.getUserId());
		int state = 0;
		if(listFollowingID.contains(user.getUserId())) state = 1;
		else if(user.getUserId() == currentUser.getUserId()) state = 2;
		
		ModelAndView mav = new ModelAndView("profile");
		mav.addObject("user", user);
		mav.addObject("numPost", numPost);
		mav.addObject("listPost", listPost);
		mav.addObject("state", state);
		return mav;
	}
	
}
