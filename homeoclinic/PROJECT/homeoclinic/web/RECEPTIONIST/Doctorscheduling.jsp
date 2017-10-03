<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>
<html>
    <head>
   </head>
    <body>
          <%
        
        String dayshid="",staffid="",docshday="",docshid="";
        String Editid="";
        if(request.getParameter("eid")!=null)
        
        {
            String sel="select * from tbl_doctorschedule where docshed_id='"+request.getParameter("eid")+"'";
            ResultSet rs=obj.select(sel);
            if(rs.next())
            {
             dayshid=rs.getString("dayshed_id");
             staffid=rs.getString("staff_id");
             docshday=rs.getString("docshed_day");
                Editid=request.getParameter("eid");
            }
        }
        
        
        
         if(request.getParameter("did")!=null)
        {
            String del="delete from tbl_doctorschedule where docshed_id='"+ request.getParameter("did")  +"'";
           boolean b= obj.insert(del);
           if(b)
           {
              response.sendRedirect("Doctorscheduling.jsp");
           }
        }       
        
        String submit=request.getParameter("btn_submit");
        if(submit!=null)
        {
            String Dayshid=request.getParameter("txt_dayshid");
            String Staffid=request.getParameter("txt_staffid");
            String Docshday=request.getParameter("txt_docshday");
            
                     
            if(request.getParameter("hid")!=""){
            String up="update tbl_doctorschedule set dayshed_id='"+Dayshid+"',staff_id='"+Staffid+"',docshed_day='"+Docshday+"' where docshed_id='"+request.getParameter("hid")+"'";
             boolean b= obj.insert(up);
             if(b==true)
             {
             response.sendRedirect("Doctorscheduling.jsp");
             }else{
            out.println(up);
             }
                    }else{
            String ins="insert into  tbl_doctorschedule(dayshed_id,staff_id,docshed_day)values('"+Dayshid+"','"+Staffid+"','"+ Docshday+"')";
                boolean b= obj.insert(ins);
            
                      if(b)
            {
                
                response.sendRedirect("Doctorscheduling.jsp");
                  
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

    <th><u><b>Doctor Scheduling</b></u></th>
	
    <tr> <td> Day Schedule</td><td><select id="txt_dayshid" name="txt_dayshid">
                            <option>------select-----</option>
                        <%
                        String sel="select * from tbl_dayschedule d,tbl_doctorschedule ds where d.dayshed_id=ds.dayshed_id";  
                        ResultSet rs=obj.select(sel);
                        while(rs.next())
                             {%>
                        <option value="<%=rs.getString("dayshed_id")%>" <% if(dayshid.equals(rs.getString("dayshed_id"))) {%> selected="" <% } %>> <%=rs.getString("dayshed_day")%></option>   
                               <%
                                 }
                               %>
                               </td>
                             </tr>
                        <tr>
                         <td>Doctor Scheduling</td><td><select id="txt_staffid" name="txt_staffid">
                            <option>-----select------</option>
                        <%
                        String sel1="select * from tbl_staff s,tbl_designation d where s.des_id=d.des_id and d.des_name='Doctor'";
                        ResultSet rs1=obj.select(sel1);
                        while(rs1.next())
                             {%>
                        <option value="<%=rs1.getString("staff_id")%>" <% if(staffid.equals(rs1.getString("staff_id"))) {%> selected="" <% } %>> <%=rs1.getString("staff_name")%></option>   
                               <%
                                 }
                               %> </td>
                         </tr>
<tr>
            <td>Day scheduling</td><td><input type="date"  value="<%=dayshid%>"   id="txt_docshday" name="txt_docshday" ></td>
	</tr>
      
	<tr>
	<td><input type="submit" id="btn_submit" name="btn_submit" value="Ok"></td>
	<td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"</td>
	</tr>
	</table>
            <table border=".1">
                <tr><th>View  Scheduled Details</th><tr><td>Day Scheduling</td><td>Doctor's Name</td><td>Doctor's Scheduling</td></tr>
                <%
                    String sel5="select * from  tbl_doctorschedule  dc,tbl_dayschedule ds ,tbl_staff s where dc.dayshed_id=ds.dayshed_id and dc.staff_id=s.staff_id";
                    ResultSet rs5=obj.select(sel5);
                    while(rs5.next())
                    { %>
                <tr><td><%= rs5.getString("dayshed_day")%></td><td><%= rs5.getString("staff_name")%></td><td><%= rs5.getString("docshed_day")%><td></td><td><a href="Doctorscheduling.jsp?eid=<%= rs5.getString("docshed_id")%>">Edit</a></td><td><a href="Doctorscheduling.jsp?did=<%= rs5.getString("docshed_id")%>">Delete</a></td></tr>
                
                    <%     
                              }

                     %>
            </table>
</form>
	</center>
                 
    </body>
</html>
