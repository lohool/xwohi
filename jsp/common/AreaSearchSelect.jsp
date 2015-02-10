<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="webwork" prefix="ww" %>
[
	{"","----"}
				<ww:iterator value="objList" id="class2" status="index">
					,{"<ww:property value="id"/>","<ww:property value="name"/>"}
				</ww:iterator>
]