/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lohool.jproject.xwohi.operator.action;

import com.lohool.jproject.xwohi.operator.po.DataGroupPermission;
import com.lohool.jproject.xwohi.operator.po.Role;
import com.xwohi.framework.common.service.ModifyService;
import com.xwohi.framework.common.dao.OperationManagement;
import com.xwohi.framework.common.mapping.XWohiActionMapping;
import com.xwohi.framework.common.security.po.Operator;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 *
 * @author xingbao-
 */
@Service("RoleDataPermissionSaveService")
public class RoleDataPermissionSaveService 
{

    @Resource
    private OperationManagement dao;


    public String execute(Object vo, Map parameters, String actionName, Class cls, XWohiActionMapping xwohi, Operator user) throws Exception
    {
        //dao.beginTransaction();
        //Role role = (Role) getDao().load(Role.class, ((Role) vo).getRoleID());
//        System.out.println("---------------------------------------------");
        int roleId=((Role) vo).getRoleID();
        //test
//        Iterator keys = parameters.keySet().iterator();
//        while (keys.hasNext())
//        {
//            String key = (String) keys.next();
//            Object value = parameters.get(key);
//            String[] vs = (String[]) value;
//            System.out.print(key + ":");
//            for (String v : vs) {
//                System.out.print(v);
//                System.out.print(":");
//            }
//            System.out.println();
//        }
        //end test

        getDao().executeUpdate("delete from DataGroupPermission obj where obj.roleId=" + roleId);
        
//        HashSet dataGroupPermissions = new HashSet();
        String[] dataGroups = (String[]) parameters.get("dataGroup");
        for (String dataGroup : dataGroups) {
            String[] group = dataGroup.split("_");
            DataGroupPermission per = new DataGroupPermission();
            per.setDataGroupID(Integer.valueOf(group[0]).intValue());
            per.setObjectGroupId(Integer.valueOf(group[1]).intValue());
            String[] permissions = (String[]) parameters.get(dataGroup);
            StringBuilder value = new StringBuilder();
            for (String permission : permissions) {
                value.append(permission).append(",");
            }
            if (value.length() >= 1)
            {
                value.deleteCharAt(value.length() - 1);
            }
            per.setValue(value.toString());
            per.setRoleId(roleId);
//            dataGroupPermissions.add(per);
            dao.add(per);
        }

        //Iterator oldPermissons = role.getDataGroupPermission().iterator();
       // role.setDataGroupPermission(dataGroupPermissions);

        //getDao().executeUpdate("delete from DataGroupPermission obj where obj.roleID=" + role.getRoleID());
        //doc.setPigeonhole(3) ;
        //getDao().modify(Role.class, role);

//        OperationManagementImpl omi2 = new OperationManagementImpl(Archive.class);
//        omi2.setSession(omi.getSession() ) ;
        /*
        Archive arc = new Archive();
        arc.setEditor(user.getAccount() ) ;
        arc.setTitle(doc.getTitle() ) ;
        arc.setContent(doc.getContent() ) ;
        arc.setCreateTime(new java.sql.Timestamp (System.currentTimeMillis() )) ;
        arc.setCatalogue(new ArchiveCatalogue()) ;
        if(doc.getFile() !=null && !doc.getFile() .trim() .equals("") )
        {
        File file = new File(Globals.TEMP_FILE_PATH + doc.getFile());
        if(file.exists() )
        {
        String newFileName="arc_"+System.currentTimeMillis() +FileUtil.getExtension(file.getName() ) ;
        FileUtil.copy(Globals.TEMP_FILE_PATH + doc.getFile(),Globals.TEMP_FILE_PATH + newFileName);
        arc.setFile( newFileName);
        }
        }
        getDao().add(arc) ;
        //        omi.close() ;
         *
         */
       // dao.endTransaction();
        return "success";
    }

    public OperationManagement getDao()
    {
        return dao;
    }

    public void setDao(OperationManagement dao)
    {
        this.dao = dao;
    }
}
