<cfcomponent extends="Controller" output="no">
    
    <cffunction name="update">
    	<!---<cfset user = model("person").findOneByUrl_Id(session.user.url_id)>--->
        <cfset user = model("person").findOne(where="password=MD5('#params.user.password#') AND url_id='#session.user.url_id#'")>
        
        <cfif IsObject(user)>
        	<cfset params.user.password = hash(params.user.password, "MD5")>
    		<cfset user.update(params.user)>
            <cfset session.user.url_id = params.user.url_id>
        	<cfset redirectTo(controller="info", action=session.user.url_id)>
        <cfelse>
        	<cfset flashInsert(error="Make sure you type the correct Password")>
            <cfset redirectTo(controller="info", action=session.user.url_id)>
        </cfif>
    </cffunction>
    
    <cffunction name="profile">
    
		<cfset user = model("person").findOneByUrl_Id(params.url_id)>
        <cfset image = user.photos(include="person", order="uploaded_at DESC")>
        	
        <!---<cfset image = model("photo").new()>
        <cfset image = model("photo").findAll(where="personid='#user.id#'", order="uploaded_at DESC")>--->
    </cffunction>
    
    <cffunction name="info">
    	<cfset user = model("person").findOneByUrl_Id(params.url_id)>
    </cffunction>
    
    <cffunction name="upload">
    	<cfif params.user.file eq "">
        	<cfset flashInsert(error="Please select a file to upload")>
        <cfelse>
			<cfset image = model("photo").upload(params.user.file)>
			<!---<cfset photos = model("photo").resize(params.user.file)>--->
            <cfset params.user.file = "#session.user.url_id##image#">
            <cfset image = model("photo").new(params.user)>
            <cfset image.save(where="personid='#params.user.personid#'")>
        </cfif>
        
        <cfset redirectTo(controller="profile", action=session.user.url_id)>
    </cffunction>
    
    <cffunction name="delete">
    	<cfset deleteImage = model("photo").deleteFile(params.image.file)>
    	<cfset image = model("photo").findOneByPhoto_Id(params.image.photo_id)>
        <cfset image.delete()>
        <cfset redirectTo(controller="profile", action=session.user.url_id)>
    </cffunction>
</cfcomponent>