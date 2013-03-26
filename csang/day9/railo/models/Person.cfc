<cfcomponent extends="Model" output="no">
	<cffunction name="init">
    	
        <!--- Associations --->
        <cfset hasMany("photos")>
        
        <!--- Validations --->
    	<cfset validatesPresenceOf("first_name,last_name,email,gender,url_id")>
        
        <cfset validatesFormatOf(property="email", type="email")>
        <cfset validatesLengthOf(property="first_name", maximum=30, minimum=2)>
        <cfset validatesLengthOf(property="last_name", maximum=50, minimum=2)>
        <cfset validatesUniquenessOf("url_id")>
        <cfset validatesConfirmationOf("password")>
    
	</cffunction>
</cfcomponent>