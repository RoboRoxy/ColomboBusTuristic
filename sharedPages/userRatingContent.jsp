            <div id="overallaverageholder">
                <h2>Average rating</h2>
<%
cbtb.rs = cbtb.stmt.executeQuery("SELECT AVG( Stars ) AS Average_Stars FROM `userrating` ");
while(cbtb.rs.next()) {

   out.println(cbtb.rs.getFloat(1) * 20+" %"+
               "<div id=\"averageratingstarholder\" data-widthOfThis=\""+cbtb.rs.getFloat(1) * 100+"\">"+
                   "<img alt=\"avgstar\" src=\"/ColomboBusTuristic/Content/images/avgstarset.PNG\" width=\"500\" />"+
               "</div>");

}
%>

                <br />
                <table>

<%
cbtb.rs = cbtb.stmt.executeQuery("SELECT COUNT(*) AS Count FROM `userrating`");
while(cbtb.rs.next()) {

       out.println("<tr>"+
                       "<th>Total users rated : </th><td>"+cbtb.rs.getLong(1)+"</td>"+
                   "</tr>");
}

cbtb.rs = cbtb.stmt.executeQuery("SELECT COUNT(*) AS Count FROM `userrating` where Stars=1");
while(cbtb.rs.next()) {

       out.println("<tr>"+
                       "<th>1 star rated : </th><td>"+cbtb.rs.getLong(1)+"</td>"+
                   "</tr>");
}

cbtb.rs = cbtb.stmt.executeQuery("SELECT COUNT(*) AS Count FROM `userrating` where Stars=2");
while(cbtb.rs.next()) {

       out.println("<tr>"+
                       "<th>2 star rated : </th><td>"+cbtb.rs.getLong(1)+"</td>"+
                   "</tr>");
}
cbtb.rs = cbtb.stmt.executeQuery("SELECT COUNT(*) AS Count FROM `userrating` where Stars=3");
while(cbtb.rs.next()) {

       out.println("<tr>"+
                       "<th>3 star rated : </th><td>"+cbtb.rs.getLong(1)+"</td>"+
                   "</tr>");
}
cbtb.rs = cbtb.stmt.executeQuery("SELECT COUNT(*) AS Count FROM `userrating` where Stars=4");
while(cbtb.rs.next()) {

       out.println("<tr>"+
                       "<th>4 star rated : </th><td>"+cbtb.rs.getLong(1)+"</td>"+
                   "</tr>");
}
cbtb.rs = cbtb.stmt.executeQuery("SELECT COUNT(*) AS Count FROM `userrating` where Stars=5");
while(cbtb.rs.next()) {

       out.println("<tr>"+
                       "<th>5 star rated : </th><td>"+cbtb.rs.getLong(1)+"</td>"+
                   "</tr>");
}

cbtb.rs = cbtb.stmt.executeQuery("SELECT (SELECT COUNT(*) FROM `userrating` WHERE Stars=5)/(SELECT COUNT(*) FROM `userrating`) AS Avg");
while(cbtb.rs.next()) {

       out.println("<tr>"+
                       "<th>Total 5 stars as a percentage : </th><td>"+cbtb.rs.getFloat(1)*100+" %</td>"+
                   "</tr>");
}
%>

                </table>
            </div>

            <div id="rateandreviewholder">
                <big>Submit your rating with your ideas below</big>
                <div id="unratedstarsetholder">
                    <img alt="star" src="/ColomboBusTuristic/Content/images/ratestar.png" width="20" data-unratedstarnumber="1" class="allunratedstars" />
                    <img alt="star" src="/ColomboBusTuristic/Content/images/ratestar.png" width="20" data-unratedstarnumber="2" class="allunratedstars" />
                    <img alt="star" src="/ColomboBusTuristic/Content/images/ratestar.png" width="20" data-unratedstarnumber="3" class="allunratedstars" />
                    <img alt="star" src="/ColomboBusTuristic/Content/images/ratestar.png" width="20" data-unratedstarnumber="4" class="allunratedstars" />
                    <img alt="star" src="/ColomboBusTuristic/Content/images/ratestar.png" width="20" data-unratedstarnumber="5" class="allunratedstars" />
                </div> <br />
                <textarea rows="6" cols="50" onfocus="if($(this).html()=='Leave your ideas here...'){$(this).html('')}">Leave your ideas here...</textarea>
                <div id="submitratebtn">Submit Review</div>
            </div>


<%
int start = 0;
if(request.getParameter("start") != null)
    start = Integer.parseInt(request.getParameter("start").trim());

cbtb.rs = cbtb.stmt.executeQuery("SELECT * FROM `userrating`,`customer` WHERE userrating.CustomerID=customer.CustomerID ORDER BY DateRated DESC LIMIT "+start+" , 10");
while(cbtb.rs.next()) {

out.println("<div class=\"userratingsholder\" data-userratingid=\""+cbtb.rs.getInt(1)+"\" data-userid=\""+cbtb.rs.getInt(2)+"\">"+
                "<div>");
    for(int i = 0; i < cbtb.rs.getInt(3); i++) {
        out.println("<img alt=\"star\" src=\"/ColomboBusTuristic/Content/images/ratestar.png\" width=\"10\"/>");
    }
    out.println("</div>"+
                "<big><b>"+cbtb.rs.getString(7)+" "+cbtb.rs.getString(8)+"</b></big><br />"+
                "<b>"+cbtb.rs.getDate(5)+"</b>"+
                "<br />"+
                "<br />"+
                "<span>"+cbtb.rs.getString(4)+"</span>"+
                "<br /><br />"+
                "<small>Click anywhere to remove</small>"+
            "</div>");
}
%>


            <div id="ratingpagenumbers">
                <b>
<%
int ratingCount = 0;
cbtb.rs = cbtb.stmt.executeQuery("SELECT COUNT(*) AS Count FROM `userrating`");
while(cbtb.rs.next()) {
    ratingCount = cbtb.rs.getInt(1);
}
int pageNumber = 1;
for(int i = 0; i < ratingCount; i = i + 10) {
       out.println("<a href=\"/ColomboBusTuristic/alluser/userratings?start="+i+"\">"+(pageNumber++)+"</a>");
}
%>
                </b>
            </div>
            
