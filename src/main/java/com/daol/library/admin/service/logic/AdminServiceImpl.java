package com.daol.library.admin.service.logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daol.library.admin.service.AdminService;
import com.daol.library.admin.store.AdminStore;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminStore store;
}
