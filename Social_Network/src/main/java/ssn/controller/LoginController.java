package ssn.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ssn.model.User;
import ssn.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = {"/", "/loginPage"})
	public String loginPage() {
		return "loginPage";
	}

	@RequestMapping(value = "/login")
	public String login(@RequestParam("username") String username,
			@RequestParam("password") String password, HttpSession session) {
		if (userService.checkLoginUser(username, password)) {
			User user = userService.getUserByUsername(username);
			session.setAttribute("currentUser", user);
			return "redirect:homepage";
		} else {
			return "redirect:login";
		}
	}

}
