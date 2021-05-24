package com.callor.todo.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RequestForwardController {

	private final static String prefix = "/WEB-INF/views/";
	private final static String surfix = ".jsp";
	
	public static void forward(HttpServletRequest req, HttpServletResponse resp, String file) throws ServletException, IOException {
		String viewfile = prefix + file + surfix;
		req.getRequestDispatcher(viewfile).forward(req, resp);
	}
	
}
