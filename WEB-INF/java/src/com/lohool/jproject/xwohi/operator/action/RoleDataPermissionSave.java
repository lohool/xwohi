/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lohool.jproject.xwohi.operator.action;


import com.lohool.jproject.xwohi.operator.po.Role;
import com.xbreeze.framework.xwohi.common.action.AbstractAction;
import com.xwohi.framework.common.service.ModifyService;
import java.util.Map;
import javax.annotation.Resource;

/**
 *
 * @author xingbao-
 */
public class RoleDataPermissionSave extends AbstractAction

{
    private Role vo;
    private int state;
    @Resource(name="RoleDataPermissionSaveService")
    private RoleDataPermissionSaveService service;
        public String doExecute() throws java.lang.Exception
    {

        Map paraMaps=this.getParameterMap();


        getService().execute(getVo(),paraMaps, getActionURL(), Role.class, null, getUser());
        return SUCCESS;
    }

    /**
     * @return the vo
     */
    public Role getVo()
    {
        return vo;
    }

    /**
     * @param vo the vo to set
     */
    public void setVo(Role vo)
    {
        this.vo = vo;
    }

    /**
     * @return the service
     */
    public RoleDataPermissionSaveService getService()
    {
        return service;
    }

    /**
     * @param service the service to set
     */
    public void setService(RoleDataPermissionSaveService service)
    {
        this.service = service;
    }

}
