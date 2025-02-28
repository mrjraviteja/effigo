package com.effigo.springthymeleafbase;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {

	// Inject the link from application.yml using @Value
    @Value("${app.security.link}")
    private String link;

    @GetMapping("/home")
    public String homePage(Model model) {
        model.addAttribute("message", "Welcome to the Spring Thymeleaf Example!");
        model.addAttribute("link", link);  // Use the injected link value
        return "home"; // This refers to home.html in the templates folder
    }
	
	@GetMapping("/upeg/idpLogin")
    public String idpLogin(@RequestParam(name = "jwtToken", required = false) String jwtToken, Model model) {
        if (jwtToken != null) {
            model.addAttribute("jwtToken", jwtToken);
            model.addAttribute("loginMessage", "You are logged in!");
        } else {
            model.addAttribute("loginMessage", "Token is missing, please provide a valid token.");
        }
        return "idpLogin"; // This refers to idpLogin.html in the templates folder
    }
	
	@GetMapping("/po")
	public String poPage()
	{
		return "poPage";
	}
	
	@GetMapping("/posearch")
	public String posearch()
	{
		return "drop";
	}
}
