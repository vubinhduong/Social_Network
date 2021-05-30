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
public class SearchController {
	@Autowired
	private PostService postService;
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/search")
	public ModelAndView searchpage(@RequestParam String input, HttpSession session) {
		if(session.getAttribute("currentUser") == null) return new ModelAndView("404");
		List<User> listUserSearch = userService.getUserSearch(input);
		List<Post> listPostSearch = postService.getPostSearch(input, session);
		
		ModelAndView mav = new ModelAndView("searchpage");
		mav.addObject("listUserSearch", listUserSearch);
		mav.addObject("listPostSearch", listPostSearch);
		return mav;
	}

}
