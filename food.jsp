<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="/ColomboBusTuristic/Content/js/jquery.min.js"></script>
        <script type="text/javascript" src="/ColomboBusTuristic/Content/js/jquery.highlight.js"></script>
        <script type="text/javascript" src="/ColomboBusTuristic/Content/js/js-image-slider.js"></script>
        <script type="text/javascript" src="/ColomboBusTuristic/Content/js/commonfunc.js"></script>
        <link type="text/css" rel="stylesheet" href="/ColomboBusTuristic/Content/css/style1.css" />
        <link type="text/css" rel="stylesheet" href="/ColomboBusTuristic/Content/css/js-image-slider.css" />
        <title>ColomboBusTuristic - </title>
    </head>
    <body>
        
        <%@ include file="sharedPages/header.jsp" %>

        <div id="contentholder">
            <div id="sortingpanel"><b>Sort Items</b><br />
                <label><input onclick="callSortItems('asc', 'ItemName')" type="radio" name="sorttype" checked />Sort By Name Ascending</label> | 
                <label><input onclick="callSortItems('desc', 'ItemName')" type="radio" name="sorttype" />Sort By Name Descending</label> | 
                <label><input onclick="callSortItems('asc', 'ItemInventoryPrice')" type="radio" name="sorttype" />Sort By Price Ascending</label> | 
                <label><input onclick="callSortItems('desc', 'ItemInventoryPrice')" type="radio" name="sorttype" />Sort By Price Descending</label>
            </div>
            <div id="foodorbeverageholder" data-ItemTypeID="1">
            </div>
        </div>

        <%@ include file="sharedPages/footer.jsp" %>

    </body>
</html>