<div id="tourorderdetailholder">
    <div><big><b>Tour Details</b></big></div>
    <table id="tourorderdetailtable">
        <tr><th></th><th>Tour Type</th><th>Bus Type</th><th>Price</th><th>Maximum Days</th></tr>
        <%
        cbtb.rs = cbtb.stmt.executeQuery("SELECT * FROM categorydetail, categorytour, categorybus WHERE categorydetail.CategoryTourID = categorytour.CategoryTourID AND categorydetail.CategoryBusID = categorybus.CategoryBusID ORDER BY CategoryDetailID");
        while(cbtb.rs.next()) {
            out.println("<tr><td>"+cbtb.rs.getInt(1)+".</td><td>"+cbtb.rs.getString(7)+"</td><td>"+cbtb.rs.getString(9)+"</td><td>"+cbtb.rs.getInt(4)+"</td><td>"+cbtb.rs.getInt(5)+"</td></tr>");
        }
        %>
    </table>
</div>

<div id="tourorderform">
    <div><big><b>Add tour to cart</b></big></div>
    <table id="tourordertable">
        <tr>
            <td>Tour Name</td><td><input type="text" id="tourname" size="25" /></td>
        </tr>
        <tr>
            <td>Date of reservation</td><td><input type="text" id="resdate" size="25" /></td>
        </tr>
        <tr>
            <td>Type of the bus</td>
            <td>
                <select id="typeofbus">
                    <%
                    cbtb.rs = cbtb.stmt.executeQuery("SELECT * FROM categorybus");
                    while(cbtb.rs.next()) {
                        out.println("<option value='"+cbtb.rs.getInt(1)+"'>"+cbtb.rs.getString(2)+"</option>");
                    }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td>Type of the tour</td>
            <td>
                <select id="typeoftour">
                    <%
                    cbtb.rs = cbtb.stmt.executeQuery("SELECT * FROM categorytour");
                    while(cbtb.rs.next()) {
                        out.println("<option value='"+cbtb.rs.getInt(1)+"'>"+cbtb.rs.getString(2)+"</option>");
                    }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td>No of days</td><td><input type="text" id="noofdays" size="25" /></td>
        </tr>
        <tr>
            <td>Fee on one bus</td><td><input type="text" id="onebusfee" size="25" /></td>
        </tr>
        <tr>
            <td>No of Buses</td><td><input type="text" id="noofbuses" size="25" /></td>
        </tr>
        <tr>
            <td class="torderformbtns" id="torderformbtn1">Calculate Total</td><td><input type="text" id="totalfee" size="25" /></td>
        </tr>
        <tr>
            <td class="torderformbtns" id="torderformbtn2">Add to cart</td><td><img alt="waiting..." src="/ColomboBusTuristic/Content/images/waitingforres.gif" /></td>
        </tr>
    </table>
</div>