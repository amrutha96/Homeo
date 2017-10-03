<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>

<html>
    <head>  </head>
    <body>
    <%
        
        String medid="",mandate="",expdate="",qty="",unitid="";
        String Editid="";
        if(request.getParameter("eid")!=null)
        
        {
            String sel="select * from tbl_stock where stk_id='"+request.getParameter("eid")+"'";
            ResultSet rs=obj.select(sel);
            if(rs.next())
            {
               medid=rs.getString("med_id");
               mandate=rs.getString("stk_mandate");
               expdate=rs.getString("stk_exp");
               qty=rs.getString("stk_qty");
               unitid=rs.getString("unit_id");
               Editid=request.getParameter("eid");
            }
        }
           
                
         if(request.getParameter("did")!=null)
        {
            String del="delete from tbl_stock where stk_id='"+ request.getParameter("did")  +"'";
           boolean b= obj.insert(del);
           if(b)
           {
              response.sendRedirect("stock.jsp");
           }
        }       
        
        String submit=request.getParameter("btn_submit");
        if(submit!=null)
        {
            String Medname=request.getParameter("ddl_med");
            String Mandate=request.getParameter("mandate");
            String ExpDate=request.getParameter("expdate");
            String stkQty=request.getParameter("txt_qty");
            String Unit=request.getParameter("ddl_unit");
            
            if(request.getParameter("hid")!=""){
                String up="update tbl_stock set med_id='"+Medname+"',stk_exp='"+ ExpDate+"',stk_mandate='"+Mandate+"',stk_qty='"+stkQty+"',unit_id='"+Unit+"' where stk_id='"+request.getParameter("hid")+"'";
             boolean b= obj.insert(up);
             if(b==true)
             {
             response.sendRedirect("stock.jsp");
             }else{
            out.println(up);
             }
                    }else{
            String ins="insert into tbl_stock(med_id,stk_exp,stk_mandate,stk_qty,unit_id)values('"+Medname+"','"+ExpDate+"','"+Mandate+"','"+Unit+"','"+stkQty+"')";
                boolean b= obj.insert(ins);
            out.println(ins);
                      if(b)
            {
                
                response.sendRedirect("stock.jsp");
                  
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

    <th><u><b>Stock details</b></u></th>
	<tr>
            <td>Medicine Name</td><td><select id="ddl_med" onchange="sel(this.value)" name="ddl_med">
                    <option>-----select-------</option>
                   <%
                        
                        String sel="select * from tbl_medicine";
                        ResultSet rs=obj.select(sel);
                        while(rs.next())
                        {%>
                        <option value="<%=rs.getString("med_id")%>" <% if(medid.equals(rs.getString("med_id"))) {%> selected="" <% } %>     > <%=rs.getString("med_name")%></option>   
                        <%  
                          }
%></tr>
                    
                     <tr>
            <td>Man.Date</td><td><input type="date"  value="<%=mandate%>"   id="mandate" name="mandate" ></td>
	</tr>
        <tr>
            <td>Exp.Date</td><td><input type="date"  value="<%=expdate%>"   id="expdate" name="expdate" ></td>
	</tr>
          <tr>
            <td>Quantity</td><td><input type="text"  value="<%=qty%>"   id="txt_qty" name="txt_qty" ></td>
	</tr>
       <tr>
            <td>Unit</td><td><select id="ddl_unit" onchange="sel(this.value)" name="ddl_unit">
                    <option>-----select-------</option>
                   <%
                        
                        String sel2="select * from tbl_unit ";
                        ResultSet rs1=obj.select(sel2);
                        while(rs1.next())
                        {%>
                        <option value="<%=rs1.getString("unit_id")%>" <% if(unitid.equals(rs1.getString("unit_id"))) {%> selected="" <% } %>  > <%=rs1.getString("unit_name")%></option>   
                        <%  
                          }
                        %>
                               </tr>
	<tr>
	<td><input type="submit" id="btn_submit" name="btn_submit" value="Ok"></td>
	<td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"</td>
	</tr>
	</table>
            <table border=".1">
                <tr><th>Stock Details</th></tr><tr><td>Medicine Name</td><td>Manu.Date</td><td>Exp.Date</td><td>Quantity</td><td>Unit</td><td>edit</td><td> Delete</tr>
                <%
                    String sel1="select * from tbl_stock s,tbl_medicine m, tbl_unit u where s.med_id=m.med_id and s.unit_id=u.unit_id";
                    ResultSet rs2= obj.select(sel1);
                    while(rs2.next())
                    { %>
                    <tr><td><%=rs2.getString("med_name")%></td> <td><%= rs2.getString("stk_mandate")%> <td><%= rs2.getString("stk_exp")%><td><%=rs2.getString("stk_qty")%> <td><%= rs2.getString("unit_name")%></td></td><td><a href="stock.jsp?eid=<%= rs2.getString("stk_id")%>">Edit</a> <td><a href="stock.jsp?did=<%= rs2.getString("stk_id")%>">Delete</a></td>
                                     <%     
                              }

                     %>
            </table>
</form>
	</center>
    </body>
</html>
