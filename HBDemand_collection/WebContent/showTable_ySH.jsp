<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>已通过审核</title>
</head>
<style type="text/css">
<!--
 .STYLE1 {
	font-family: "楷体";
	font-size: 18px;
	color: #666666;
	font-weight: bold;
}
 .STYLE2 {
	font-family: "楷体";
	font-size: 16px;
	color: #000000;
}
-->
</style>
<body>
<div align="left" style="margin-top:50px">已审核的征集表信息</div>
		<table class="STYLE2" border="1" align="center" cellpadding="4" cellspacing="0" style="margin-top:20px;margin-bottom:50px">
			<tr>
				<th>需求编号</th>
				<th>需求名称</th>
				<th>关键字</th>
				<th>审核状态</th>
				<th>操作</th>
			</tr>
<jsp:useBean id="db" class="pkg.connection" scope="page" />
	<%
		request.setCharacterEncoding("UTF-8");
	    String username = (String)session.getAttribute("username_c");
	    int SHstate=1;
		int num1=0;
		String sql1="select count(*) num2 from tb_Comand where SHstate = '" + SHstate + "' and userName='"+username+"'";
		ResultSet rs1=db.executeQuery(sql1);
		while(rs1.next()){
			num1=rs1.getInt("num2");
		}
		if(num1!=0){
			ResultSet rs = db.executeQuery("select * from tb_Comand where SHstate = '" + SHstate + "' and userName='"+username+"'");
			rs.next();
			String SHstate1="已审核";
			String num=rs.getString(2);
			
			while(rs.next()){
		    	out.println("<tr><td>"+rs.getString(2)+"</td><td>"+rs.getString(7)
		    	+"</td><td>"+rs.getString(12)+rs.getString(13)+rs.getString(14)+rs.getString(15)+rs.getString(16)
		    	+"</td><td>"+SHstate1+"</td><td><a href='showTable_yhus.jsp?NO="+num
		    	+"'>查看</a></td></tr>");
		    }
			rs.close();
		    db.close();
		}
	%>
	</table>
</body>
</html>