<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="webwork" prefix="ww" %>
[
				<ww:iterator value="objList" id="class2" status="index">
					{"id":"<ww:property value="id"/>","name":"<ww:property value="name"/>"}<ww:if test="#index.index!=objList.size()-1">,</ww:if>
				</ww:iterator>
]