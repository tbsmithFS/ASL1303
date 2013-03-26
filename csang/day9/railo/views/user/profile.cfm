<cfparam name="image" type="query">
<cfparam name="user">


<cfoutput>
<div class="logout-info">
<cfif (session.user.admin != 1)>
	#linkTo(text="Info", controller="info", action="#user.url_id#")#
<cfelse>
	#linkTo(text="All", controller="home", action="#session.user.url_id#")#
</cfif>
#linkTo(text="Logout", controller="main", action="logout")#
</div>

<h2>#user.first_name# #user.last_name#</h2>

<cfif (session.user.admin != 1)>
<p>
	<strong>Member Since:</strong><br />
	#DateFormat(user.created_at, "mmmm d, yyyy")#
</p>
</cfif>

<cfif (session.user.id == #user.id# && session.user.admin != 1)>
<div class="errors">
#flash("error")#
</div>
#startFormTag(action="upload", multipart="true", class="upload-form")#
    <fieldset>
    	<input id="user-id" name="user[personid]" type="hidden" value="#user.id#">
        <!---#hiddenField(objectName="user", property="id")#--->
        #hiddenField(objectName="user", property="url_id")#
        #fileField(label="Photo :", objectName="user", property="file")#
        <div id="submit_upload">
            #submitTag(value="Upload")#
        </div>
	</fieldset>
#endFormTag()#
</cfif>


<cfloop query="image">
	<div class="image">
		<cfif (session.user.id == #image.personid# || session.user.admin == 1)>
        #startFormTag(action="delete", class="delete-form")#
        <input id="image-photo_id" name="image[photo_id]" type="hidden" value="#image.photo_id#">
        <input id="image-url" name="image[file]" type="hidden" value="#image.file#">
        <div class="submit-delete">
            #submitTag(value="Delete")#
        </div>
        #endFormTag()#
        </cfif>
        <img src="../../images/panoramas/#image.file#"/>
    </div>
</cfloop>

</cfoutput>