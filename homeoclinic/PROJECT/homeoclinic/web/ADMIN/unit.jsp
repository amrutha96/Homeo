<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>

<html>
    <head>  </head>
    <body>
    <%
        
        String unitname="",unitid="";
        String Editid="";
        if(request.getParameter("eid")!=null)
        
        {
            String sel="select * from tbl_unit where unit_id='"+request.getParameter("eid")+"'";
            ResultSet rs=obj.select(sel);
            if(rs.next())
            {
               unitname=rs.getString("unit_name");
                Editid=request.getParameter("eid");
            }
        }
        
        
        
         if(request.getParameter("did")!=null)
        {
            String del="delete from tbl_unit where unit_id='"+ request.getParameter("did")  +"'";
           boolean b= obj.insert(del);
           if(b)
           {
              response.sendRedirect("unit.jsp");
           }
        }       
        
        String submit=request.getParameter("btn_submit");
        if(submit!=null)
        {
            String UnitName=request.getParameter("txt_unit");
            if(request.getParameter("hid")!=""){
                String up="update tbl_unit set unit_name='"+UnitName+"' where unit_id='"+request.getParameter("hid")+"'";
             boolean b= obj.insert(up);
             if(b==true)
             {
             response.sendRedirect("unit.jsp");
             }else{
            out.println(up);
             }
                    }else{
            String ins="insert into tbl_unit(unit_name)values('"+UnitName+"')";
           //out.print(ins);
            boolean b= obj.insert(ins);
            
                      if(b)
            {
                
                response.sendRedirect("unit.jsp");
                  
            }
                      
            else
            {
            out.println(b);
            }
        }
        }
        %>
        
    <center><form name="frm1" method="">
            <input type="hidden" name="hid" value="<%=Editid%>">
<table width="">

    <th><u><b>Unit</b></u></th>
	<tr>
            <td>Unit name</td><td><input type="text"  value="<%=unitname%>"   id="txt_unit" name="txt_unit" ></td>
	</tr>
	<tr>
	<td><input type="submit" id="btn_submit" name="btn_submit" value="Ok"></td>
	<td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"</td>
	</tr>
	</table>
            <table border=".1">
                <tr><td><th>Unit</th></td></tr>
                <%
                    String sel="select * from tbl_unit";
                    ResultSet rs=obj.select(sel);
                    while(rs.next())
                    { %>
                    <tr><td><%= rs.getString("unit_name")%></td><td><a href="unit.jsp?eid=<%= rs.getString("unit_id")%>">Edit</a> 
                        <td><a href="unit.jsp?did=<%= rs.getString("unit_id")%>">Delete</a></td></td></tr>
                    <%     
                              }

                     %>
            </table>
</form>
	</center>
                 
    </body>
</html>