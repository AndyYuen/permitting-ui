package com.redhat.bpms.webapp.action;

import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.UrlBinding;


@UrlBinding("/OrderPermittingApplication.action")
public class OrderPermittingApplicationActionBean extends BaseActionBean {

	
	private static final String FORM_PAGE = "/WEB-INF/jsp/OrderPermittingApplication.jsp";
	private static final String HOME_PAGE = "/WEB-INF/jsp/home.jsp";
	
	   @DefaultHandler
	    public Resolution showMortgageApplicationForm() {
			return new ForwardResolution(FORM_PAGE);
	   }
	    
	    public Resolution cancel() {
		   System.out.println("MortgageApplication cancelled");
		   return new ForwardResolution(HOME_PAGE);
	   }
}

