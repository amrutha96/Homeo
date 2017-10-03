<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>

<html>
    <head>
       
            
              
    </head>
    <body>
    <%
        String supid="",medid="",unitid="";
    %>

    <center><form name="frm1" method="">
            <input type="hidden" name="hid" value="<%=%>">
            <table width="">

   <tr>
       <td>Order No</td><td><input type="text" value="<%=%>" id="txt_orderno" name="txt_orderno" ></td>  <td>Date</td><td><input type="date" value="<%=%>" id="date" name="date" ></td>
   </tr>
   <tr>
      <tr>
    <td>Supplier</td><td><select id="ddl_sup" onchange="sel(this.value)" name="ddl_sup">
                    <option>-----select-------</option>
                   <%
                        
                        String sel="select * from tbl_supplier";
                        ResultSet rs=obj.select(sel);
                        while(rs.next())
                        {%>
                        <option value="<%=rs.getString("sup_id")%>" <% if(supid.equals(rs.getString("sup_id"))) {%> selected="" <% } %>     > <%=rs.getString("sup_name")%></option>   
                        <%  
                          }
                    %>
           </td><td> for Date</td><td><input type="date" value="<%=%>" id="fordate" name="fordate" ></td> 
   </tr>
    </table>
            <table width="">
    <tr>
          <td>Medicine</td><td><select id="ddl_med" onchange="sel(this.value)" name="ddl_med">
                    <option>-----select-------</option>
                   <%
                        
                        String sel1="select * from tbl_medicine";
                        ResultSet rs1=obj.select(sel1);
                        while(rs1.next())
                        {%>
                        <option value="<%=rs1.getString("med_id")%>" <% if(medid.equals(rs1.getString("med_id"))) {%> selected="" <% } %>     > <%=rs1.getString("med_name")%></option>   
                        <%  
                          }
%></td>
    </tr>
<tr>
    
	<td>Quantity</td><td><input type="text" value="<%=%>" id="txt_qty" name="txt_qty" ></td><td>Unit</td><td><select id="ddl_unit" onchange="sel(this.value)" name="ddl_unit">
                    <option>-----select-------</option>
                   <%
                        
                        String sel2="select * from tbl_unit";
                        ResultSet rs2=obj.select(sel2);
                        while(rs2.next())
                        {%>
                        <option value="<%=rs2.getString("unit_id")%>" <% if(unitid.equals(rs2.getString("unit_id"))) {%> selected="" <% } %>     > <%=rs2.getString("unit_name")%></option>   
                        <%  
                          }
%></td>
        <tr><td><input type="submit" id="btn_submit" name="btn_add" value="Add"></td></tr>
        
</tr>
            </table> 
        <table width="">
            <tr><th>Staff Details</th></tr><tr><td>Name</td><td>Address</td><td>Mail Id</td><td>Mobile</td><td>Gender</td><td>Consultation Fee</td><td>Date Of Join</td><td>Marital Status</td><td>Salary</td><td>Date Of Birth</td><td>Experience</td><td>Designation</td><td>Username</td><td>Password</td><td>Edit</td><td> Delete</tr>
            <tr>
	<td><input type="submit" id="btn_submit" name="btn_submit" value="Ok"></td>
	<td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"</td>
	</tr>
        </table>
               
</form>
    </center>              
    </body>
</html>


