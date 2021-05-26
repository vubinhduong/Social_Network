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

@Controller
public class HomepageController {
	@Autowired
	private PostService postService;
	
	@RequestMapping(value = "/homepage")
	public ModelAndView homepage(HttpSession session) {
		User currentUser = (User) session.getAttribute("currentUser");
		int userID = currentUser.getUserId();
		List<Post> listPostForNewsfeed = postService.getPostForNewsfeed(userID);
		int numPost = postService.getNumPost(userID);
		ModelAndView mav = new ModelAndView("homepage");
		mav.addObject("listPostNF", listPostForNewsfeed);
		mav.addObject("currentUser", currentUser);
		mav.addObject("numPost", numPost);
		return mav;
	}
}
