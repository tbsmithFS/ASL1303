<cfparam name="user">

<cfoutput>

<div id="welcome">
#startFormTag(action="signin", class="login")#

<fieldset class="loginFieldset">

<div class="errors">
#flash("error")#
</div>

#textField(label="Email :", objectName="user", property="email", append="", prepend="", class="loginEmail")#

#passwordField(label="Password :", objectName="user", property="password", append="", prependToLabel="")#
    
#submitTag(value="Log in", id="submit_login")#

</fieldset>
#endFormTag()#

#startFormTag(action="create", class="register")#

<div class="errors">
#errorMessagesFor("user")#
</div>

<fieldset class="registerFieldset">

#textField(label="First Name :", objectName="user", property="first_name")#

#textField(label="Last Name :", objectName="user", property="last_name")#

#textField(label="Email :", objectName="user", property="email")#

#passwordField(label="Password :", objectName="user", property="password")#

#passwordField(label="Confirm Password :", objectName="user", property="passwordConfirmation")#

<fieldset>
<legend>Gender</legend>
#radioButton(label="Male", objectName="user", property="gender", tagValue="M")#

#radioButton(label="Female", objectName="user", property="gender", tagValue="F")#
</fieldset>

<fieldset>
<legend>Profile Address</legend>

#textField(label="http://#cgi.server_name#/profile/", objectName="user", property="url_id")#
</fieldset>
    
<div id="submit_register">
	#submitTag(value="Register Now")#
</div>

</fieldset>
#endFormTag()#
</div>

</cfoutput>