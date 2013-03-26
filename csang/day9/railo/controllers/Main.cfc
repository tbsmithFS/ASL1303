<cfcomponent extends="Controller" output="no">
	
    <cffunction name="home">
    	<cfset user = model("person").findAll()>
    	<cfset image = model("photo").new()>
    	<cfset image = model("photo").findAll(include="person", order="uploaded_at DESC")>
        
    </cffunction>
    
	<cffunction name="login">
		<cfset user = model("person").new()>
	</cffunction>
    
    <cffunction name="logout">
		<cfset StructDelete(session, "user")>
        <cfset redirectTo(controller="main", action="login")>
	</cffunction>
    
    <cffunction name="signin">
    	<cfif (params.user.email == "" || params.user.password == "")>
        	<cfset user = model("person").new(email=params.user.email)>
            <cfset flashInsert(error="The email and password that you entered is not valid")>
			<cfset renderPage(action="login")>
        <cfelse>
        	<cfset user = model("person").findOne(where="email='#params.user.email#' AND password=MD5('#params.user.password#')")>
            
            <cfif IsObject(user)>
				<cfset session.user = user>
                <cfset redirectTo(controller="home", action="#session.user.url_id#")>
            <cfelse>
                <cfset user = model("person").new(email=params.user.email)>
                <cfset flashInsert(error="The email and password that you entered is not valid")>
                <cfset renderPage(action="login")>
            </cfif>
        </cfif>
	</cffunction>
    
    <cffunction name="create">
    	<cfset params.user.password = hash(params.user.password, "MD5")>
        <cfset params.user.passwordConfirmation = hash(params.user.passwordConfirmation, "MD5")>
    	<cfset user = model("person").new(params.user)>
        <cfset user.save()>
        
        <cfif user.hasErrors()>
        	<cfset renderPage(action="login")>
        <cfelse>
        	<cfset user = model("person").findOne(where="email='#params.user.email#' AND password='#params.user.password#'")>
        	<cfset session.user = user>
        	<cfset flashInsert(success="You've registered successfully. Welcome to PANORAMICAM!")>
        	<cfset redirectTo(controller="info", action="#session.user.url_id#")>
        </cfif>
    </cffunction>
    
</cfcomponent>