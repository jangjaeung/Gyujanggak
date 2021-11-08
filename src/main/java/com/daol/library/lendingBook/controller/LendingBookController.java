package com.daol.library.lendingBook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.daol.library.lendingBook.service.LendingBookService;

@Controller
public class LendingBookController {
	@Autowired
	private LendingBookService service;
	
	@GetMapping("/lendingBookView.do")
	public String lendingBookView() {
		return "lendingBook/lendingBookView";
	}

}
