package com.lohool.jproject.xwohi.operator.po;


import com.xwohi.framework.common.security.ActionSecurity;
import java.io.Serializable;
import java.util.*;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;



/**
 *
 * <p>Title: </p>
 * @hibernate.class  table="T_Role"  dynamic-update="true"  dynamic-insert="true"
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: lohool.com</p>
 * <p>mail:lohool@hotmail.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
@Entity
@Table(name="T_Role")
public class Role implements com.xwohi.framework.common.security.po.Role, Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    //@SequenceGenerator(name = "SEQ_Role_ID", allocationSize = 1, initialValue = 1, sequenceName = "SEQ_Role_ID")
    //@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_Role_ID")
    //@Column(length=8)
    private int roleID;

    @Column(length=30)
    private String name;
    private String description;
    

    @ManyToMany(fetch = FetchType.LAZY,cascade=CascadeType.PERSIST)
    @JoinTable( name = "T_RoleRes", 
            joinColumns = { @JoinColumn(name = "roleID", referencedColumnName = "roleID", nullable = false) }, 
            inverseJoinColumns = { @JoinColumn(name = "resourceID", referencedColumnName = "resourceID", nullable = false) })
    private java.util.Collection<Resource> resources;
    
    /*
    @ManyToMany(mappedBy = "roles", fetch = FetchType.LAZY)
    @Cascade(value={CascadeType.SAVE_UPDATE,CascadeType.DELETE})
    */
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable( name = "T_UserRole", 
            joinColumns = { @JoinColumn(name = "roleID", referencedColumnName = "roleID", nullable = false) }, 
            inverseJoinColumns = { @JoinColumn(name = "opID", referencedColumnName = "id", nullable = false) })   
    private Set<Operator> operators;
    //private String resourceID;
    
        /**
     * @hibernate.set name="dataGroupPermission" cascade="none" inverse="false" lazy="false"
     * @hibernate.collection-key column="roleID"
     * @hibernate.collection-one-to-many
     *       class="com.lohool.jproject.xwohi.operator.po.DataGroupPermission"
     *       outer-join="false"
     */
    
    @OneToMany(fetch = FetchType.EAGER,cascade=CascadeType.REMOVE ) 
    @JoinColumn(name = "roleID")
    private java.util.Set<DataGroupPermission> dataGroupPermission;

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    /**
     * @hibernate.id  generator-class="native" length="8"
     * @return
     */
    public int getRoleID() {
        return this.roleID;
    }

    public void setName(String name) {
        this.name = name;
    }

    /**
     * @hibernate.property length="30"
     * @return
     */
    public String getName() {
        return this.name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @hibernate.property length="30"
     * @return
     */
    public String getDescription() {
        return this.description;
    }
    /*
     * @hibernate.set name="roleRes" cascade="none"
     * @hibernate.collection-key column="roleID"
     * @hibernate.collection-one-to-many
     *       class="com.lohool.jproject.xwohi.operator.po.RoleRes"
     *       outer-join="false"
     *       lazy="true"
     * @return java.util.Set
     */

    /**
     * @hibernate.set name="resources" table="T_RoleRes"
     *                cascade="none" inverse="false"
     * @hibernate.collection-key column="roleID"
     * @hibernate.collection-many-to-many
     *       class="com.lohool.jproject.xwohi.operator.po.Resource"
     *       column="resourceID"
     *       outer-join="false"
     *
     *       lazy="true"
     * @return java.util.Set
     */
    public java.util.Collection getResources() {
        return resources;
    }

    public void setResources(java.util.Collection resources) {
        this.resources = resources;
    }

    public Resource getResource(String resName) {
        if (resources == null) {
            return null;
        }
        Iterator iter = resources.iterator();
        while (iter.hasNext()) {
            Resource res = (Resource) iter.next();
            if (res != null && res.getName() != null && res.getName().equals(resName)) {
                return res;
            }
        }
        return null;
    }

    public boolean hasPrivilege(String resName) {
        if (resources == null) {
            return false;
        }
        Iterator iter = resources.iterator();
        while (iter.hasNext()) {
            Resource res = (Resource) iter.next();
            if (res != null && res.hasPrivilege(resName)) {
                return true;
            }
        }
        return false;
    }

    /**
     * @hibernate.set name="operators" table="T_UserRole"
     *                cascade="save-update" inverse="true"
     * @hibernate.collection-key column="roleID"
     * @hibernate.collection-many-to-many
     *       class="com.lohool.jproject.xwohi.operator.po.Operator"
     *       column="opID"
     *       outer-join="false"
     *       inverse="true"
     *       lazy="true"
     * @return java.util.Set
     */
    public Set getOperators() {
        return operators;
    }

    public void setOperators(Set operators) {
        this.operators = operators;
    }

    public int hashCode() {
        return this.getRoleID();
    }

    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof Role)) {
            return false;
        }
        return ((Role) obj).getRoleID() == this.getRoleID();
    }

    public void setDataGroupPermission(java.util.Set dataGroupPermission) {
        this.dataGroupPermission = dataGroupPermission;
    }

    public void addDataGroupPermission(DataGroupPermission dataGroupPermission) {
        //if(this.dataGroupPermission==null)this.dataGroupPermission=ne
        this.dataGroupPermission.add(dataGroupPermission);
    }

    /**
     * @hibernate.set name="dataGroupPermission" cascade="none" inverse="false" lazy="false"
     * @hibernate.collection-key column="roleID"
     * @hibernate.collection-one-to-many
     *       class="com.lohool.jproject.xwohi.operator.po.DataGroupPermission"
     *       outer-join="false"
     */
    public java.util.Set getDataGroupPermission() {
        return this.dataGroupPermission;
    }

    /**
     * if return 0, means not permission for the data type and group found
     * @param dataGroupID
     * @param objectGroupId
     * @return
     */
    public int getPermission(int dataGroupID, int objectGroupId) {
        if (this.dataGroupPermission == null) {
            return 0;
        }
        Iterator pers = this.dataGroupPermission.iterator();
        while (pers.hasNext()) {
            DataGroupPermission per = (DataGroupPermission) pers.next();
            if (per.getDataGroupID() == dataGroupID && per.getObjectGroupId() == objectGroupId) {
                return per.getIntValue();
            }

        }
        return 0;
    }

    public boolean hasPermited(String groupObjectName, int objectGroupID, int permissionValue) {
        if (dataGroupPermission == null) {
            return false;
        }
        Iterator iter = dataGroupPermission.iterator();
        int dataGroupID = ActionSecurity.getDataGroupID(groupObjectName);
        while (iter.hasNext()) {
            DataGroupPermission res = (DataGroupPermission) iter.next();
            if (res != null && res.hasPermited(dataGroupID, objectGroupID, permissionValue)) {
                return true;
            }
        }
        return false;
    }

    public boolean hasPermited(String uri, Object vo) {
        if (dataGroupPermission == null) {
            return false;
        }
        Iterator iter = dataGroupPermission.iterator();
        while (iter.hasNext()) {
            DataGroupPermission res = (DataGroupPermission) iter.next();
            if (res != null && res.hasPrermited(uri, vo)) {
                return true;
            }
        }
        return false;
    }

    public String getPermission(String uri, Object vo) {

        if (dataGroupPermission == null) {
            return "";
        }
        Iterator iter = dataGroupPermission.iterator();
        while (iter.hasNext()) {
            DataGroupPermission res = (DataGroupPermission) iter.next();
            String permission = res.getPermission(uri, vo);
            if (!permission.equals("")) {
                return permission;
            }
        }
        return "";
    }

    public String getPermitedGroups(String uri, Object vo, int permission) {
        StringBuffer buf = new StringBuffer();
        if (dataGroupPermission == null) {
            return "";
        }
        for (DataGroupPermission res : dataGroupPermission) {
            String group = res.getPermitedGroup(uri, vo, permission);
            if (!group.equals("")) {
                buf.append(group).append(",");
            }
        }
        if (buf.length() >= 1) {
            buf.deleteCharAt(buf.length() - 1);
        }
        return buf.toString();
    }
    
    public String getPermitedGroups(String groupObjectName,  int permissionValue) {
        if (dataGroupPermission == null) {
            return "";
        }
        StringBuffer buf = new StringBuffer();
        Iterator iter = dataGroupPermission.iterator();
        int dataGroupID = ActionSecurity.getDataGroupID(groupObjectName);
        while (iter.hasNext()) {
            DataGroupPermission res = (DataGroupPermission) iter.next();
            String group=res.getPermitedGroup(dataGroupID, permissionValue);
            if (!group.equals("")) {
                buf.append(group).append(",");
            }
        }
        if (buf.length() >= 1) {
            buf.deleteCharAt(buf.length() - 1);
        }
        return buf.toString();
    }

    public String toString() {
        return "[Role:name:" + this.getName() + ";ID:" + this.getRoleID()+"]";
    }
}
