package com.daol.library.reservationBook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.daol.library.reservationBook.service.ReservationBookService;

@Controller
public class ReservationBookController {
	@Autowired
	private ReservationBookService service;
	
}
