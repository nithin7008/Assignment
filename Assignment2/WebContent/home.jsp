<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AJAX JsonArray Example</title>
<link href='http://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
<style type="text/css">
table, td, th
{
border:1px solid green;
font-family: 'Oxygen', sans-serif;
}
th
{
background-color:green;
color:white;
}
body
{
	text-align: center;
}
.container
{
	margin-left: auto;
	margin-right: auto;
	width: 40em;
}
h4
{
	font-family: 'Oxygen', sans-serif;
	color:#1E90FF;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	loadTableData();
	function clearData(){
		$("#pcode").val('');
        $("#pname").val('');	
	}
	$(".add-row").click(function(){
    	var code = $("#pcode").val();
        var name = $("#pname").val();
        $.ajax({
            url: 'AddDataToTable?pcode='+code+'&pname='+name,
            success: function(response) {
            },
            error: function(xhr) {
            }
        });
        loadTableData();
        clearData();
    });
	 $(".delete-row").click(function(){
          $("table tbody").find('input[name="record"]').each(function(){
          	if($(this).is(":checked")){
          		var code=$(this).parents("tr").attr("id");
          		$.ajax({
                    url: 'DeleteFromSession?pcode='+code,
                    success: function(response) {
                    },
                    error: function(xhr) {
                    }
                });
                  $(this).parents("tr").remove();
                  loadTableData();
                  clearData();
              }
          });
      });
	 function loadTableData(){
		 $.get('PopulateTable',function(responseJson) {
      	   if(responseJson!=null){
      		   alert(JSON.stringify(responseJson));
          	   $("#countrytable").find("tr:gt(0)").remove();
          	   var table1 = $("#countrytable");
	               $.each(responseJson, function(key,value) { 
	               		 /*   var rowNew = $("<tr><td></td><td></td><td></td><td></td><td></td></tr>");
	               		   rowNew.children().eq(0).val("<a>Edit Item</a>");
	               		   rowNew.children().eq(1).val("<input type=button id='delete'/>");
	               		   rowNew.children().eq(2).text(value['productId']); 
	                       rowNew.children().eq(3).text(value['productName']); 
	                       rowNew.children().eq(4).text(value['productDescription']); 
	                       rowNew.appendTo(table1); */
	            	   var markup = "<tr id="+value['productId']+"><td><a href='#' onclick='edit("+value['productId']+")' >edit</a></td><td><input type=checkbox name=record></td><td>" 
	            	   + value['productId'] + "</td><td>" + value['productName'] + "</td>"+
	            	   +"<td>" + value['pDesc'] + "</td></tr>";
	            	   table1.append(markup);
	               });
              }
          }); 
	 }
	
	//$("#tablediv").hide();
     $("#showTable").click(function(event){
    	 loadTableData();
            //$("#tablediv").show();          
	 });      
});
</script>
</head>
<body class="container">
<h1>Welcome <%=session.getAttribute("userName") %></h1>
<form>
        <input type="text" id="pcode" placeholder="Product Code">
        <input type="text" id="pname" placeholder="Product Name">
    	<input type="button" class="add-row" value="Add Row">
    </form>
<br/>
<br/>
<div id="tablediv">

<table cellspacing="0" id="countrytable"> 
    <tr> 
        <th scope="col">Edit</th> 
        <th scope="col">Delete</th> 
        <th scope="col">Product Code</th> 
        <th scope="col">Product Name</th> 
    </tr> 
</table>
<button type="button" class="delete-row">Delete Row</button>
</div>
</body>
</html>