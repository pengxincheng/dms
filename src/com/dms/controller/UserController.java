package com.dms.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dms.entity.User;
import com.dms.service.UserService;

/**
 *@author pxc
 *@date ：2017年2月22日 下午11:18:33
 */

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, String username,String password, Model model){
		
		User currentUser = userService.checkLogin(username,password);
		if(null != currentUser){
			request.getSession().setAttribute("currentUser", currentUser);
		}
		return "redirect:/index.jsp";
		
	}

}
