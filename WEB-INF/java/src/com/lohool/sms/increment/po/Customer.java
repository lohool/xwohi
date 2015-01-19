package com.lohool.sms.increment.po;

import com.xwohi.framework.common.security.po.Operator;
import java.util.*;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
/**
  * @hibernate.class  table="t_customer"  dynamic-update="true"  dynamic-insert="true"
*/
@Entity
@Table(name="t_customer")
public class Customer implements Operator {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String company;
	private String name;
	private java.sql.Date birthday;
	private String idCardNo;
	private String phone;
	private String mobile;
	private String address;
        @Transient
	private java.util.Set tradeLog;
	private String job;
	private String speciality;
	private String favorite;
	private String custom;
	private String personlity;
	private int accecptProductNews;
	private int acceptInfoRemind;
	private java.sql.Date memoryDay;
        @ManyToOne(fetch = FetchType.LAZY)
	private com.lohool.sms.increment.po.CustomerGroup group;
	private String vipCard;
	private int sex;
	private String password;
	private int state;
	private String account;
        

        @Transient
        private Set roles;

    /**
     * �Ƚ������Ƿ���ͬ
     * @param pwd
     * @return
     */
    public boolean matchPassword(String pwd)
    {
        if (pwd == null || getPassword() == null)
        {
            return false;
        }
        return this.getPassword().equals(pwd);
    }
    public boolean isAccess( String resURL)
    {
        return true;
    }

	public void setId(int id)
	{
		this.id = id;
	}
	/**
	 * @hibernate.id  generator-class="native" column="id"
	 */
	public int getId( )
	{
		return this.id;
	}
	public void setCompany(String company)
	{
		this.company = company;
	}
	/**
	  * @hibernate.property column="company"
	 */
	public String getCompany( )
	{
		return this.company;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	/**
	  * @hibernate.property column="name"
	 */
	public String getName( )
	{
		return this.name;
	}
	public void setBirthday(java.sql.Date birthday)
	{
		this.birthday = birthday;
	}
	/**
	  * @hibernate.property column="birthday"
	 */
	public java.sql.Date getBirthday( )
	{
		return this.birthday;
	}
	public void setIdCardNo(String idCardNo)
	{
		this.idCardNo = idCardNo;
	}
	/**
	  * @hibernate.property column="idCardNo"
	 */
	public String getIdCardNo( )
	{
		return this.idCardNo;
	}
	public void setPhone(String phone)
	{
		this.phone = phone;
	}
	/**
	  * @hibernate.property column="phone"
	 */
	public String getPhone( )
	{
		return this.phone;
	}
	public void setMobile(String mobile)
	{
		this.mobile = mobile;
	}
	/**
	  * @hibernate.property column="mobile"
	 */
	public String getMobile( )
	{
		return this.mobile;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	/**
	  * @hibernate.property column="address"
	 */
	public String getAddress( )
	{
		return this.address;
	}
	public void setTradeLog(java.util.Set tradeLog)
	{
		this.tradeLog = tradeLog;
	}
	/**
	* @hibernate.set name="tradeLog" cascade="all" inverse="true" lazy="false"
	* @hibernate.collection-key column="id"
	* @hibernate.collection-one-to-many
	*       class="com.lohool.sms.increment.po.TradeLog"
	*       outer-join="false"
	 */
	public java.util.Set getTradeLog( )
	{
		return this.tradeLog;
	}
	public void setJob(String job)
	{
		this.job = job;
	}
	/**
	  * @hibernate.property column="job"
	 */
	public String getJob( )
	{
		return this.job;
	}
	public void setSpeciality(String speciality)
	{
		this.speciality = speciality;
	}
	/**
	  * @hibernate.property column="speciality"
	 */
	public String getSpeciality( )
	{
		return this.speciality;
	}
	public void setFavorite(String favorite)
	{
		this.favorite = favorite;
	}
	/**
	  * @hibernate.property column="favorite"
	 */
	public String getFavorite( )
	{
		return this.favorite;
	}
	public void setCustom(String custom)
	{
		this.custom = custom;
	}
	/**
	  * @hibernate.property column="custom"
	 */
	public String getCustom( )
	{
		return this.custom;
	}
	public void setPersonlity(String personlity)
	{
		this.personlity = personlity;
	}
	/**
	  * @hibernate.property column="personlity"
	 */
	public String getPersonlity( )
	{
		return this.personlity;
	}
	public void setAccecptProductNews(int accecptProductNews)
	{
		this.accecptProductNews = accecptProductNews;
	}
	/**
	  * @hibernate.property column="accecptProductNews"
	 */
	public int getAccecptProductNews( )
	{
		return this.accecptProductNews;
	}
	public void setAcceptInfoRemind(int acceptInfoRemind)
	{
		this.acceptInfoRemind = acceptInfoRemind;
	}
	/**
	  * @hibernate.property column="acceptInfoRemind"
	 */
	public int getAcceptInfoRemind( )
	{
		return this.acceptInfoRemind;
	}
	public void setMemoryDay(java.sql.Date memoryDay)
	{
		this.memoryDay = memoryDay;
	}
	/**
	  * @hibernate.property column="memoryDay"
	 */
	public java.sql.Date getMemoryDay( )
	{
		return this.memoryDay;
	}
	public void setGroup(com.lohool.sms.increment.po.CustomerGroup group)
	{
		this.group = group;
	}
	/**
	* @hibernate.many-to-one
	*       class="com.lohool.sms.increment.po.CustomerGroup"
	*       name="group"
	*       column="groupId"
	*       cascade="none"
	*       lazy="false"
	*       outer-join="true"
	 */
	public com.lohool.sms.increment.po.CustomerGroup getGroup( )
	{
		return this.group;
	}
	public void setVipCard(String vipCard)
	{
		this.vipCard = vipCard;
	}
	/**
	  * @hibernate.property column="vipCard"
	 */
	public String getVipCard( )
	{
		return this.vipCard;
	}
	public void setSex(int sex)
	{
		this.sex = sex;
	}
	/**
	  * @hibernate.property column="sex"
	 */
	public int getSex( )
	{
		return this.sex;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	/**
	  * @hibernate.property column="password"
	 */
	public String getPassword( )
	{
		return this.password;
	}
	public void setState(int state)
	{
		this.state = state;
	}
	/**
	  * @hibernate.property column="state"
	 */
	public int getState( )
	{
		return this.state;
	}
	public void setAccount(String account)
	{
		this.account = account;
	}
	/**
	  * @hibernate.property column="account"
	 */
	public String getAccount( )
	{
		return this.account;
	}
    public Collection getRoles()
    {
        return roles;
    }

    public boolean equals(Object obj)
    {
        if (! (obj instanceof Customer))
            return false;
        Customer c = (Customer) obj;
        return c.getId() ==id;
    }

    public int hashCode()
    {
        return id;
    }

    @Override
    public boolean isPermited(String resURL, Object vo)
    {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public String getPermission(String resURL, Object vo)
    {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public String getPermitedGroups(String resURL, Object vo, int permission)
    {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean isPermitted(String groupObjectName, int groupID, int permissionValue) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public String getPermitedGroups(String groupObjectName, int permission) {
        throw new UnsupportedOperationException("Not supported yet.");
    }




}
