package ssn.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ssn.model.Notification;
import ssn.model.Post;
import ssn.model.User;
import ssn.service.FollowService;
import ssn.service.HashtagService;
import ssn.service.NotificationService;
import ssn.service.PostService;
import ssn.service.TrendingService;
import ssn.service.UserService;

@Controller
public class HomepageController {
	@Autowired
	private PostService postService;
	@Autowired
	private UserService userService;
	@Autowired
	private FollowService followService;
	@Autowired
	private HashtagService htagService;
	@Autowired
	private TrendingService trendingService;
	@Autowired
	private NotificationService notiService;

	@RequestMapping(value = "/homepage")
	public ModelAndView homepage(HttpSession session) {
		User currentUser = (User) session.getAttribute("currentUser");
		if(currentUser == null) return new ModelAndView("404");
		int userID = currentUser.getUserId();
		int numPost = postService.getNumPost(userID);
		List<Post> listPostForNewsfeed = postService.getPostForNewsfeed(userID);
		List<User> listSuggestFollowing = userService.getSuggestFollowing(userID);
		List<String> listTrendingContent = trendingService.getTrendingContent();
		List<Notification> listNoti = notiService.getNotiByUserID(userID);
		if (listNoti != null)
			listNoti = notiService.initNofi(listNoti);
		session.setAttribute("listNoti", listNoti);

		ModelAndView mav = new ModelAndView("homepage");
		mav.addObject("listPostNF", listPostForNewsfeed);
		mav.addObject("currentUser", currentUser);
		mav.addObject("numPost", numPost);
		mav.addObject("suggestFollowing", listSuggestFollowing);
		mav.addObject("trendingContent", listTrendingContent);
		return mav;
	}

	@RequestMapping(value = "/post")
	public String post(@RequestParam String content, @RequestParam MultipartFile multipartFile, HttpSession session) {
		int numPost = postService.getTotalPost() + 1;
		String image = "post-image-" + numPost + ".jpg";
//		String src = System.getProperty("user.dir").replaceAll("\\\\", "/") + "/src/main/webapp/resources/images";
		String src = "C:/Users/coder/eclipse-workspace/eclipse-workspace-mainspace/School_Social_Network"
				+ "/src/main/webapp/resources/images";
		File file = new File(src, image);
		try {
			multipartFile.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Post post = new Post(session, content, "/resources/images/" + image);
		postService.createPost(post);
		int postID = postService.getNewestPostID();
		htagService.addHashTag(content, postID);
		return "redirect:homepage";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("currentUser");
		return "redirect:loginPage";
	}

	@RequestMapping(value = "/follow")
	public String follow(@RequestParam int userId, HttpSession session) {
		int userID1 = ((User) session.getAttribute("currentUser")).getUserId();
		followService.addFollow(userID1, userId);
		return "redirect:homepage";
	}
}
