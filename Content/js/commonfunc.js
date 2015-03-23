var currid;
var CategoryDetailPriceAndMaxDays;
var currentUserRate = 0;
$(document).ready(function () {
        
    //start user rating
    try {

        $("#averageratingstarholder").width(parseInt($("#averageratingstarholder").attr("data-widthOfThis")));

        $(".allunratedstars").click(function () {
            currentUserRate = parseInt($(this).attr("data-unratedstarnumber"));
            $(".allunratedstars").fadeTo(100, 0.4);
            $(".allunratedstars").slice(0, currentUserRate).fadeTo(100, 1);

        });

        $("#submitratebtn").click(function () {
            submitratebtnClick();
        });

        $(".userratingsholder").click(function () {
            if (confirm("You're about to remove your rating")) {
                $.ajax({
                    type: "POST",
                    url: "/ColomboBusTuristic/controller.jsp",
                    data: {
                        funcname: "removeRating",
                        userid: $(this).attr("data-userid"),
                        userratingid: $(this).attr("data-userratingid")
                    },
                    success: function (data) {
                        alert(data.trim());
                        if (data.search("successful") != -1) {
                            window.location.reload();
                        }
                    }
                });
            }
        });

    }
    catch (ex) {
    }
    //end user rating

    //start order history
    try{
        $(".datarow").click(function () {
            if ($("#orderstatus" + $(this).attr("data-orderno")).html().search("Pending") != -1 || $("#orderstatus" + $(this).attr("data-orderno")).html().search("Approved") != -1) {


                var orderhistorypopupcontent = "<div onclick=\"getOrderItemTable('" + $(this).attr("data-orderno") + "')\">Show Details</div>" +
                                               "<div onclick=\"cancelTour('" + $(this).attr("data-orderno") + "')\">Cancel Tour</div>" +
                                               "<div onclick=\"$('#orderhistorypopup').fadeOut()\">Close</div>";

                $("#orderhistorypopup").html(orderhistorypopupcontent);
                $("#orderhistorypopup").fadeIn();
            }
            else {
                getOrderItemTable($(this).attr("data-orderno"));
            }


        });
    }
    catch (ex) {
    }
    //end order history

    //start cart
    try{
        if (parseInt($("#totalchargecell").html()) == 0)
            $("#cartitemsholder").remove();

        $("#checkoutbtn").click(function () {
            $.ajax({
                type: "POST",
                url: "/ColomboBusTuristic/controller.jsp",
                data: {
                    funcname: "checkoutbtnClick"
                },
                success: function (data) {
                    if (data.search("Successfully") != -1) {
                        window.location.href = "/ColomboBusTuristic/payment/successfull";
                    }
                    else {
                        alert(data.trim());
                    }
                }
            });
        });
    }
    catch (ex) {
    }
    //end cart

    //start tour items
    try {
        sortItems("asc", "ItemName");
    }
    catch (ex) {
    }
    //end tour items

    //start for tour categories and bus categories pages
    try {
        $("#resdate").datepicker();
        $("#resdate").datepicker({ showButtonPanel: true });
        $("#resdate").datepicker("option", "showButtonPanel", true);
        $("#resdate").datepicker({ dateFormat: "yy-mm-dd" });
        $("#resdate").datepicker("option", "dateFormat", "yy-mm-dd");
        $("#onebusfee, #totalfee").prop("disabled", true);

        $("#torderformbtn1").click(function () {
            calculateTourCharge();
        });

        $("#torderformbtn2").click(function () {
            torderformbtn2Click();
        });
    }
    catch (ex) {
    }
        //end for tour categories and bus categories pages

        $(".catmain li").click(function () {
            $(".setall").hide();
            $(".catsub").show();
            currid = $(this).attr("id");
            currid = currid.replace("menu", "");
            currid = ".set" + currid;
            $(currid).fadeIn();
        });
        $("#menuitems").mouseleave(function () {
            $(".catsub").slideUp(function () { $(".catmain").slideUp() });
        });
        $("#menuitems div span").click(function () {
            $(".catmain").slideDown();
        });

        $("#loginandoutbtn").click(function () {
            if ($("#loginandoutbtn").html().search("Login") != -1) {
                loginUser();
            }
            else {
                logoutUser();
            }
        });

        if($("#welcomestr").html().search("null") == -1) {
            $("#emlholder,#pwdholder").hide();
            $("#welcomestr").show();
            $("#loginandoutbtn").html("Logout");
            $("#signuplink").hide();
            $("#settinglink").show();
            refreshCartTotal();
        } 
});

    function loginUser() {
        $.ajax({
            type: "POST",
            url: "/ColomboBusTuristic/controller.jsp",
            data: {
                funcname: "loginUser",
                useremail: $("#useremail").val(),
                userpassword: $("#userpassword").val()
            },
            success: function (data) {
                $("#welcomestr").html(data.trim());
                $("#emlholder,#pwdholder").slideUp(function(){$("#welcomestr").slideDown()});
                if (data.search("Wrong") != -1) {
                    setTimeout(function () { $("#welcomestr").slideUp() }, 5000);
                    setTimeout(function () { $("#emlholder,#pwdholder").slideDown() }, 6000);
                }
                else {
                    $("#loginandoutbtn").html("Logout");
                    $("#signuplink").hide();
                    $("#settinglink").show();
                    refreshCartTotal();
                }
            }
        });
    }

    function logoutUser() {
        $.ajax({
            type: "POST",
            url: "/ColomboBusTuristic/controller.jsp",
            data: {
                funcname: "logoutUser"
            },
            success: function (data) {
                $("#loginandoutbtn").html("Login");
                $("#welcomestr").slideUp(function(){$("#emlholder,#pwdholder").slideDown()});
                $("#settinglink").hide();
                $("#signuplink").show();
                refreshCartTotal();
            }
        });
    }

    function refreshCartTotal() {
        $.ajax({
            type: "POST",
            url: "/ColomboBusTuristic/controller.jsp",
            data: {
                funcname: "refreshCartTotal"
            },
            success: function (data) {
                $("#minicarttotal").html(data.trim());
            }
        });
    }

    function addTourToCart() {
        $.ajax({
            type: "POST",
            url: "/ColomboBusTuristic/controller.jsp",
            data: {
                funcname: "addTourToCart",
                tourname: $("#tourname").val(),
                resdate: $("#resdate").val(),
                typeofbus: $("#typeofbus").val().trim(),
                typeoftour: $("#typeoftour").val().trim(),
                noofdays: $("#noofdays").val().trim(),
                onebusfee: $("#onebusfee").val().trim(),
                noofbuses: $("#noofbuses").val().trim(),
                totalfee: $("#totalfee").val().trim()
            },
            success: function (data) {
                alert(data.trim());
                $("#tourordertable img").hide();
                refreshCartTotal();
            }
        });
    }

    function calculateTourCharge() {
        if (isNaN($("#noofbuses").val()) || $("#noofbuses").val() == "")
            $("#noofbuses").val("1");

        $.ajax({
            type: "POST",
            url: "/ColomboBusTuristic/controller.jsp",
            data: {
                funcname: "getOneBusCharge",
                typeofbusid: $("#typeofbus").val(),
                typeoftourid: $("#typeoftour").val()
            },
            success: function (data) {
                CategoryDetailPriceAndMaxDays = data.trim().split("and");
                $("#onebusfee").val(CategoryDetailPriceAndMaxDays[0]);
                $("#totalfee").val(parseInt(CategoryDetailPriceAndMaxDays[0]) * parseInt($("#noofbuses").val()));
            }
        });
    }

    function torderformbtn2Click() {
        try {
            $("#tourordertable img").show();

            if ($("#tourname").val() == "") {
                alert("Give a tour name");
                $("#tourordertable img").hide();
                return false;
            }
            if ($("#resdate").val() == "") {
                alert("Give a reservation date");
                $("#tourordertable img").hide();
                return false;
            }
            if ($("#noofdays").val() == "") {
                alert("Specify number of days");
                $("#tourordertable img").hide();
                return false;
            }

            calculateTourCharge();

            if (parseInt(CategoryDetailPriceAndMaxDays[1]) < parseInt($("#noofdays").val().trim())) {
                alert("Invalid no of days. Please refer the table");
                CategoryDetailPriceAndMaxDays = null;
                $("#tourordertable img").hide();
                return false;
            }
            
            setTimeout(function () { addTourToCart() }, 3000);
            
            return true;
        }
        catch (ex) {
            setTimeout(function () { torderformbtn2Click() }, 3000);
            return false;
        }
    }

    function addItemToCart(itemID, itemPrice, parenNodeObj) {

        if (isNaN($(parenNodeObj).find("input").val().trim()) || $(parenNodeObj).find("input").val().trim() == "") {
            alert("Quantity must be a number");
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/ColomboBusTuristic/controller.jsp",
            data: {
                funcname: "addItemToCart",
                itemid: itemID,
                itemprice: itemPrice,
                itemqty: $(parenNodeObj).find("input").val().trim()
            },
            success: function (data) {
                alert(data.trim());
                refreshCartTotal();
            }
        });
    }

    function callSortItems(stype, colName) {
        $(".foodorbeverageholder").slideUp(2000, function () { sortItems(stype, colName) });
    }

    function sortItems(stype, colName) {
        $("#foodorbeverageholder").hide();
        $.ajax({
            type: "POST",
            url: "/ColomboBusTuristic/controller.jsp",
            data: {
                funcname: "itemLoader",
                sorttype: stype,
                columnname: colName,
                itemtypeid: $("#foodorbeverageholder").attr("data-ItemTypeID")
            },
            success: function (data) {
                $("#foodorbeverageholder").html(data.trim());
                $("#foodorbeverageholder").slideDown(2000);
                //alert(data.trim());
            }
        });
    }

    function removeItemFromCart(cartitid, cartsum) {
        if (confirm("You're about to remove an item from the cart")) {

            $.ajax({
                type: "POST",
                url: "/ColomboBusTuristic/controller.jsp",
                data: {
                    funcname: "removeItemFromCart",
                    cartitemid: cartitid,
                    carttotal: cartsum
                },
                success: function (data) {
                    if (data.search("Successfully") != -1) {
                        $("#cartitid" + cartitid).fadeOut(function () { alert(data.trim()) });
                        $("#carttotalcell").html(parseInt($("#carttotalcell").html() - cartsum));
                        $("#totalchargecell").html(parseInt($("#totalchargecell").html() - cartsum));
                        refreshCartTotal();
                    }
                    else {
                        alert(data.trim());
                    }
                }
            });
        }
    }

    function removeTourFromCart() {
        if (confirm("You're about to remove the whole tour with items")) {

            $.ajax({
                type: "POST",
                url: "/ColomboBusTuristic/controller.jsp",
                data: {
                    funcname: "removeTourFromCart"
                },
                success: function (data) {
                    if (data.search("Successfully") != -1) {
                        $("#cartitemsholder").slideUp(2000, function () { alert(data.trim()) });
                        refreshCartTotal();
                    }
                    else {
                        alert(data.trim());
                    }
                }
            });
        }
    }

    function getOrderItemTable(onumber) {
        $('#orderhistorypopup').fadeOut();
        $.ajax({
            type: "POST",
            url: "/ColomboBusTuristic/controller.jsp",
            data: {
                funcname: "getOrderItemTable",
                orderid: onumber
            },
            success: function (data) {
                if (data.search("Please login") == -1) {
                    $(".orderitemtableholder").html(data.trim());
                    $(".orderitemtableholder").slideDown();
                }
                else {
                    alert(data.trim());
                }
            }
        })
    }

    function cancelTour(onumber) {
        $('#orderhistorypopup').fadeOut();
        $.ajax({
            type: "POST",
            url: "/ColomboBusTuristic/controller.jsp",
            data: {
                funcname: "cancelTour",
                orderid: onumber
            },
            success: function (data) {
                if (data.search("Successfully") != -1) {
                    $("#orderstatus" + onumber).html("Cancelled");
                }
                else {
                    alert(data.trim());
                }
            }
        })
    }

    function getSecuQuestion() {
        if (useremail != "") {
            $.ajax({
                type: "POST",
                url: "/ColomboBusTuristic/controller.jsp",
                data: {
                    funcname: "getSecuQuestion",
                    forgotemail: $("#forgotemail").val().trim()
                },
                success: function (data) {
                    if (data.search("Sorry this email is not registered with the system") != -1) {
                        alert(data.trim());
                    }
                    else {
                        $("#secuquestion").html(data.trim());
                        $("#forgotpwddialogmail").slideUp(function () { $("#forgotpwddialogques").slideDown() });
                    }
                }
            })
        }
        else {
            alert("Enter your email in the box");
        }
    }

    function getSecuAnswer() {
        if (useremail != "") {
            $.ajax({
                type: "POST",
                url: "/ColomboBusTuristic/controller.jsp",
                data: {
                    funcname: "getSecuAnswer",
                    forgotemail: $("#forgotemail").val().trim(),
                    usersans: $("#secuanswer").val().trim()
                },
                success: function (data) {
                    alert(data.trim());
                }
            })
        }
        else {
            alert("Enter your answer in the box");
        }
    }

    function submitratebtnClick() {

        if (currentUserRate == 0) {
            alert("Submit your rating by clicking on stars");
            return false;
        }
        if ($("#rateandreviewholder textarea").html() == "Leave your ideas here..." || $("#rateandreviewholder textarea").html() == "") {
            alert("Enter your ideas");
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/ColomboBusTuristic/controller.jsp",
            data: {
                funcname: "submitRating",
                starrate: currentUserRate,
                usercomment: $("#rateandreviewholder textarea").html()
            },
            success: function (data) {
                alert(data.trim());
                if (data.search("successful") != -1) {
                    window.location.href = "/ColomboBusTuristic/alluser/userratings?start=0";
                }
            }
        });

    }