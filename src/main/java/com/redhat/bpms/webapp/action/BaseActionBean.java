package com.redhat.bpms.webapp.action;

import javax.servlet.http.HttpSession;


import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.ActionBeanContext;

public abstract class BaseActionBean implements ActionBean {

	private final String USER = "user";
	private final String PASSWORD = "password";
	
    protected ActionBeanContext actionBeanContext;
    protected HttpSession session;

    public ActionBeanContext getContext() {
        return actionBeanContext;
    }
    
    public void setContext(ActionBeanContext actionBeanContext) {
        this.actionBeanContext = actionBeanContext;
        session = actionBeanContext.getRequest().getSession();
    }
    
    public void setLoggedInUser(String user) {
    	session.setAttribute(USER, user);
    }
    
    public String getLoggedInUser() {
    	return (String) session.getAttribute(USER);
    	//return actionBeanContext.getRequest().getUserPrincipal().getName();
    }
    
    public void setLoggedInUserPassword(String password) {
    	session.setAttribute(PASSWORD, password);
    }
    
    public String getLoggedInUserPassword() {
    	return (String) session.getAttribute(PASSWORD);
    }
}
