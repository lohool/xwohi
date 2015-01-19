/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lohool.jproject.xwohi;


import com.lohool.jproject.xwohi.operator.po.*;
import com.lohool.jproject.xwohi.po.*;

import java.io.File;
import java.util.ArrayList;
import java.util.BitSet;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.struts2.json.JSONPopulator;
import org.apache.struts2.json.JSONReader;
import org.apache.struts2.json.JSONWriter;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

//import com.lohool.jproject.xwohi.operator.po.r
public class TestHib
{

    /*
     * 
    insert into t_Role (roleid,name)values('10','test');
    delete from author where id='63';
    insert into author(id,username,onlineView)values('63','t2','1');
    insert into t_userrole values('63','10');
    commit;
    
     */
    public void testDelete()
    {



            //Operator op = (Operator) session.load(Operator.class, new Integer(55));
            Operator op = new Operator();
            op.setName("test");
            op.setAccount("t2");
            op.setPassword("t");
            op.setDepartment((Department) session.load(Department.class, new Integer(1)));
            op.setJob((Job) session.load(Job.class, new Integer(18)));
            op.getName();
            //op.setId(1);
            //op.getRoles().clear();

            Set<Role> roles = new HashSet<Role>();

            Role role = (Role) session.load(Role.class, new Integer(10));
            //session.delete(role);
            Role role2 = new Role();
            role2.setRoleID(11);
            roles.add(role);
            op.setRoles(roles);
            //session.save(op);
            //System.out.println(role.getDataGroupPermission());

            Role r1 = new Role();
            r1.setName("CEO 1");
            //session.save(r1);
/*
            //roles.add(role);
            
            //Role role1 = (Role)session.load(Role.class, new Integer(3));
            //role.setRoleID(3);
            
            //roles.add(role1);
            
            //op.setRoles(roles);
            
            //session.save(op);
            Set<Resource> resources = new HashSet<Resource>();
            Resource rs1 = (Resource) session.load(Resource.class, new Long(4));
            Resource rs2 = (Resource) session.load(Resource.class, new Long(3));
            resources.add(rs1);
            resources.add(rs2);
            
            role.setResources(resources);
            session.update(role);
             */
            System.out.println(op.getBirthday());
            Operator op1 = (Operator) session.load(Operator.class, new Integer(63));
            //op.setRoles(null);
            //role.setOperators(null);
            session.delete(op1);
            //Toolkit.printVOField(op);
  
    }

    public void testAdd()
    {


        Session session = null;
        Transaction transaction = null;
        try
        {
            Configuration config = new AnnotationConfiguration();

            config.configure(new File("d:/jbproject/OA/hibernate.cfg.xml"));
            org.hibernate.SessionFactory sf = config.buildSessionFactory();

            session = sf.openSession();


            transaction = session.beginTransaction();

            //Operator op = (Operator) session.load(Operator.class, new Integer(55));
            Operator op = new Operator();
            op.setName("test");
            op.setAccount("t2");
            op.setPassword("t");
            op.setDepartment((Department) session.load(Department.class, new Integer(1)));
            op.setJob((Job) session.load(Job.class, new Integer(18)));
            op.getName();
            //op.setId(1);
            //op.getRoles().clear();

            Set<Role> roles = new HashSet<Role>();

            Role role = (Role) session.load(Role.class, new Integer(10));
            //session.delete(role);
            Role role2 = new Role();
            role2.setRoleID(10);
            roles.add(role2);
            op.setRoles(roles);
            session.save(op);
            //System.out.println(role.getDataGroupPermission());

            Role r1 = new Role();
            r1.setName("CEO 1");

            transaction.commit();


        } catch (Exception ex)
        {
            try
            {
                transaction.rollback();
            } catch (HibernateException ex1)
            {
                ex1.printStackTrace();
            }
            ex.printStackTrace();
        } finally
        {
            try
            {
                session.close();
            } catch (HibernateException ex)
            {
                ex.printStackTrace();
            }

        }



    }

    public void testJob()
    {
        Configuration config = new AnnotationConfiguration();

        config.configure(new File("d:/jbproject/OA/hibernate.cfg.xml"));

        org.hibernate.SessionFactory sf = config.buildSessionFactory();
        //SessionFactory sf = new SessionFactory();
        Session session = null;
        Transaction transaction = null;
        Operator op = null;
        try
        {
            session = sf.openSession();


            transaction = session.beginTransaction();

            Job job = (Job) session.load(Job.class, new Integer(10));
            job.getName();
            //job.getChildren().clear();
            //System.out.println(job.getChildren());
            //job.setChildren(null);
            //job.getChildren().remove(job.getChildren().iterator().next());

            Job j1 = new Job();
            j1.setParent(job);
            j1.setName("test1");
            job.getChildren().add(j1);

            //session.delete(job);
            session.save(job);
            //session.flush();
            //Toolkit.printVOField(job);
            transaction.commit();



        } catch (Exception ex)
        {
            try
            {
                transaction.rollback();
            } catch (HibernateException ex1)
            {
                ex1.printStackTrace();
            }
            ex.printStackTrace();
        } finally
        {
            try
            {
                session.close();
            } catch (HibernateException ex)
            {
                ex.printStackTrace();
            }

        }
    }


