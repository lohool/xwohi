package com.lohool.jproject.xwohi.operator.po;


import com.xwohi.framework.common.XWohiConfigration;
import com.xwohi.framework.common.security.ActionSecurity;
import java.util.Map;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: lohool.com</p>
 * <p>mail:lohool@hotmail.com</p>
 * @author Xing BaoHui
 * @version 1.0
 * @hibernate.class  table="t_DataGroupPermission"  dynamic-update="true"  dynamic-insert="true"
 */
@Entity
@Table(name="t_DataGroupPermission")
public class DataGroupPermission implements com.xwohi.framework.common.security.po.DataGroupPermission{

    @Id 
    @GeneratedValue(strategy = GenerationType.AUTO)
    //@SequenceGenerator(name = "SEQ_DataGroupPermission_ID", allocationSize = 1, initialValue = 1, sequenceName = "SEQ_DataGroupPermission_ID")
    //@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_DataGroupPermission_ID")
    private int id;
    private int dataGroupID;
    private String value;
    private int intValue;    
    private int objectGroupId;
    private int roleId;

    public void setDataGroupID(int dataGroupID) {
        this.dataGroupID = dataGroupID;
    }

    /**
     * @hibernate.property column="dataGroupID"
     */
    public int getDataGroupID() {
        return this.dataGroupID;
    }

    public void setValue(String value) {
        this.value = value;
        String[] values = value.split(",");
        intValue = 0;
        for (int j = 0; j < values.length; j++) {
            intValue += Integer.valueOf(values[j]).intValue();
        }

    }

    /**
     * @hibernate.property column="value"
     */
    public String getValue() {
        return this.value;
    }

    public void setId(int id) {
        this.id = id;
    }

    /**
     * @hibernate.id  generator-class="native" column="id" unsaved-value="any"
     */
    public int getId() {
        return this.id;
    }

    public void setObjectGroupId(int objectGroupId) {
        this.objectGroupId = objectGroupId;
    }

    /**
     * @hibernate.property column="objectGroupId"
     */
    public int getObjectGroupId() {
        return this.objectGroupId;
    }
    
    public boolean hasPermited(int dataGroupID,int objectGroupID,int permissionValue)
    {
        
        if(dataGroupID>=0 && dataGroupID== this.getDataGroupID() && objectGroupID==this.getObjectGroupId() && ((this.getIntValue()&permissionValue)==permissionValue))
        {
            return true;
        }
        return false;
    }

    public boolean hasPrermited(String uri, Object vo) {
        System.out.println("---datagroupPermission.hasPrermited start----");
        System.out.println("uri:" + uri);
        Permission per = (Permission) ActionSecurity.getPermission(uri);
        if (per == null) {
            return true;
        }
        System.out.println("permission:" + per.getUri());

        if (this.dataGroupID == per.getDataGroup().getId()) {
            String groupIdName = per.getDataGroup().getDataObjectKeyName();
            String className = vo.getClass().getSimpleName();
            if (className.equals(per.getDataGroup().getDataObjectName())) {
                //data object type matches
                //permission value matches
                if ((this.intValue & per.getValue()) == per.getValue()) {
                    return true;
                }
            } else if (className.equals(per.getDataGroup().getGroupObjectKeyName())) {
                //data group object type matches
            }


        }
        System.out.println("---datagroupPermission.hasPrermited end----");
        return false;
    }

    public String getPermission(String uri, Object vo) {
        System.out.println("---datagroupPermission.getPermission start----");
        System.out.println("uri:" + uri);
        Permission per = (Permission) ActionSecurity.getPermission(uri);
        if (per == null) {
            return "";
        }
        System.out.println("permission:" + per.getUri());

        if (this.dataGroupID == per.getDataGroup().getId()) {
            String groupIdName = per.getDataGroup().getDataObjectKeyName();
            String className = vo.getClass().getSimpleName();
            if (className.equals(per.getDataGroup().getDataObjectName())) {
                //data object type matches
                //permission value matches
                return this.value;
            } else if (className.equals(per.getDataGroup().getGroupObjectKeyName())) {
                //data group object type matches
            }


        }
        return "";
    }

    public String getPermitedGroup(String uri, Object vo, int permission) {
        System.out.println("---datagroupPermission.getPermitedGroup start----");
        System.out.println("uri:" + uri);
        Permission per = (Permission) ActionSecurity.getPermission(uri);
        if (per == null) {
            return "";
        }
        System.out.println("permission:" + per.getUri());

        if (this.dataGroupID == per.getDataGroup().getId()) {
            String groupIdName = per.getDataGroup().getDataObjectKeyName();
            String className = vo.getClass().getSimpleName();
            if (className.equals(per.getDataGroup().getDataObjectName()) && (this.getIntValue() & permission) == permission) {
                //data object type matches
                //permission value matches
                return Integer.toString(this.getObjectGroupId());
            }



        }
        return "";
    }
    public String getPermitedGroup(int dataGroupID,int permissionValue)
    {
        
        if(dataGroupID>=0 && dataGroupID== this.getDataGroupID()  && ((this.getIntValue()&permissionValue)==permissionValue))
        {
            return Integer.toString(this.getObjectGroupId());
        }
        return "";
    }
    /**
     * @return the intValue
     */
    public int getIntValue() {
        return intValue;
    }

    /**
     * @hibernate.property column="intValue"
     */
    public void setIntValue(int intValue) {
        this.intValue = intValue;
    }
    public String toString()
    {
        return "[id="+id+",value="+value+"]";
    }

    /**
     * @return the roleId
     */
    public int getRoleId() {
        return roleId;
    }

    /**
     * @param roleId the roleId to set
     */
    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
}
