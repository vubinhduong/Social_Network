package ssn.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ssn.service.UserService;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = {"/", "/loginPage"})
	public String loginPage() {
		return "loginPage";
	}

	@RequestMapping(value = "/homepage")
	public ModelAndView login(@RequestParam("username") String username,
			@RequestParam("password") String password, HttpSession session) {
		if (userService.checkLoginUser(username, password)) {
			session.setAttribute("username", username);
			ModelAndView mav = new ModelAndView("/homepage");
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("/loginPage");
			return mav;
		}
	}

}
