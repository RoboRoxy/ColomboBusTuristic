<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="/ColomboBusTuristic/Content/js/jquery.min.js"></script>
        <script type="text/javascript" src="/ColomboBusTuristic/Content/js/jquery.highlight.js"></script>
        <script type="text/javascript" src="/ColomboBusTuristic/Content/js/js-image-slider.js"></script>
        <script type="text/javascript" src="/ColomboBusTuristic/Content/js/commonfunc.js"></script>
        <script type="text/javascript" src="/ColomboBusTuristic/Content/js/accountSetting.js"></script>
        <link type="text/css" rel="stylesheet" href="/ColomboBusTuristic/Content/css/style1.css" />
        <link type="text/css" rel="stylesheet" href="/ColomboBusTuristic/Content/css/js-image-slider.css" />
        <title>ColomboBusTuristic - </title>
    </head>
    <body>
        
        <%@ include file="sharedPages/header.jsp" %>

        <div id="contentholder">
            
            <%@ include file="sharedPages/customerSettingTable.jsp" %>
            
            <div class="settinglinks" onclick="window.location.href = '/ColomboBusTuristic/user/cart'">
                <img width="30" alt="Cart" src="/ColomboBusTuristic/Content/images/cart1.png" />
                My Cart
            </div>
            <div class="settinglinks" onclick="window.location.href = '/ColomboBusTuristic/user/orderhistory'">
                <img width="30" alt="Order History" src="/ColomboBusTuristic/Content/images/orderhistory1.png" />
                Order History
            </div>
        </div>

        <%@ include file="sharedPages/footer.jsp" %>

    </body>
</html>