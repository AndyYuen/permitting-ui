package com.redhat.bpms.webapp.action;

import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.UrlBinding;


@UrlBinding("/Task.action")
public class TaskActionBean extends BaseActionBean {


	private static final String TASK_PAGE = "/WEB-INF/jsp/task.jsp";

	String user;
	String password;

	public String getUser() {
		return user;
	}
	
	public String getPassword() {
		return password;
	}

	@DefaultHandler
	public Resolution showTasks() {
		user = getLoggedInUser();
		password = getLoggedInUserPassword();
		System.out.println("Logged in task user=" + user );
		return new ForwardResolution(TASK_PAGE);
	}
	

}
