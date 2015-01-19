/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.lohool.jproject.xwohi;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import net.sf.json.JSONArray;

/**
 *
 * @author xingbao-
 */
public class Test {
    
    public static void main(String[] args)
    {
        String path="D:/apache-tomcat-7.0.42/webapps/ROOT/temp_file/${USER}/";
            path=     path.replaceAll("\\$\\{USER\\}", "aa");
            //System.out.println(path);
            
            
            String str="sinterS00s";   
Pattern pattern = Pattern.compile(".*[A-Z].*");   
Matcher matcher = pattern.matcher(str);   
//System.out.println(matcher.matches());   


ArrayList list=new ArrayList();
list.add("test");
JSONArray o=JSONArray.fromObject(list);
System.out.println(o.toString());  
    }
}
