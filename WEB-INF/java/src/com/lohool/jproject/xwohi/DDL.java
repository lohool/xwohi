package com.lohool.jproject.xwohi;

import org.hibernate.*;
import org.hibernate.cfg.*;
import org.hibernate.tool.hbm2ddl.SchemaExport;
import java.io.*;
/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: sxit.com</p>
 * @author Xing BaoHui
 * @version 1.0
 */

public class DDL
{
    public DDL()
    {
    }
	public void generateDDL(String file)
	{
        try
        {
            SessionFactory sessionFactory;

            Configuration conf = null;
            conf = new Configuration();

            //conf.addFile("./com/sxit/wap/po/Team.hbm.xml");
            conf.addFile(file);

            SchemaExport dbExport = new SchemaExport(conf);
            dbExport.setDelimiter(";") ;
            dbExport.setOutputFile("./sql/temp.txt");
            dbExport.create(true, false);
        }
        catch (Exception ex)
        {
            ex.printStackTrace() ;
        }

	}
    public static void main(String[] arrg)
    {

        try
        {
            SessionFactory sessionFactory;

            Configuration conf = null;
            conf = new Configuration();

            //conf.addDirectory(new File("./build/com/lohool/jproject/xwohi/operator/po/"));
conf.addDirectory(new File("../wap2/build/web/WEB-INF/classes/com/lohool/jproject/xwohi/operator/po/"));
File f= new File("./build/web/WEB-INF/classes/com/lohool/jproject/xwohi/po/Job.hbm.xml");
System.out.println(f.getAbsoluteFile()+":"+f.exists());
conf.addFile("./build/web/WEB-INF/classes/com/lohool/jproject/xwohi/po/Job.hbm.xml") ;
conf.addFile("./build/web/WEB-INF/classes/com/lohool/jproject/xwohi/po/Department.hbm.xml") ;
            //conf.addDirectory(new File("./classes/com/sxit/wap/mail/po/")) ;
//conf.addDirectory(new File("../wap2/build/web/WEB-INF/classes/com/lohool/jproject/xwohi/po/"));
conf.addDirectory(new File("../xwohi/build/classes/com/lohool/jproject/xwohi/operator/po/"));
            
            //conf.addDirectory(new File("./build/com/lohool/jproject/xwohi/bussinessitem/po/")) ;
            //conf.addDirectory(new File("./build/com/lohool/jproject/xwohi/archive/po/")) ;
//            conf.addDirectory(new File("./build/com/lohool/sms/increment/po/")) ;
           // conf.addDirectory(new File("./build/com/lohool/jproject/thread/schedule/")) ;
            /**
            conf.addDirectory(new File("./build/com/lohool/jproject/vrmall/po/")) ;
            conf.addFile("./build/com/lohool/sms/increment/po/Customer.hbm.xml");
            conf.addFile("./build/com/lohool/sms/increment/po/CustomerGroup.hbm.xml");
            conf.addFile("./build/com/lohool/sms/increment/po/TradeLog.hbm.xml");
            conf.addFile("./build/com/lohool/sms/increment/po/Product.hbm.xml");
             *
             */

            //conf.addFile("./classes/com/lohool/jproject/xwohi/operator/po/News.hbm.xml");
            //conf.addFile("./classes/com/lohool/jproject/xwohi/operator/po/NewsType.hbm.xml");
            /*
            onf.addFile("./com/sxit/wap/po/Association.hbm.xml");
            conf.addFile("./com/sxit/wap/po/Team.hbm.xml");
            conf.addFile("./com/sxit/wap/po/Game.hbm.xml");
            conf.addFile("./com/sxit/wap/po/Match.hbm.xml");
            conf.addFile("./com/sxit/wap/po/ChipParameter.hbm.xml");
            conf.addFile("./com/sxit/wap/po/News.hbm.xml");
            conf.addFile("./com/sxit/wap/po/NewsType.hbm.xml");
            */
            //��һ������ʱ��������ݿ��д�����
            //���Ұ�sql��������txt�ļ��õ�
            //�Ժ������Ҫȥ����һ�Σ�����ÿ�ζ��½���

            SchemaExport dbExport = new SchemaExport(conf);
            dbExport.setDelimiter(";") ;
            dbExport.setOutputFile("./sql.txt");
            dbExport.create(true, false);
        }
        catch (Exception ex)
        {
            ex.printStackTrace() ;
        }


    }
}
