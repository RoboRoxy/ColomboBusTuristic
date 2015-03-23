<jsp:useBean id="cbtb" class="cbturistic.CBTbean" scope="session"/>

<%

if(request.getParameter("funcname").contains("signupUser")) {

    String str = cbtb.signupUser(request.getParameter("fname"), request.getParameter("lname"), request.getParameter("address1"), request.getParameter("address2"), request.getParameter("address3"), request.getParameter("telephone"), request.getParameter("semail"), request.getParameter("password1"), request.getParameter("securityquestion"), request.getParameter("answersecurityquestion"));
    out.println(str);

}

if(request.getParameter("funcname").contains("loginUser")) {

    String str = cbtb.loginUser(request.getParameter("useremail"), request.getParameter("userpassword"));
    out.println(str);

}

if(request.getParameter("funcname").contains("logoutUser")) {
    cbtb.customerFullName = null;
    cbtb.CustomerID = 0;
    cbtb.CartTotal = 0;
}

if(request.getParameter("funcname").contains("alterCustomerTable")) {

    String str = cbtb.alterCustomerTable(request.getParameter("fname"), request.getParameter("lname"), request.getParameter("address1"), request.getParameter("address2"), request.getParameter("address3"), request.getParameter("telephone"), request.getParameter("semail"), request.getParameter("password1"), request.getParameter("securityquestion"), request.getParameter("answersecurityquestion"));
    out.println(str);

}

if(request.getParameter("funcname").contains("getOneBusCharge")) {

    String str = cbtb.getOneBusCharge(request.getParameter("typeofbusid"), request.getParameter("typeoftourid"));
    out.println(str);

}

if(request.getParameter("funcname").contains("addTourToCart")) {

    String str = "";

    if(cbtb.CustomerID == 0) {
        out.println("Please login first to place orders");
    }
    else {
        str = cbtb.addTourToCart(request.getParameter("tourname"), request.getParameter("resdate"), request.getParameter("typeofbus"), request.getParameter("typeoftour"), request.getParameter("noofdays"), request.getParameter("onebusfee"), request.getParameter("noofbuses"), request.getParameter("totalfee"));
        out.println(str);
    }

}

if(request.getParameter("funcname").contains("refreshCartTotal")) {
    out.println(cbtb.CartTotal);
}

if(request.getParameter("funcname").contains("itemLoader")) {

    cbtb.sqlQueryString = "SELECT * FROM `iteminventory`,`item` WHERE iteminventory.ItemID = item.ItemID AND iteminventory.AvailableInventoryQty > 0 AND iteminventory.ItemTypeID="+request.getParameter("itemtypeid")+" ORDER BY "+request.getParameter("columnname")+" "+request.getParameter("sorttype");
    cbtb.rs = cbtb.stmt.executeQuery(cbtb.sqlQueryString);

        while(cbtb.rs.next()) {
            out.println("<div class=\"foodorbeverageholder\">"+
            "<b>"+cbtb.rs.getString(7)+"</b> <br /> RS."+cbtb.rs.getInt(4)+"/="+
            "<img alt=\"Picture\" src=\"/ColomboBusTuristic/Content/images/"+cbtb.rs.getString(9)+"\" width=\"200\" />"+
            "<input type=\"text\" size=\"3\" value=\"Qty\" onclick=\"if ($(this).val() == 'Qty') { $(this).val(''); }\" />"+
            "<div onclick=\"addItemToCart('"+cbtb.rs.getInt(3)+"','"+cbtb.rs.getInt(4)+"',$(this).parent())\">Add to cart</div>"+
            "</div>");
        }

}

if(request.getParameter("funcname").contains("addItemToCart")) {

    String str = "";

    if(cbtb.CustomerID == 0) {
        out.println("Please login first to place orders");
    }
    else {
        str = cbtb.addItemToCart(request.getParameter("itemid"), request.getParameter("itemprice"), request.getParameter("itemqty"));
        out.println(str);
    }

}

