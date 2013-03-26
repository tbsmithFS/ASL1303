<cfcomponent extends="Model" output="no">
	<cffunction name="init">
    
    	<!--- Associations --->
    	<cfset belongsTo("person")>
               
    </cffunction>
    
	<cffunction name="upload" access="public" returntype="string">
		<cfargument name="upfile" type="any">
		<cffile action="upload" fileField="user[file]" destination="../images/panoramas" result="file" accept="image/jpg, image/jpeg, image/png, image/gif">
        <cffile action="rename" source="../images/panoramas/#file.ClientFile#" destination="../images/panoramas/#session.user.url_id##DateFormat(now(),'mmmmdyyyy')##TimeFormat(Now(), 'hhmm')##file.ClientFile#">
        <cfset filename = "#DateFormat(now(),'mmmmdyyyy')##TimeFormat(Now(), 'hhmm')##file.ClientFile#">
        <cfreturn filename>
	</cffunction>
    
    <cffunction name="deleteFile" access="public" returntype="void">
    	<cfargument name="image" type="any">
        <cfdump var="#image#" >
        <cffile action="delete" file="../images/panoramas/#image#">
    </cffunction>
    
    <!---<cffunction name="resize" access="public" returntype="void">
		<cfargument name="upfile" type="any">
        
        <cfset myimf = ImageNew("#upfile#")>
        
        <cfset ImageResize(myimf,"940","168")>
        
        <cfimage source="#myimf#" action="write" destination="../images/panoramas/1.jpg" overwrite="no">
	</cffunction>--->
</cfcomponent>