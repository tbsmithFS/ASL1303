<cfparam name="user" type="query">
<cfparam name="image" type="query">

<cfoutput>
<div class="logout-profile">
<cfif (session.user.admin != 1)>#linkTo(text="Profile", controller="profile", action="#session.user.url_id#")# 
</cfif>
#linkTo(text="Logout", controller="main", action="logout")#
</div>

<h2>Latest Panoramas</h2>
<cfloop query="image">
	<div class="image">
    <cfif (session.user.admin == 1)>
    	#startFormTag(action="delete", class="delete-form")#
        <input id="image-photo_id" name="image[photo_id]" type="hidden" value="#image.photo_id#">
        <input id="image-url" name="image[url]" type="hidden" value="#image.file#">
        <div id="submit_delete">
            #submitTag(value="Delete")#
        </div>
        #endFormTag()#
    </cfif>
    <div class="image-info">
        <p>
            #linkTo(text="#image.first_name# #image.last_name#", route="userProfile", url_id=image.url_id)# -
            #timeAgoInWords(image.uploaded_at)# ago
        </p>
    </div>
	<img src="../../images/panoramas/#image.file#"/>
    </div>
    
</cfloop>
</cfoutput>