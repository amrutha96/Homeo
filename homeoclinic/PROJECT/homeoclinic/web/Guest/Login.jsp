<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class= "db_homeo.db_connection"> </jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
    <%
        String submit=request.getParameter("btn_submit");
        if(submit!=null)
        {
            String ad_name=request.getParameter("txt_name");
            String ad_pswd=request.getParameter("txt_pswd");
            String sel="select * from tbl_admin where admin_user='Admin' and admin_pswd='Admin'"; 
            String seldoc="select * from tbl_staff where staff_user='"+ad_name+"' and staff_pswd='"+ad_pswd+"'";
             ResultSet rs=obj.select(sel);
            
           if(rs.next())
             {
                response.sendRedirect("../ADMIN/HomePage.jsp");
                out.println("Login Success");
            
             }
             else
             {
             out.print("Login Fail");
             }  
        }
    %>
       <center><form name="frm1" method="post">
            <input type="hidden" name="hid">
            <table width="">
                <tr><td>User Name</td><td> <input type="text" name="txt_name" id="txt_name"</tr>
                 <tr><td>Password</td><td> <input type="password" name="txt_pswd" id="txt_pswd"</tr>
                 <tr>
                <td><input type="submit" id="btn_submit" name="btn_submit" value="Ok" onclick="return fval()"></td>
                <td><input type="reset" id="btn_reset" name="btn_reset" value="Cancel"</td>
                </tr>
            </table> 
           </form>
       </center>
        
    </body>
</html>
