package com.lohool.jproject.xwohi.operator.po;

import java.util.*;

import com.lohool.jproject.xwohi.po.*;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;


import com.xwohi.framework.common.dao.OperationManagementImpl;
import javax.persistence.*;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

/**
 * <p>Operator PO</p>
 * @hibernate.class  table="author"  dynamic-update="true"  dynamic-insert="true"
 * @hibernate.query name="selectUserByAccount"
 * query="from Operator obj  where obj.account = ? "
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: lohool.com</p>
 * <p>mail:lohool@hotmail.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

/*
      @Validations(
     requiredStrings = {
     @RequiredStringValidator(fieldName = "account", key = "user_name.requiredstring",
           message = "user_name非空判断消息："),
     @RequiredStringValidator(fieldName = "password", message = "pass_word非空判断消息：", 
          key = "pass_word.requiredstring")
     }
  )
*/
@Entity
@Table(name = "t_Operator")

public class Operator
        implements com.xwohi.framework.common.security.po.Operator
{

    @Transient
    public static List ACTION_URLS;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    //@SequenceGenerator(name = "SEQ_Operator_ID", allocationSize = 1, initialValue = 1, sequenceName = "SEQ_Operator_ID")
    //@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_Operator_ID")
    private int id;
    /**
     * 账号
     */
    @Column(name = "account")


    private String account;
    private String password;
    private int state;
    @Transient
    private String password2;
    /**
     * @hibernate.set name="roles" table="T_UserRole"
     *                cascade="none" inverse="false"
     * @hibernate.collection-key column="opID"
     * @hibernate.collection-many-to-many
     *       class="com.lohool.jproject.xwohi.operator.po.Role"
     *       column="roleID"
     *       outer-join="true"
     *       lazy="false"
    inverse="false"
     * @return java.util.Set
     */
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "T_UserRole",
    joinColumns ={@JoinColumn(name = "opID", referencedColumnName = "id", nullable = false)},
    inverseJoinColumns ={@JoinColumn(name = "roleID", referencedColumnName = "roleID", nullable = false)}
    )
    private Collection<Role> roles;
    /**
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.po.Department"
     *       name="department"
     *       column="departmentID"
     *       cascade="none"
     *       outer-join="false"
     *
     * @return Department
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "departmentID")
    private Department department;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "jobID")
    private Job job;
    private java.sql.Timestamp birthday;
    @Transient
    private int grade;

    private String mobile;

    /**
     * 历史密码
     */
    private String previousPassword1;
    private String previousPassword2;
    private String previousPassword3;
    /**
     * 身份证号
     */
    private String idCardNo;
    private String name;
    private String email;
    @Transient
    private int userGroupID;
    @Transient
    private short userMode;
    @Transient
    private int styleID;
    @Transient
    private int onlineView;

    public Operator()
    {
    }

    /**
     * 比较密码是否相同
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
    boolean isAdmin()
    {
        if (this.getAccount().equalsIgnoreCase("admin"))
        {
            return true;
        }
        else return false;
    }
    public boolean isAccess(String resURL)
    {
        //allow all the functions to be accessed by the Administrator
        if (isAdmin())
        {
            return true;
        }
        Object[] roles = getRoles().toArray();
        for (int i = 0; i < roles.length; i++)
        {
            Role role = (Role) roles[i];
            if (role.hasPrivilege(resURL))
            {
                return true;
            }
        }
        return false;

    }

    public boolean isPermitted(String groupObjectName, int groupID, int permissionValue)
    {
        if (isAdmin())
        {
            return true;
        }
        Object[] roles = getRoles().toArray();
        for (int i = 0; i < roles.length; i++)
        {
            Role role = (Role) roles[i];
            if (role.hasPermited(groupObjectName, groupID, permissionValue))
            {
                return true;
            }
        }
        return false;
    }

    public boolean isPermited(String resURL, Object vo)
    {
        if (isAdmin())
        {
            return true;
        }
        Object[] roles = getRoles().toArray();
        for (int i = 0; i < roles.length; i++)
        {
            Role role = (Role) roles[i];
            if (role.hasPermited(resURL, vo))
            {
                return true;
            }
        }
        return false;

    }

    public String getPermission(String resURL, Object vo)
    {
        StringBuffer buf = new StringBuffer();
        Object[] roles = getRoles().toArray();
        for (int i = 0; i < roles.length; i++)
        {
            Role role = (Role) roles[i];
            String per = role.getPermission(resURL, vo);
            if (!per.equals(""))
            {
                buf.append(per).append(",");
            }
        }
        if (buf.length() >= 1)
        {
            buf.deleteCharAt(buf.length() - 1);
        }
        return buf.toString();

    }

    public String getPermitedGroups(String resURL, Object vo, int permission)
    {
        StringBuffer buf = new StringBuffer();
        Object[] roles = getRoles().toArray();
        for (int i = 0; i < roles.length; i++)
        {
            Role role = (Role) roles[i];
            String groups = role.getPermitedGroups(resURL, vo, permission);
            if (!groups.equals(""))
            {
                buf.append(groups).append(",");
            }
        }
        if (buf.length() >= 1)
        {
            buf.deleteCharAt(buf.length() - 1);
        }
        return buf.toString();

    }

    public String getPermitedGroups(String groupObjectName, int permission)
    {
        StringBuffer buf = new StringBuffer();
        Object[] roles = getRoles().toArray();
        for (int i = 0; i < roles.length; i++)
        {
            Role role = (Role) roles[i];
            String groups = role.getPermitedGroups(groupObjectName, permission);
            if (!groups.equals(""))
            {
                buf.append(groups).append(",");
            }
        }
        if (buf.length() >= 1)
        {
            buf.deleteCharAt(buf.length() - 1);
        }
        return buf.toString();

    }

    /**
     * @deprecated 
     * @param url
     * @return 
     */
    public boolean isSecurityURL(String url)
    {
        if (ACTION_URLS == null)
        {
            try
            {
//                OperationManagementImpl omi = new OperationManagementImpl(Privilege.class);
                OperationManagementImpl omi = OperationManagementImpl.createInstance();
                ACTION_URLS = omi.findAll(Privilege.class);
                omi.close();
            } catch (Exception ex)
            {
            }
        }
        for (int i = 0; i < ACTION_URLS.size(); i++)
        {
            Privilege privilege = (Privilege) ACTION_URLS.get(i);
            if (privilege.getUrl().trim().equals(url.trim()))
            {
                return true;
            }
        }
        return false;
    }

    /**
     * @hibernate.id  generator-class="native" length="8" column="ID"
     * @return
     */
    public int getId()
    {
        return id;
    }

    public void setId(int opID)
    {
        this.id = opID;
    }

    /**
     * @hibernate.property length="30" column="username"
     * @return
     */
    public String getAccount()
    {
        return account;
    }

    public void setAccount(String account)
    {
        this.account = account;
    }

    /**
     * @hibernate.property length="30"
     * @return
     */
    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    /**
     * @hibernate.property length="30" column="nickName"
     * @return
     */
    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    /**
     * @hibernate.property length="1" 
     * @return
     */
    public int getState()
    {
        return state;
    }

    public void setState(int state)
    {
        this.state = state;
    }

    /*
     * @hibernate.set name="limits" table="T_OPERATORLIMIT" cascade="all"
     * @hibernate.collection-key column="opID"
     * @hibernate.collection-many-to-many
     *       class="com.lohool.jproject.xwohi.operator.po.SysLimit"
     *       column="LimitID"
     *       outer-join="false"
     * @return java.util.collection
     */
    /*
    public java.util.Set getLimits()
    {
    return limits;
    }
    public void setLimits(java.util.Set limits)
    {
    this.limits = limits;
    }
     */
    public String getPassword2()
    {
        return password;
    }

    public void setPassword2(String password2)
    {
        this.password2 = password2;
    }

    /**
     * @hibernate.set name="roles" table="T_UserRole"
     *                cascade="none" inverse="false"
     * @hibernate.collection-key column="opID"
     * @hibernate.collection-many-to-many
     *       class="com.lohool.jproject.xwohi.operator.po.Role"
     *       column="roleID"
     *       outer-join="true"
     *       lazy="false"
    inverse="false"
     * @return java.util.Set
     */
    public Collection getRoles()
    {
        return roles;
    }

    public void setRoles(Collection roles)
    {
        this.roles = roles;
    }
    /*
    public String getRolesID()
    {
    return rolesID;
    }
    
    public void setRolesID(String rolesID)
    {
    this.rolesID = rolesID;
    }
     */

    /**
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.po.Department"
     *       name="department"
     *       column="departmentID"
     *       cascade="none"
     *       outer-join="false"
     *
     * @return Department
     */
    public Department getDepartment()
    {
        return department;
    }

    public void setDepartment(Department department)
    {
        this.department = department;
    }

    /**
     * @hibernate.many-to-one
     *       class="com.lohool.jproject.xwohi.po.Job"
     *       name="job"
     *       column="jobID"
     *       cascade="none"
     *       outer-join="false"
     *
     * @return java.util.collection
     */
    public Job getJob()
    {
        return job;
    }

    public void setJob(Job job)
    {
        this.job = job;
    }

    /**
     * @hibernate.property
     * @return
     */
    public java.sql.Timestamp getBirthday()
    {
        return birthday;
    }

    public void setBirthday(java.sql.Timestamp birthday)
    {
        this.birthday = birthday;
    }

    /**
     * @hibernate.property length="30"
     * @return
     */
    public String getIdCardNo()
    {
        return idCardNo;
    }

    public void setIdCardNo(String idCardNo)
    {
        this.idCardNo = idCardNo;
    }

    /**
     * @hibernate.property length="20"
     * @return
     */
    public String getMobile()
    {
        return mobile;
    }

    public void setMobile(String mobile)
    {
        this.mobile = mobile;
    }

    /**
     * @hibernate.property length="8"
     * @return
     */
    public int getGrade()
    {
        return grade;
    }

    public void setGrade(int grade)
    {
        this.grade = grade;
    }

    /**
     * @hibernate.property length="100"
     * @return
     */
    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    /**
     * @hibernate.property length="50"
     * @return
     */
    public int getOnlineView()
    {
        return onlineView;
    }

    public void setOnlineView(int onlineView)
    {
        this.onlineView = onlineView;
    }

    /**
     * @hibernate.property length="50"
     * @return
     */
    public int getStyleID()
    {
        return styleID;
    }

    public void setStyleID(int styleID)
    {
        this.styleID = styleID;
    }

    /**
     * @hibernate.property length="50"
     * @return
     */
    public int getUserGroupID()
    {
        return userGroupID;
    }

    public void setUserGroupID(int userGroupID)
    {
        this.userGroupID = userGroupID;
    }

    /**
     * @hibernate.property length="50"
     * @return
     */
    public short getUserMode()
    {
        return userMode;
    }

    public void setUserMode(short userMode)
    {
        this.userMode = userMode;
    }
    @Override
    public String toString()
    {
        return this.getName();
    }
    @Override
    public int hashCode()
    {
        return this.getName().hashCode();
    }
    @Override
    public boolean equals(Object obj)
    {
        if(!(obj instanceof Operator)) return false;
        Operator op=(Operator)obj;
        if(op.id!=0) return op.id==this.id;
        else if ( op.name!=null) return op.name.equals(this.getName());
        else return op.equals(this);
        
    }





    /**
     * @return the previousPassword1
     */
    public String getPreviousPassword1() {
        return previousPassword1;
    }

    /**
     * @param previousPassword1 the previousPassword1 to set
     */
    public void setPreviousPassword1(String previousPassword1) {
        this.previousPassword1 = previousPassword1;
    }

    /**
     * @return the previousPassword2
     */
    public String getPreviousPassword2() {
        return previousPassword2;
    }

    /**
     * @param previousPassword2 the previousPassword2 to set
     */
    public void setPreviousPassword2(String previousPassword2) {
        this.previousPassword2 = previousPassword2;
    }

    /**
     * @return the previousPassword3
     */
    public String getPreviousPassword3() {
        return previousPassword3;
    }

    /**
     * @param previousPassword3 the previousPassword3 to set
     */
    public void setPreviousPassword3(String previousPassword3) {
        this.previousPassword3 = previousPassword3;
    }

}
