<jsp:useBean id="cbtb" class="cbturistic.CBTbean" scope="session"/>

        <div id="usernev">
            <div id="signupandsettingsholder"><span id="signuplink"><a href="/ColomboBusTuristic/guest/signup">Sign up?</a></span><span id="settinglink"><a href="/ColomboBusTuristic/user/myaccount">My Account</a></span></div>
            <img title="Forgot Password?" onclick="$('#forgotpwddialog').slideDown()" width="24" id="forgotpwd" alt="forgotpassword" src="/ColomboBusTuristic/Content/images/forgotpwd.png" />
            <div id="loginandoutbtn">Login</div>
            <div id="pwdholder"><input type="text" id="userpassword" value="Password" onfocus="if($(this).attr('type')=='text'){ $(this).attr('type','password'); $(this).val(''); }" onblur="if($(this).val()==''){ $(this).attr('type','text'); $(this).val('Password'); }" /></div>
            <div id="emlholder"><input type="email" id="useremail" value="Username" onfocus="if($(this).val()=='Username'){ $(this).val(''); }" onblur="if($(this).val()==''){ $(this).val('Username'); }" /></div>
            <div id="welcomestr"><%= cbtb.customerFullName %></div>
            <div id="menuitems">
                <div><a href="/ColomboBusTuristic/">Home</a> <span>| Categories | Bus Categories</span></div>
                <ul class="catmain">
                    <li id="menu1"><big>Tour Categories</big></li>
                    <li id="menu2"><big>Types of buses</big></li>
                    <li id="menu3"><big>Food and Beverage</big></li>
                    <li id="menu4"><big>User Rating & Review</big></li>
                    <li id="menu5"><big>About</big></li>
                </ul>
                <ul class="catsub">
                    <li><a href="/ColomboBusTuristic/tourcategories/shorttours" class="setall set1">Short tours</a><a href="/ColomboBusTuristic/buscategories/opentop" class="setall set2">Open Top (AC)</a><a href="/ColomboBusTuristic/touritems/food" class="setall set3">Food</a><a href="/ColomboBusTuristic/alluser/userratings" class="setall set4">Review and rating</a><a href="#" class="setall set5">About ColomboBusTuristic</a></li>
                    <li><a href="/ColomboBusTuristic/tourcategories/longtours" class="setall set1">Long tours</a><a href="/ColomboBusTuristic/buscategories/wideview" class="setall set2">Wide view (AC)</a><a href="/ColomboBusTuristic/touritems/beverage" class="setall set3">Beverage</a><a href="#" class="setall set5">Contact us</a></li>
                    <li><a href="/ColomboBusTuristic/tourcategories/kidsclub" class="setall set1">Kids' club</a><a href="/ColomboBusTuristic/buscategories/comfortable" class="setall set2">Comfortable</a><a class="setall set3"></a><a class="setall set4"></a></li>
                    <li><a href="/ColomboBusTuristic/tourcategories/citysightseeingtours" class="setall set1">City sightseeing tours</a><a class="setall set2"></a><a class="setall set3"></a><a class="setall set4"></a></li>
                    <li></li>
                </ul>
            </div>
            <div id="minicart" onclick="window.location.href = '/ColomboBusTuristic/user/cart'">
                <img width="30" alt="Cart" src="/ColomboBusTuristic/Content/images/cart1.png" />
                Rs <span id="minicarttotal">0</span>.00
            </div>
        </div>

        <div id="forgotpwddialog">
            <span id="forgotpwddialogmail">
                Forgot Password?<br />
                Enter your e-mail address<br />
                <input type="email" id="forgotemail" /><a onclick='getSecuQuestion()'>Okay</a>|<a onclick="$('#forgotpwddialog').slideUp()">Cancel</a>
            </span>
            <br />
            <span id="forgotpwddialogques">
                Answer your security question<br />
                <span id="secuquestion">Question?</span><br />
                <input type="text" id="secuanswer" /><a onclick='getSecuAnswer()'>Okay</a>|<a onclick="$('#forgotpwddialog').slideUp()">Cancel</a>
            </span>
        </div>

        <div id="logoholder">
            <a href="/ColomboBusTuristic/" id="thelogo" title="Home">
                <img alt="ColomboBusTuristic" src="/ColomboBusTuristic/Content/images/mainlogo.png" />
            </a>
        </div>
        
        <div id='sliderFrame'>
            <div id='slider'>
                <img src="/ColomboBusTuristic/Content/images/image-slider-1.jpg" alt='Comfortable luxury buses' />
                <img src="/ColomboBusTuristic/Content/images/image-slider-2.jpg" alt='Opentop bus is convenient for city sightseeing' />
                <img src="/ColomboBusTuristic/Content/images/image-slider-3.jpg" alt='Clean and clear interior' />
                <img src="/ColomboBusTuristic/Content/images/image-slider-4.jpg" alt='Intersting buses for kids club' />
                <img src="/ColomboBusTuristic/Content/images/image-slider-5.jpg" alt='Comfortable non A/C is ideal for your budget' />
                <img src="/ColomboBusTuristic/Content/images/image-slider-6.jpg" alt='Everything for safe driving' />
                <img src="/ColomboBusTuristic/Content/images/image-slider-7.jpg" alt='Well trained drivers' />
                <img src="/ColomboBusTuristic/Content/images/image-slider-8.jpg" alt='Good engine condition' />
                <img src="/ColomboBusTuristic/Content/images/image-slider-9.jpg" alt='Maintain engines everyday' />
            </div>
        </div>