if(request.getParameter("funcname").contains("removeItemFromCart")) {

    String str = "";

    if(cbtb.CustomerID == 0) {
        out.println("Please login first to remove this item");
    }
    else {
        str = cbtb.removeItemFromCart(request.getParameter("cartitemid"), request.getParameter("carttotal"));
        out.println(str);
    }    

}

if(request.getParameter("funcname").contains("removeTourFromCart")) {

    String str = "";

    if(cbtb.CustomerID == 0) {
        out.println("Please login first to remove the tour");
    }
    else {
        str = cbtb.removeTourFromCart();
        out.println(str);
    }    

}

if(request.getParameter("funcname").contains("checkoutbtnClick")) {

    String str = "";

    if(cbtb.CustomerID == 0) {
        out.println("Please login first to checkout");
    }
    else {
        str = cbtb.checkoutbtnClick();
        out.println(str);
    }    

}

if(request.getParameter("funcname").contains("getOrderItemTable")) {

    String str = "";

    if(cbtb.CustomerID == 0) {
        out.println("Please login first");
    }
    else {
        cbtb.sqlQueryString = "SELECT `ItemName`, `ItemQty`, `ItemUnitPrice`, `OrderItemTotal` "+
                         "FROM `orderitem`, `item` "+
                         "WHERE orderitem.OrderID="+request.getParameter("orderid")+" "+
                         "AND orderitem.ItemID=item.ItemID";

        cbtb.rs = cbtb.stmt.executeQuery(cbtb.sqlQueryString);
        out.println("<div onclick=\"$('.orderitemtableholder').slideUp()\"><big><b>Close</b></big></div>"+
                    "<table>"+
                    "<tr><th>Name</th><th>Qty</th><th>Unit price</th><th>Total</th></tr>");
        while(cbtb.rs.next()) {
            
            out.println("<tr><td>"+cbtb.rs.getString(1)+"</td><td class=\"pricecols\">"+cbtb.rs.getString(2)+"</td><td class=\"pricecols\">"+cbtb.rs.getString(3)+"</td><td class=\"pricecols\">"+cbtb.rs.getString(4)+"</td></tr>");
                
        }

        cbtb.sqlQueryString = "SELECT SUM(OrderItemTotal)AS GT FROM `orderitem` WHERE OrderID="+request.getParameter("orderid");
        cbtb.rs = cbtb.stmt.executeQuery(cbtb.sqlQueryString);
        while(cbtb.rs.next()) {
            out.println("<tr id=\"carttotalrow\"><td><b>All Item Total</b></td><td></td><td></td><td><b>"+cbtb.rs.getString(1)+"</b></td></tr>");
        }

        out.println("</table>");
    }    

}

if(request.getParameter("funcname").contains("cancelTour")) {

    String str = "";

    if(cbtb.CustomerID == 0) {
        out.println("Please login first to checkout");
    }
    else {
        str = cbtb.cancelTour(request.getParameter("orderid"));
        out.println(str);
    }    

}

if(request.getParameter("funcname").contains("getSecuQuestion")) {

    String str = cbtb.getSecuQuestion(request.getParameter("forgotemail"));
    out.println(str);

}

if(request.getParameter("funcname").contains("getSecuAnswer")) {

    String str = cbtb.getSecuAnswer(request.getParameter("forgotemail"), request.getParameter("usersans"));
    out.println(str);

}

if(request.getParameter("funcname").contains("submitRating")) {

    String str = "";

    if(cbtb.CustomerID == 0) {
        out.println("Please login first to submit your rating");
    }
    else {
        str = cbtb.submitRating(request.getParameter("starrate"), request.getParameter("usercomment"));
        out.println(str);
    }    

}

if(request.getParameter("funcname").contains("removeRating")) {

    String str = "";

    if(cbtb.CustomerID == 0) {
        out.println("Please login first to remove your rating");
    }
    else if(Integer.parseInt(request.getParameter("userid").trim()) != cbtb.CustomerID) {
        out.println("You're not the owner of this rating");
    }
    else {
        str = cbtb.removeRating(request.getParameter("userratingid"));
        out.println(str);
    }

}
%>