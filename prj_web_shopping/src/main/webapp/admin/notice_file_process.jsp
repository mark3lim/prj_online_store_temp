<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="사진 업로드 하는 jsp"%>
<%
File saveDir = new File("E:/dev/workspace/prj_web_shopping/src/main/webapp/upload");

int maxSize = 1024*1024*10; //10Mb
try{
MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());

//input type="file"인 것
String originFile = mr.getOriginalFileName("inputGroupFile04");
String newFile = mr.getFilesystemName("inputGroupFile04");

boolean flag = false;
if(newFile != null) {
	File tempFile = new File(saveDir.getAbsolutePath()+"/"+newFile);
	
	int limitSize = 1024*1024*5;
	if(tempFile.length() > limitSize) {
		flag = true;
		tempFile.delete();
	}
}

JSONObject jsonObj = new JSONObject();
if(!flag) { 
	jsonObj.put("uploadFlag", true);
	jsonObj.put("msg","업로드 성공하였습니다.");

} else {
	jsonObj.put("uploadFlag", false);
	jsonObj.put("msg", "originFile은 5Mbyte를 초과하였습니다.5Mbyte 이내의 파일만 업로드 가능합니다.");
}
out.print(jsonObj.toJSONString());
%>