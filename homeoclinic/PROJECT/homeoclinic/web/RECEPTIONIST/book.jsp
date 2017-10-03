<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>

<html>
    <head>  </head>
    <body>
    <%
        String tocken="",staffid="",name="",gen="",adrs="",age="",time="",date="";
        String Editid="";
        if(request.getParameter("eid")!=null)
        
        {
            String sel="select * from tbl_booking where book_id='"+request.getParameter("eid")+"'";
            ResultSet rs=obj.select(sel);
            if(rs.next())
            {
               tocken=rs.getString("book_tocken");
              date=rs.getString("book_date");
               staffid=rs.getString("staff_id");
               name=rs.getString("book_name");
               gen=rs.getString("book_gen");
               adrs=rs.getString("book_adrs");
                age=rs.getString("book_age");
                Editid=request.getParameter("eid");
                           }
        }
         if(request.getParameter("did")!=null)
            {
                 String del="delete from tbl_booking where book_id='"+ request.getParameter("did")  +"'";
                 boolean b=obj.insert(del);
                    if(b)
                        {
                         response.sendRedirect("booking.jsp");
                        }
            }       
         
        
        String submit=request.getParameter("btn_submit");
        if(submit!=null)
        {
            String BTocken=request.getParameter("txt_name");
             String BDate=request.getParameter("txt_adrs");
            String BName=request.getParameter("txt_adrs");
            String BGen=request.getParameter("txt_mob");
            String BAdrs=request.getParameter("txt_email");
             String BAge=request.getParameter("txt_email");
            String StaffId=request.getParameter("ddl_doc");
            String BTime=request.getParameter("gen");
            
             
                            String ins="insert into tbl_booking(book_tocken,book_date,staff_id,book_name,book_gen,book_adrs,book_age,book_time)values('"+BTocken+"','"+BDate+"','"+StaffId+"','"+BName+"','"+BGen+"','"+BAdrs+"','"+BAge+"','"+BTime+"')";
                            boolean b= obj.insert(ins);
                            out.print(ins);
                    if(b)
                         {
                
                         response.sendRedirect("book.jsp");
                
                          }
                      
                    else
                         {
                         out.println(b);
                         }
                                }
        }
        %>
        
    <center><form name="frm1" method="">
            <input type="hidden" name="hid" value="">
            <table width="">

   <tr>
       <td>Tocken</td><td><input type="text"  id="txt_tocken" name="txt_tocken" ></td>
   </tr>
   <tr>
       <td>Date</td><td><input type="datetime" id="date"  name="date" ></td>
      	</tr>
<tr>
            <td>Doctor</td><td><select id="ddl_doc" name="ddl_doc">
                    <option>-----select-------</option>
                   <%
                        
                        String sel="select * from tbl_staff s,tbl_designation d where s.des_id=d.des_id and d.des_name='Doctor'";
                        ResultSet rs=obj.select(sel);
                        while(rs.next())
                        {%>   
                        <option value="<%=rs.getString("staff_id")%>" <% if(staffid.equals(rs.getString("staff_id"))) {%> selected="" <% } %>     > <%=rs.getString("staff_name")%></option>   
                        <%  
                          }


                    %>
                    
            </td></tr>
</tr>
<tr>
	<td>Name</td><td><input type="text"  id="txt_name" name="txt_name" ></td>
        
</tr>
<tr>
    <td>Gender</td><td><input type="radio" name="gen" value="Male" id="r1">Male</td>
            <td><input type="radio" id="r1" name="gen" value="Female">Female</td>
</tr>
    <tr>
            <td>Address</td><td><textarea id="txt_adrs" name="txt_adrs" ></textarea></td>
    </tr>
    <tr>
	<td>Age</td><td><input type="text" id="txt_age"  name="txt_age" ></td>
      	</tr>
        
 <tr>
     <td>Book Time</td><td><input type="time" id="time"  name="time" ></td>
      	</tr>
        

         
<tr>
	<td><input type="submit" id="btn_submit" name="btn_submit" value="Ok"></td>
	<td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"</td>
	</tr><
            </table>
                   <table border=".1">
                <tr><th>Booking Details</th></tr><tr><td>Name</td><td>Age</td><td>Address</td><td>Mobile</td><td>Email</td><td>Doctor</td><td>Gender</td><td>Edit</td><td> Delete</tr>
                <%
                    String sel1="select * from tbl_booking";
                    ResultSet rs1=obj.select(sel1);
                    while(rs1.next())
                    { %>
                    <tr><td><%=rs1.getString("pat_name")%></td> <td><%=rs1.getString("pat_age")%> <td><%=rs1.getString("pat_adrs")%><td><%=rs1.getString("pat_mob")%></td><td><%=rs1.getString("pat_email")%></td> <td><%=rs1.getString("staff_id")%></td><td><%=rs1.getString("pat_gen")%></td> <td><a href="patient.jsp?eid=<%=rs1.getString("pat_id")%>">Edit</a> <td><a href="patient.jsp?did=<%=rs1.getString("pat_id")%>">Delete</a></td>
                                     <%     
                              }

                     %>
            </table>
</form>
	</center>
                 
    </body>
</html>

