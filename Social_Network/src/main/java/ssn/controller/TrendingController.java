package ssn.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ssn.model.Post;
import ssn.service.PostService;
import ssn.service.TrendingService;

@Controller
public class TrendingController {
	@Autowired
	private PostService postService;
	
	@RequestMapping(value = "/trending")
	public ModelAndView trendingPage(HttpSession session) {
		if(session.getAttribute("currentUser") == null) return new ModelAndView("404");
		List<Post> listPost = postService.getPostTrending(session);

		ModelAndView mav = new ModelAndView("trending");
		mav.addObject("listPost", listPost);
		return mav;
	}
	
	@RequestMapping(value = "/trend")
	public ModelAndView trendingPage(@RequestParam String content, HttpSession session) {
		if(session.getAttribute("currentUser") == null) return new ModelAndView("404");
		List<Post> listPost = postService.getPostSearch(content, session);

		ModelAndView mav = new ModelAndView("trending");
		mav.addObject("listPost", listPost);
		return mav;
	}
}
