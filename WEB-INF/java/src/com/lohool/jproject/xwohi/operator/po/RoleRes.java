package com.lohool.jproject.xwohi.operator.po;
// @hibernate.class  table="T_RoleRes"  dynamic-update="true"  dynamic-insert="true"

import java.util.Set;
/**
 *
 * <p>Title: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: lohool.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
public class RoleRes{
	private int roleID;
	private Resource resource;
    private long limit;
    private int id;


	public void setRoleID(int roleID)
	{
		this.roleID = roleID;
	}
    /**
     * @hibernate.property length="8"
     * @return
     */
	public int getRoleID( )
	{
		return this.roleID;
	}
	public void setResource(Resource resource)
	{
		this.resource = resource;
	}

    /**
     * @hibernate.one-to-one class="com.lohool.jproject.xwohi.operator.po.Resource"
     * @return Resource
     */

    public Resource getResource()
    {
        return this.resource;
    }
    /**
     * @hibernate.property length="10"
     * @return
     */
    public long getLimit()
    {
        return limit;
    }
    public void setLimit(long limit)
    {
        this.limit = limit;
    }
    /**
     * @hibernate.id  generator-class="native" length="8"
     * @return
     */
    public int getId()
    {
        return id;
    }
    public void setId(int id)
    {
        this.id = id;
    }
}