     Session session = null;
    Transaction transaction = null;
   public void  openSession()
    {
        Configuration config = new AnnotationConfiguration();

        config.configure(new File("d:/jbproject/OA/hibernate.cfg.xml"));

        org.hibernate.SessionFactory sf = config.buildSessionFactory();
        //SessionFactory sf = new SessionFactory();
       
        
        try
        {
            session = sf.openSession();


            transaction = session.beginTransaction();
 


        } catch (Exception ex)
        {
            ex.printStackTrace();
            
        } 
    }
   
      public void  closeSession()
    {

        try
        {

         transaction.commit();



        } catch (Exception ex)
        {
            try
            {
                transaction.rollback();
            } catch (HibernateException ex1)
            {
                ex1.printStackTrace();
            }
            ex.printStackTrace();
        } finally
        {
            try
            {
                session.close();
            } catch (HibernateException ex)
            {
                ex.printStackTrace();
            }

        }
    }
      

      void testQualityList()
      {
           String hql = "select wo, sheet1.id,wo.code as code "
                   + "from QualificationSheet sheet1, WorkOrder wo "
                   + "where sheet1.workorderID=wo.id and sheet1.business.id=1 "
                   + " union "
                   + "select sheet2.id,task.name as code "
                   + "from QualificationSheet sheet2, Task task "
                   + "where sheet2.workorderID=task.id and sheet1.business.id=2 ";
           hql="select obj, obj.id from WorkOrderProcess obj";
           System.out.println(hql);
            Query q=session.createQuery(hql);
            List list=q.list();
            for(Object obj:list)
            {
                Object[] objs=(Object[])obj;
                for(Object o:objs)
                {
                System.out.println(o.getClass());
                }
                //
            }
      }
      
      public void testUpdate()
      {
          ArrayList params= new ArrayList();
        params.add("TTT");
        ArrayList v=new ArrayList();
        v.add(3);
        v.add(7);
        Integer[] iv=new Integer[2];
        iv[0]=3;
        //iv[1]=7;
        //params.add(v);
        //params.add("1, 2");
        int[] ids=new int[]{1,2};
        //params.add(ids);
        Query query = session.createQuery("update Operator obj set obj.name =? where obj.id in (:ids)");
        
        for (int i = 0; i < params.size(); i++) {
            Object value = params.get(i);
            query.setParameter(i, value);
        }
        query.setParameterList("ids", v);
        query.executeUpdate();
         
      }
      public void testSaveRelation()
      {
          Operator op = (Operator) session.load(Operator.class, new Integer(3));
          Department dep=new Department();
          dep.setId(3);
          op.setDepartment(null);
          
          Role r1=new Role();
          r1.setRoleID(50);
          Role r2=new Role();
          r2.setRoleID(51);
          Role r3=new Role();
          r3.setRoleID(54);
          ArrayList roles=new ArrayList();
          roles.add(r1);
          roles.add(r2);
          roles.add(r3);
          op.setRoles(new ArrayList());
          session.saveOrUpdate(op);
         
      }
      
       void testJSon()
      {
          Query q=session.createQuery("select obj from Operator obj");
          List results=q.list();
         try
         {
             //System.out.println(JSonParser.toJSonString(session.load(Role.class, 10)));
             
             /**
              * test for struts2-json-plugin-2.3.15.3.jar
              */
             JSONWriter json=new JSONWriter();
             System.out.println(json.write(results));
             
             JSONReader reader = new JSONReader();
             Object obj=reader.read("{\"cmd\"	 :\"changeimagesort\",\"result\" : \"succeed|failed\",\"msg\" : \"xxxxxx\"}");
             Map jsonMap = (Map) obj;
             JSONPopulator populator = new JSONPopulator();
             System.out.println(jsonMap.get("cmd"));
             
         } catch (Exception ex)
         {
             ex.printStackTrace();
         }
      }
    public static void main(String[] args)
    {
       
        TestHib th = new TestHib();
        th.openSession();
        th.testJSon();
//        String s="OperatorAdd";
//        s=s.replaceAll("([A-Z])", " $1");
//        String[] ss=s.split(" ");
//        System.out.println(ss[1]);
//        System.out.println(ss[2]);
        th.closeSession();


    }
}
