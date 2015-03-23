<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="/ColomboBusTuristic/Content/js/jquery.min.js"></script>
        <script type="text/javascript" src="/ColomboBusTuristic/Content/js/jquery.highlight.js"></script>
        <script type="text/javascript" src="/ColomboBusTuristic/Content/js/js-image-slider.js"></script>
        <script type="text/javascript" src="/ColomboBusTuristic/Content/js/commonfunc.js"></script>
        <script type="text/javascript" src="/ColomboBusTuristic/Content/js/signUp.js"></script>
        <link type="text/css" rel="stylesheet" href="/ColomboBusTuristic/Content/css/style1.css" />
        <link type="text/css" rel="stylesheet" href="/ColomboBusTuristic/Content/css/js-image-slider.css" />
        <title>ColomboBusTuristic - </title>
    </head>
    <body>
        
        <%@ include file="sharedPages/header.jsp" %>

        <div id="contentholder">
            <table id="signuptable">
                <tr>
                    <th><big>Sign up form</big></th><th><img alt="waiting..." src="/ColomboBusTuristic/Content/images/waitingforres.gif" /></th>
                </tr>
                <tr>
                    <td>First Name</td><td><input type="text" size="25" id="fname" /></td>
                </tr>
                <tr>
                    <td>Last Name</td><td><input type="text" size="25" id="lname" /></td>
                </tr>
                <tr>
                    <td>Address 1</td><td><input type="text" size="25" id="address1" /></td>
                </tr>
                <tr>
                    <td>Address 2</td><td><input type="text" size="25" id="address2" /></td>
                </tr>
                <tr>
                    <td>Address 3</td><td><input type="text" size="25" id="address3" /></td>
                </tr>
                <tr>
                    <td>Telephone</td><td><input type="tel" size="25" id="telephone" /></td>
                </tr>
                <tr>
                    <td>Email address</td><td><input type="email" size="25" id="semail" /></td>
                </tr>
                <tr>
                    <td>Password</td><td><input type="password" size="25" id="password1" /></td>
                </tr>
                <tr>
                    <td>Re-type Password</td><td><input type="password" size="25" id="password2" /></td>
                </tr>
                <tr>
                    <td>Select security question</td><td><input type="text" size="25" id="securityquestion" /></td>
                </tr>
                <tr>
                    <td>Answer</td><td><input type="text" size="25" id="answersecurityquestion" /></td>
                </tr>
                <tr>
                    <td><a>Sign up</a></td><td><span></span></td>
                </tr>
            </table>
        </div>

        <%@ include file="sharedPages/footer.jsp" %>

    </body>
</html>