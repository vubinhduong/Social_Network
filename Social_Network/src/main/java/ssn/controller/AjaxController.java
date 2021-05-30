package ssn.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ssn.model.Like;
import ssn.service.CommentService;
import ssn.service.LikeService;
import ssn.service.NotificationService;

@Controller
@RequestMapping(value = "/ajax")
public class AjaxController {
	@Autowired
	private LikeService likeService;
	@Autowired
	private NotificationService notiService;
	@Autowired
	private CommentService commentService;

	@RequestMapping(value = "/like")
	@ResponseBody
	public void like(@RequestParam int userID, @RequestParam int postID) {
		if (likeService.like(new Like(postID, userID)) == 1) {
			notiService.addNoti(postID, userID, 0);
		}
	}

	@RequestMapping(value = "/comment")
	@ResponseBody
	public void comment(@RequestParam int postID, @RequestParam int userID, @RequestParam String content) {
		commentService.comment(postID, userID, content);
		notiService.addNoti(postID, userID, 1);
	}
}
