            <h2>Order History</h2>
            <table class="ordertable">
                <tr>
                    <th>Tour Name</th><th>Ordered Date</th><th>Charge On One Bus</th><th>No Of Buses</th><th>No Of Days</th><th>Total Order Cost</th><th>Tour Type</th><th>Bus Type</th><th>Reserved Date</th><th>Order Status</th>
                </tr>
<%

if(cbtb.CustomerID != 0) {
    cbtb.rs = cbtb.stmt.executeQuery("SELECT * "+
        "FROM `order` , `categorybus` , `categorytour` , `orderstatus` "+
        "WHERE order.CategoryBusID = categorybus.CategoryBusID "+
        "AND order.CategoryTourID = categorytour.CategoryTourID "+
        "AND order.OrderStatusID = orderstatus.OrderStatusID "+
        "AND order.CustomerID ="+cbtb.CustomerID+" ORDER BY OrderedDate DESC");

    while(cbtb.rs.next()) {
        out.println("<tr class=\"datarow\" data-orderno=\""+cbtb.rs.getInt(1)+"\">"+
                    "<td>"+cbtb.rs.getString(8)+"</td><td>"+cbtb.rs.getDate(3)+"</td><td>"+cbtb.rs.getString(7)+"</td><td>"+cbtb.rs.getInt(10)+"</td><td>"+cbtb.rs.getInt(11)+"</td><td>"+cbtb.rs.getString(2)+"</td><td>"+cbtb.rs.getString(17)+"</td><td>"+cbtb.rs.getString(14)+"</td><td>"+cbtb.rs.getDate(9)+"</td><td id=\"orderstatus"+cbtb.rs.getInt(1)+"\">"+cbtb.rs.getString(19)+"</td>"+
                "</tr>");
    }
}
%>
            </table>