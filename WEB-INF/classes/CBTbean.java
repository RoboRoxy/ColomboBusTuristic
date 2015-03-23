package cbturistic;
import java.sql.*;
import java.util.Arrays;

public class CBTbean implements java.io.Serializable {

    public Statement stmt;
    public ResultSet rs;
    public String sqlQueryString;
    public int CustomerID;
    public String customerFullName;
    public long CartTotal;

    public CBTbean() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/colombobusturistic?user=root&password=d945gnt");
        stmt = con.createStatement();
        CustomerID = 0;
        CartTotal = 0;
    }

    private void setCartTotal() throws Exception {
        sqlQueryString = "SELECT `CartTotal` FROM `cart` WHERE CustomerID="+CustomerID;
        rs = stmt.executeQuery(sqlQueryString);

        while(rs.next()) {
            CartTotal = rs.getLong(1);
	}
    }

    public String signupUser(String fname, String lname, String address1, String address2, String address3, String telephone, String semail, String password1, String securityquestion, String answersecurityquestion) throws Exception {
        sqlQueryString = "select CustomerEmail from customer where CustomerEmail='"+semail.replace("'","''")+"'";
        rs = stmt.executeQuery(sqlQueryString);

        while(rs.next()) {
            return "This email is already registered with the system";
	}

        sqlQueryString = "INSERT INTO `customer`(`CustomerFName`, `CustomerLName`, `CustomerAddress1`, `CustomerAddress2`, `CustomerAddress3`, `CustomerTelephone`, `CustomerEmail`, `CustomerPassword`, `CustomerSecuQ`, `CustomerSecuA`) VALUES ('"+fname.replace("'","''")+"','"+lname.replace("'","''")+"','"+address1.replace("'","''")+"','"+address2.replace("'","''")+"','"+address3.replace("'","''")+"',"+telephone+",'"+semail.replace("'","''")+"','"+password1.replace("'","''")+"','"+securityquestion.replace("'","''")+"','"+answersecurityquestion.replace("'","''")+"')";
        stmt.executeUpdate(sqlQueryString);
        return "Successfully registered!";
    }

    public String loginUser(String useremail, String userpassword) throws Exception {
        sqlQueryString = "select CustomerID, CustomerFName, CustomerLName from customer where CustomerEmail='"+useremail+"' AND CustomerPassword='"+userpassword+"' ";
        rs = stmt.executeQuery(sqlQueryString);

        while(rs.next()) {
            CustomerID = rs.getInt(1);
            customerFullName = rs.getString(2)+" "+rs.getString(3);
            setCartTotal();
            return customerFullName;
	}
        return "Wrong Username/Password";

    }

    public String alterCustomerTable(String fname, String lname, String address1, String address2, String address3, String telephone, String semail, String password1, String securityquestion, String answersecurityquestion) throws Exception {
        sqlQueryString = "select CustomerID from customer where CustomerEmail='"+semail.replace("'","''")+"'";
        rs = stmt.executeQuery(sqlQueryString);

        while(rs.next()) {
            if(CustomerID != rs.getInt(1)) 
                return "This email is already registered with the system";
	}

        sqlQueryString = "UPDATE customer SET CustomerFName='"+fname.replace("'","''")+"',CustomerLName='"+lname.replace("'","''")+"',CustomerAddress1='"+address1.replace("'","''")+"',CustomerAddress2='"+address2.replace("'","''")+"',CustomerAddress3='"+address3.replace("'","''")+"',CustomerTelephone="+telephone+",CustomerEmail='"+semail.replace("'","''")+"',CustomerPassword='"+password1.replace("'","''")+"',CustomerSecuQ='"+securityquestion.replace("'","''")+"',CustomerSecuA='"+answersecurityquestion.replace("'","''")+"' WHERE CustomerID="+CustomerID;
        stmt.executeUpdate(sqlQueryString);
        customerFullName = fname + " " + lname;
        return "Successfully Changed Your Settings!";
    }

    public String getOneBusCharge(String typeofbusid, String typeoftourid) throws Exception {
        sqlQueryString = "SELECT CategoryDetailPrice, CategoryDetailMaxDays FROM categorydetail WHERE CategoryTourID="+typeoftourid+" AND CategoryBusID="+typeofbusid;
        rs = stmt.executeQuery(sqlQueryString);

        while(rs.next()) {
            return rs.getString(1) +"and"+ rs.getString(2);
	}
        return "ERROR";
    }

    public String addTourToCart(String tourname, String resdate, String typeofbus, String typeoftour, String noofdays, String onebusfee, String noofbuses, String totalfee) throws Exception {
        sqlQueryString = "SELECT * FROM cart WHERE CustomerID="+CustomerID;
        rs = stmt.executeQuery(sqlQueryString);

        while(rs.next()) {
            return "You have already added one tour. Remove it or checkout";
	}

        sqlQueryString = "INSERT INTO `cart`(`CustomerID`, `TourName`, `ReserveDate`, `CategoryTourID`, `CategoryBusID`, `NoOfBuses`, `NoOfDays`, `OneBusFare`, `CartTotal`) VALUES ("+CustomerID+",'"+tourname.replace("'","''")+"','"+resdate+"',"+typeoftour+","+typeofbus+","+noofbuses+","+noofdays+","+onebusfee+","+(Long.parseLong(totalfee)+CartTotal)+")";
        stmt.executeUpdate(sqlQueryString);
        CartTotal = Long.parseLong(totalfee)+CartTotal;
        return "Item was added successfully";
    }

    public String addItemToCart(String itemid, String itemprice, String itemqty) throws Exception {
        sqlQueryString = "SELECT * FROM cart WHERE CustomerID="+CustomerID;
        rs = stmt.executeQuery(sqlQueryString);

        while(rs.next()) {
            return privateAddItemToCart(itemid, itemprice, itemqty);
	}

        return "Add a tour first to add items";
    }

    private String privateAddItemToCart(String itemid, String itemprice, String itemqty) throws Exception {
        sqlQueryString = "INSERT INTO `cartitem`(`CartRefID`, `CustomerID`, `ItemID`, `ItemQty`, `ItemUnitPrice`, `CartItemTotal`) VALUES ((SELECT `CartRefID` FROM `cart` WHERE CustomerID="+CustomerID+"), "+CustomerID+", "+itemid+", "+itemqty+", "+itemprice+", "+Integer.parseInt(itemqty)*Integer.parseInt(itemprice)+")";
        stmt.executeUpdate(sqlQueryString);

        setCartTotal();
        
        CartTotal += Integer.parseInt(itemqty)*Integer.parseInt(itemprice);

        sqlQueryString = "UPDATE `cart` SET `CartTotal`="+CartTotal+" WHERE CustomerID="+CustomerID;
        stmt.executeUpdate(sqlQueryString);
        return "Item successfully added";
    }

    public String removeItemFromCart(String cartitemid, String carttotal) throws Exception {
        sqlQueryString = "DELETE FROM `cartitem` WHERE CartItemID="+cartitemid+" AND CustomerID="+CustomerID;
        stmt.executeUpdate(sqlQueryString);

        setCartTotal();

        CartTotal -= Integer.parseInt(carttotal);

        sqlQueryString = "UPDATE `cart` SET `CartTotal`="+CartTotal+" WHERE CustomerID="+CustomerID;
        stmt.executeUpdate(sqlQueryString);
        return "Successfully removed";
    }

    public String removeTourFromCart() throws Exception {
        sqlQueryString = "DELETE FROM `cartitem` WHERE CustomerID="+CustomerID;
        stmt.executeUpdate(sqlQueryString);

        sqlQueryString = "DELETE FROM `cart` WHERE CustomerID="+CustomerID;
        stmt.executeUpdate(sqlQueryString);

        CartTotal = 0;
        return "Successfully removed";
    }

    public String checkoutbtnClick() throws Exception {
        sqlQueryString = "INSERT INTO `order`(`CustomerID`, `TourName`, `ReserveDate`, `CategoryTourID`, `CategoryBusID`, `NoOfBuses`, `NoOfDays`, `OneBusFare`, `OrderCost`)"+
        "SELECT `CustomerID`, `TourName`, `ReserveDate`, `CategoryTourID`, `CategoryBusID`, `NoOfBuses`, `NoOfDays`, `OneBusFare`, `CartTotal` FROM `cart` WHERE CustomerID="+CustomerID;
        stmt.executeUpdate(sqlQueryString);

        sqlQueryString = "INSERT INTO orderitem (OrderID, CustomerID, ItemID, ItemQty, ItemUnitPrice, OrderItemTotal) "+
        "SELECT (SELECT OrderID FROM `order` WHERE order.CustomerID="+CustomerID+" ORDER BY OrderID DESC LIMIT 1) AS OrderID, CustomerID, ItemID, ItemQty, ItemUnitPrice, CartItemTotal "+
        "FROM `cartitem` "+
        "WHERE `CustomerID` = "+CustomerID;
        stmt.executeUpdate(sqlQueryString);
        removeTourFromCart();
        return "Successfully Paid";
    }

    public String cancelTour(String orderid) throws Exception {
        sqlQueryString = "UPDATE `order` SET `OrderStatusID`=5 WHERE OrderID="+orderid;
        stmt.executeUpdate(sqlQueryString);
        return "Successfully Cancelled";
    }

    public String getSecuQuestion(String forgotemail) throws Exception {
        sqlQueryString = "SELECT `CustomerSecuQ` FROM `customer` WHERE CustomerEmail='"+forgotemail+"'";
        rs = stmt.executeQuery(sqlQueryString);
        while(rs.next()) {
            return rs.getString(1);
        }
        return "Sorry this email is not registered with the system";
    }

    public String getSecuAnswer(String forgotemail, String usersans) throws Exception {
        sqlQueryString = "SELECT * FROM `customer` WHERE CustomerEmail='"+forgotemail+"' AND CustomerSecuA='"+usersans+"'";
        rs = stmt.executeQuery(sqlQueryString);
        while(rs.next()) {
            return "An email was sent to you to reset your password";
        }
        return "Sorry the answer provided you was not correct";
    }

    public String submitRating(String starrate, String usercomment) throws Exception {
        sqlQueryString = "INSERT INTO `userrating`(`CustomerID`, `Stars`, `Comment`) VALUES ("+CustomerID+","+starrate+",'"+usercomment+"')";
        stmt.executeUpdate(sqlQueryString);
        return "Rating is successful";
    }

    public String removeRating(String userratingid) throws Exception {
        sqlQueryString = "DELETE FROM `userrating` WHERE userratingID="+userratingid;
        stmt.executeUpdate(sqlQueryString);
        return "Remove rating is successful";
    }

}