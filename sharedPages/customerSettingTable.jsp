<table id="signuptable">
<%
    if(cbtb.CustomerID != 0) {
        try {
            cbtb.rs = cbtb.stmt.executeQuery("SELECT * FROM `customer` WHERE CustomerID="+cbtb.CustomerID);
            while(cbtb.rs.next()) {

                out.println("<tr>"+
                    "<th><big>Account settings</big></th><th><img alt=\"waiting...\" src=\"/ColomboBusTuristic/Content/images/waitingforres.gif\" /></th>"+
                "</tr>"+
                "<tr>"+
                    "<td>First Name</td><td><input type=\"text\" size=\"25\" id=\"fname\" value='"+cbtb.rs.getString(2)+"' /></td>"+
                "</tr>"+
                "<tr>"+
                    "<td>Last Name</td><td><input type=\"text\" size=\"25\" id=\"lname\" value='"+cbtb.rs.getString(3)+"' /></td>"+
                "</tr>"+
                "<tr>"+
                    "<td>Address 1</td><td><input type=\"text\" size=\"25\" id=\"address1\" value='"+cbtb.rs.getString(4)+"' /></td>"+
                "</tr>"+
                "<tr>"+
                    "<td>Address 2</td><td><input type=\"text\" size=\"25\" id=\"address2\" value='"+cbtb.rs.getString(5)+"' /></td>"+
                "</tr>"+
                "<tr>"+
                    "<td>Address 3</td><td><input type=\"text\" size=\"25\" id=\"address3\" value='"+cbtb.rs.getString(6)+"' /></td>"+
                "</tr>"+
                "<tr>"+
                    "<td>Telephone</td><td><input type=\"tel\" size=\"25\" id=\"telephone\" value='"+cbtb.rs.getInt(7)+"' /></td>"+
                "</tr>"+
                "<tr>"+
                    "<td>Email address</td><td><input type=\"email\" size=\"25\" id=\"semail\" value='"+cbtb.rs.getString(8)+"' /></td>"+
                "</tr>"+
                "<tr>"+
                    "<td>Password</td><td><input type=\"password\" size=\"25\" id=\"password1\" /></td>"+
                "</tr>"+
                "<tr>"+
                    "<td>Re-type Password</td><td><input type=\"password\" size=\"25\" id=\"password2\" /></td>"+
                "</tr>"+
                "<tr>"+
                    "<td>Select security question</td><td><input type=\"text\" size=\"25\" id=\"securityquestion\" value='"+cbtb.rs.getString(11)+"' /></td>"+
                "</tr>"+
                "<tr>"+
                    "<td>Answer</td><td><input type=\"text\" size=\"25\" id=\"answersecurityquestion\" value='"+cbtb.rs.getString(12)+"' /></td>"+
                "</tr>"+
                "<tr>"+
                    "<td><a>Save changes</a></td><td><span></span></td>"+
                "</tr>");

            }

        }
        catch(Exception ex) {
        }
    }
%>
</table>