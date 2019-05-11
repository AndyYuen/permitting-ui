package com.redhat.bpms.webapp.action;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;


//import org.kie.api.task.model.TaskSummary;
//import org.kie.services.client.api.command.exception.RemoteCommunicationException;



import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.UrlBinding;
import net.sourceforge.stripes.validation.SimpleError;
import net.sourceforge.stripes.validation.Validate;

import com.redhat.bpms.security.NoLoginRequired;

@NoLoginRequired
@UrlBinding("/Login.action")
public class LoginActionBean extends BaseActionBean {


	
	private static final String LOGIN_PAGE = "/WEB-INF/jsp/login.jsp";
	private static final String ERROR_PAGE = "/error.jsp";
	private final String RPC_USER = "rpc_user";
	private static final Map<String, String> userMap;
    static
    {
    	userMap = new HashMap<String, String>();
    	userMap.put("ayuen", "password");
    	userMap.put("blee", "password");
    }
    
	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Validate(required=true, on="submitLogin")
	String user;
	
	@Validate(required=true, on="submitLogin")
	String password;

	@DefaultHandler
	public Resolution login() {
		return new ForwardResolution(LOGIN_PAGE);
	}
	
	public Resolution submitLogin() {

		Resolution resolution = null;
		HttpServletRequest request = actionBeanContext.getRequest();

		System.out.println("Attempting to login to RHPAM...user=" + user + " password=" + password);

		if (request.getUserPrincipal() != null) {
            try {
            	System.out.println("userPrincapal=" + request.getUserPrincipal() + " already logged in. Logging out");
				request.logout();
			} catch (ServletException e) {
				System.out.println("user=" + request.getUserPrincipal() + " : " + e.getMessage());
			}
        }


		
		// fake a success
		setLoggedInUser(user);
		setLoggedInUserPassword(password);

		Class beanClass = (Class) session.getAttribute("targetActionBean");
		System.out.println("Saved targetActionBean: " + beanClass);
		if (beanClass != null) {
			resolution =  new ForwardResolution(beanClass);
		}
		else {
			resolution = new ForwardResolution(HomeActionBean.class);
		}


		return resolution;


	}
	
	public Resolution cancelLogin() {
		return new RedirectResolution(HomeActionBean.class);
	}
	
	public Resolution logout() {
		try {
			actionBeanContext.getRequest().logout();
	    } catch (ServletException e) {
	    	getContext().getValidationErrors().addGlobalError(new SimpleError(e.getMessage()));
	      return  new ForwardResolution(ERROR_PAGE);
	    }
		setLoggedInUser(null);;
		return new RedirectResolution(HomeActionBean.class);
	}
	
	
}
