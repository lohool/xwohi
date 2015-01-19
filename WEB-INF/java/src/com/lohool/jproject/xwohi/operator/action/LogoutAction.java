package com.lohool.jproject.xwohi.operator.action;

/**
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: lohool.com</p>
 * <p>mail:lohool@hotmail.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
import com.lohool.jproject.xwohi.operator.OperatorManagement;
import com.lohool.jproject.xwohi.operator.po.Operator;
import com.opensymphony.xwork2.*;
import static com.opensymphony.xwork2.Action.INPUT;
import static com.opensymphony.xwork2.Action.SUCCESS;
import java.util.Enumeration;



import javax.servlet.http.*;


import org.apache.struts2.ServletActionContext;

public class LogoutAction
        extends ActionSupport {

    @javax.annotation.Resource
    private OperatorManagement service;

    public String execute() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();

        String CONTENT_TYPE = request.getContentType();

        String remoteAddr = request.getRemoteAddr();


        Operator user = null;

        HttpSession session = request.getSession();

        user = (Operator) session.getAttribute("operation_user");
        
        Operator po=(Operator)service.load(user.getId());
        service.writeLoginLog(user.getId(), po.getAccount(), remoteAddr, 2, true);
        
        user=null;
        Enumeration<String> keys = session.getAttributeNames();
        while(keys.hasMoreElements())
        {
            session.removeAttribute(keys.nextElement());
        }
        
        return SUCCESS;

    }

    public OperatorManagement getService() {
        return service;
    }

    public void setService(OperatorManagement service) {
        this.service = service;
    }
}