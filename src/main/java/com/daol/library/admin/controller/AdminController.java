package com.daol.library.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.daol.library.admin.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
}
