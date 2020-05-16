package com.dingpet.index.main.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dingpet.index.main.service.Index_Service;

import lombok.AllArgsConstructor;

/**
 * Handles requests for the application home page.
 */
@AllArgsConstructor
@Controller
public class HomeController {
	
	private Index_Service service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
				
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
	//--------------------------------명예 전당-------------------------------
		
		model.addAttribute("HoF", service.getHoF());
		
	//----------------------------------------------------------------------
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
}
