            <div id="cartitemsholder">
                <big>Your Tour Details :</big><br /><br />
<%
if(cbtb.CustomerID != 0)
    out.println("<label onclick=\"removeTourFromCart()\">Remove the tour with items?</label><br /><br />");
%>
                <table>
<%
if(cbtb.CustomerID != 0) {
    cbtb.rs = cbtb.stmt.executeQuery("SELECT * FROM `cart`,`categorytour`,`categorybus` WHERE cart.CustomerID="+cbtb.CustomerID+" AND cart.CategoryBusID = categorybus.CategoryBusID AND cart.CategoryTourID = categorytour.CategoryTourID");
    while(cbtb.rs.next()) {
        out.println("<tr><th>Tour Name :</th><td>"+cbtb.rs.getString(3)+"</td></tr>"+
                    "<tr><th>Reserved date :</th><td>"+cbtb.rs.getDate(4)+"</td></tr>"+
                    "<tr><th>Tour Category :</th><td>"+cbtb.rs.getString(12)+"</td></tr>"+
                    "<tr><th>Bus Type :</th><td>"+cbtb.rs.getString(14)+"</td></tr>"+
                    "<tr><th>No of days :</th><td>"+cbtb.rs.getInt(8)+"</td></tr>"+
                    "<tr><th>No of buses :</th><td>"+cbtb.rs.getInt(7)+"</td></tr>"+
                    "<tr><th>Fee on one bus :</th><td>"+cbtb.rs.getLong(9)+"</td></tr>"+
                    "<tr><th>Total charge on bus :</th><td>"+cbtb.rs.getInt(7) * cbtb.rs.getInt(9)+"</td></tr>");
    }
}
%>
                </table>
                <br />
                <big>Items You Ordered :</big><br /><br />
                <table id="cartitemtable">
<%
if(cbtb.CustomerID != 0) {
    cbtb.rs = cbtb.stmt.executeQuery("SELECT * FROM `cartitem`,`item` WHERE cartitem.CustomerID = "+cbtb.CustomerID+" AND cartitem.ItemID = item.ItemID");
    while(cbtb.rs.next()) {
        out.println("<tr id=\"cartitid"+cbtb.rs.getInt(1)+"\"><td><img width='40' src='/ColomboBusTuristic/Content/images/"+cbtb.rs.getString(11)+"' alt='"+cbtb.rs.getString(9)+"' /></td><th>"+cbtb.rs.getString(9)+"</th><td>"+cbtb.rs.getInt(6)+" * "+cbtb.rs.getInt(5)+"</td><td>"+cbtb.rs.getInt(7)+"</td><td><label onclick=\"removeItemFromCart('"+cbtb.rs.getInt(1)+"', '"+cbtb.rs.getInt(7)+"')\">Remove?</label></td></tr>");
    }
    cbtb.rs = cbtb.stmt.executeQuery("SELECT SUM(CartItemTotal) AS grandtotal FROM `cartitem` WHERE CustomerID="+cbtb.CustomerID);
    while(cbtb.rs.next()) {
        out.println("<tr id=\"carttotalrow\"><th></th><th>Item total</th><td></td><td><span id=\"carttotalcell\">"+cbtb.rs.getLong(1)+"</span></td><td></td></tr>");
    }
}
%>
                </table>
                <br />
<%
if(cbtb.CustomerID != 0) {
    out.println("<big><b>Total Charge : <span id=\"totalchargecell\">"+cbtb.CartTotal+"</span></b></big>");
    out.println("<div id=\"checkoutbtn\"><b>Checkout</b></div>");
}
%>
            </div>