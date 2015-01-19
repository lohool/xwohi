package com.lohool.jproject.xwohi.po;


import com.lohool.jproject.xwohi.operator.po.Operator;
import java.util.Set;
import javax.persistence.*;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;


/**
 * <p>Copyright: Copyright (c) 2013</p>
 * <p>Company: lohool.com</p>
 * <p>mail:lohool@hotmail.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */
@Entity
@Table(name="T_WorkOrderClass")
public class WorkOrderClass
{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    //@SequenceGenerator(name = "SEQ_WorkFlowClass_ID", allocationSize = 1, initialValue = 1, sequenceName = "SEQ_WorkFlowClass_ID")
    //@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQ_WorkFlowClass_ID")
    @Column(length=8)
    private int id;
    private String name;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "parentID")
    private WorkOrderClass parent;
    @OneToMany(mappedBy="parent",fetch = FetchType.LAZY) 
    //@JoinColumn(name = "parentID")
    @Cascade(CascadeType.DELETE)
    private Set<WorkOrderClass> children;
    private String description;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "creator")
    private Operator creator;
    private java.sql.Timestamp createTime;
    /**
     * 1-有效,2-无效
     */
    private byte state;
    /*
     * 1-是，可以直接结案,2-否
     */
    private byte endCase;
    private byte used;
    
    //used to define whole path of the parent-child class path
    private String classCode;

    /**
     * @param id the id to set
     */
    public void setId(int id)
    {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName()
    {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name)
    {
        this.name = name;
    }

    /**
     * @return the parent
     */
    public WorkOrderClass getParent()
    {
        return parent;
    }

    /**
     * @param parent the parent to set
     */
    public void setParent(WorkOrderClass parent)
    {
        this.parent = parent;
    }

  

    /**
     * @return the description
     */
    public String getDescription()
    {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description)
    {
        this.description = description;
    }

    /**
     * @return the creator
     */
    public Operator getCreator()
    {
        return creator;
    }

    /**
     * @param creator the creator to set
     */
    public void setCreator(Operator creator)
    {
        this.creator = creator;
    }

    /**
     * @return the createTime
     */
    public java.sql.Timestamp getCreateTime()
    {
        return createTime;
    }

    /**
     * @param createTime the createTime to set
     */
    public void setCreateTime(java.sql.Timestamp createTime)
    {
        this.createTime = createTime;
    }

    /**
     * @return the state
     */
    public byte getState()
    {
        return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(byte state)
    {
        this.state = state;
    }

    /**
     * @return the endCase
     */
    public byte getEndCase()
    {
        return endCase;
    }

    /**
     * @param endCase the endCase to set
     */
    public void setEndCase(byte endCase)
    {
        this.endCase = endCase;
    }

    /**
     * @return the used
     */
    public byte getUsed()
    {
        return used;
    }

    /**
     * @param used the used to set
     */
    public void setUsed(byte used)
    {
        this.used = used;
    }

    /**
     * @return the id
     */
    public int getId()
    {
        return id;
    }

    
    public boolean isEndCase()
    {
//        if(getEndCase()==1)
//        {
//            return true;
//        }
//        else if(getLevel1()!=null && getLevel1().getEndCase()==1)
//        {
//            return true;
//        }
//        else if(getLevel2()!=null && getLevel2().getEndCase()==1)
//        {
//            return true;
//        }
//        else if(getLevel3()!=null && getLevel3().getEndCase()==1)
//        {
//            return true;
//        }
//        
        return false;
    }

    public void setChildren(java.util.Set children)
	{
		this.children = children;
	}


	public java.util.Set getChildren( )
	{
		return this.children;
	}

    /**
     * @return the classCode
     */
    public String getClassCode()
    {
        return classCode;
    }

    /**
     * @param classCode the classCode to set
     */
    public void setClassCode(String classCode)
    {
        this.classCode = classCode;
    }
    
    public int getRootClassId()
    {
        String ids[]=this.classCode.split("/");
        return Integer.valueOf(ids[1]);
    }
}
