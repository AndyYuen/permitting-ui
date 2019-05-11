package com.redhat.bpms.webapp.action;

import com.redhat.bpms.security.NoLoginRequired;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.UrlBinding;

@NoLoginRequired
@UrlBinding("/Home.action")
public class HomeActionBean extends BaseActionBean {

	private static final String HOME_PAGE = "/WEB-INF/jsp/home.jsp";
	

	   @DefaultHandler
	    public Resolution showHomePage() {
		   return new ForwardResolution(HOME_PAGE);
	   }
}
