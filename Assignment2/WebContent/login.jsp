<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, target-densityDpi=device-dpi, user-scalable=no"/>
<title>OPUS MOBILE</title>

<link rel="stylesheet" type="text/css" href="css/OM.css">

<body>
	
    <!-- Code Starts Here-->
	<div class="container3">
		<div style="color:red">
            <html:errors />
        </div>
        <html:form action="/Login" >
        <div class="loginForm ">                
            <div class="selectWidth95">
            <table>
            <tr>
            <td>User name</td>
            <td>:</td>
            <td><html:text name="LoginForm" property="userName" size="15" maxlength="15"/></td>
            </tr>
            <tr>
            <td>Password</td>
            <td>:</td>
            <td><html:password name="LoginForm" property="password" /></td>
            </tr>
            <tr>
            <td><span class="floatLeft marginTop15">  
                    <a href="#" title="Login Information">
                    	<button class="roundedButtoninfo" type="button"> </button>
                    </a>
                </span></td>
            <td></td>
            <td><html:submit value="Login"/> </td>
            </tr>
            </table>
            </div>            
        </div>
        </html:form>
	</div>
 
</body>
</html>
