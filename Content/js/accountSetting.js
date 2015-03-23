    $(document).ready(function () {
        $("#signuptable a").click(function() {
            signuptable_aClick();
        });
    });

    function signuptable_aClick() {
        if ($("#fname").val() == "" || $("#lname").val() == "" || $("#address1").val() == "" || $("#telephone").val() == "" || $("#semail").val() == "" || $("#password1").val() == "" || $("#password2").val() == "" || $("#securityquestion").val() == "" || $("#answersecurityquestion").val() == "") {
            $("#signuptable span").html("You must fill required fields");
            return false;
        }

        if (isNaN($("#telephone").val())) {
            $("#signuptable span").html("Telephone number must be numeric only");
            return false;
        }

        if ($("#password1").val() != $("#password2").val()) {
            $("#signuptable span").html("Paswords do not match!");
            return false;
        }

        $("#signuptable span").html("");

        $("#signuptable img").show();

        $.ajax({
            type: "POST",
            url: "/ColomboBusTuristic/controller.jsp",
            data: {
                funcname: "alterCustomerTable",
                fname: $("#fname").val(),
                lname: $("#lname").val(),
                address1: $("#address1").val(),
                address2: $("#address2").val(),
                address3: $("#address3").val(),
                telephone: $("#telephone").val(),
                semail: $("#semail").val(),
                password1: $("#password1").val(),
                securityquestion: $("#securityquestion").val(),
                answersecurityquestion: $("#answersecurityquestion").val()
            },
            success: function (data) {
                $("#signuptable span").html(data.trim());
                $("#signuptable img").hide();
            }
        });
        return true;
    }