package com.lohool.jproject.xwohi.operator.po;

public class UserRole {
	private long userID;
	private int roleID;
	private long grantorID;

	public void setUserID(long userID)
	{
		this.userID = userID;
	}
	public long getUserID( )
	{
		return this.userID;
	}
	public void setRoleID(int roleID)
	{
		this.roleID = roleID;
	}
	public int getRoleID( )
	{
		return this.roleID;
	}
	public void setGrantorID(long grantorID)
	{
		this.grantorID = grantorID;
	}
	public long getGrantorID( )
	{
		return this.grantorID;
	}
}
