<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
<style>
	
	th {

		background-color: none;
	}
	
</style>

	
	
	
	
		<%@page  language="java" import="commons.Crud1" %>
		
<%
	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "jorksyro_terjerai";
	String userId = "root";
	String password = "";
	
	String[] lent_suniukai = {  "lytis", "gimimo_data", "tevas", "mama", "defektai", "paskirtis", "kaina" };
	String[] lauk_suniuko = new String [ lent_suniukai.length ];
	
		Crud1 suniukai_crud = new Crud1 ( dbName, userId, password, connectionUrl, "suniukai",  lent_suniukai );
		
		
							
%>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
<script>
		
	$(document).ready(function(){
	
		$('.record_edit').click(function(){
		
			//id_rec=$(this).data('id_suniuko');
			id_rec=$(this).data('id_rec');
		
			if (mygtukas = document.getElementById ('toEdit_' + id_rec) ) {
<%				
				for ( int i=0; i<lent_suniukai.length; i++) {
%>
					document.getElementById('<%=lent_suniukai [ i ] %>').value= mygtukas.dataset.<%=lent_suniukai [ i ] %>;
<%
				}
%>
				
				document.getElementById( "id_suniuko" ).value = id_rec;
			}
		});
	});		
		
			function iValyma () {
<%
				
				for ( int i=1; i<lent_suniukai.length; i++) {
%>
				
				document.getElementById('<%=lent_suniukai [ i ] %>').value= "";
<%				
				}
%>
				
			}
			
			function iTrinima ( id_rec ) {
			
				mygtukasEdit = document.getElementById ( 'toEdit_' + id_rec );
				
				pav = mygtukasEdit.dataset.pav;
				
				var r = confirm( "Ar norite pašalinti šuniuko duomenis" + pav + "?" );
				
				
				if ( r == true ) {
					
					document.getElementById ( "m_del" ).value = id_rec;
					forma_del = document.getElementById ( "del_rec" );
					forma_del.submit();
				}
				
			}
			

	</script>

</head>

<body>
<%	
	try { 
		/*connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );*/
		String add; 
		String id_suniuko = "0";
		String sql_ins = "";
		id_suniuko = request.getParameter( "id_suniuko" );
		
		add = request.getParameter("add");
		
		out.println(add);
	
		
		
		if ( ( ( add ) != null ) && add.equals ( "Papildyti" ) ) {
		
			
			for ( int i = 0; i<lent_suniukai.length; i++ ) {																																		// Miestai miestas = new Miestai ( lent_miestu );
																																					// miestas.takeFromParams ( request );for ( int i = 0; i<lent_punktu_tipai.length; i++ ) {
				lauk_suniuko[ i ] = request.getParameter ( lent_suniukai [ i ] );
			}
		
			
			if ( ( id_suniuko ==null) || ( id_suniuko.equals("0" ) ) ) {
			
					suniukai_crud.papildyti ( lauk_suniuko );
			
				
			} else {
				
				
				suniukai_crud.update ( lauk_suniuko, id_suniuko );
			}
			
			
		} else {
		 
				if ( add != null ) {
			
					out.println ( add );
			}
		 } 
			
			String del = "";
		
		if ( ( (  del = request.getParameter("del" ) ) != null) && del.equals ( "del1rec" ) ) {	
		
				
				suniukai_crud.delete ( id_suniuko );
			}	
			
	} catch ( Exception e ) {
	
		e.printStackTrace();
	}
%>


<h2 align="center">Jorkšyro terjero šuniukai</h2>
<form method="post" action="">	
<table width="400" cellspacing="5" cellpadding="5" border="1">
	<tr>
	</tr>
	<tr>
		<th>Lytis</th>
		<th>Gimimo data</th>
		<th>Tevas</th>
		<th>Mama</th>
		<th>Defektai</th>
		<th>Paskirtis</th>
		<th>Kaina</th>
		
	
	</tr>
<%
	try{
	     
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		out.println (suniukai_crud.lentele ());
		
		
	} catch (Exception e) {
	
		e.printStackTrace();
	}
%>


</table>

	<div class="form">
		<form action="" method="POST">
		<input type="text" name="lytis" id="lytis" value="" required placeholder="Lytis">
		<input type="text" name="gimimo_data" id="gimimo_data" value="" required placeholder="Gimimo_data">
		<input type="text" name="tevas" id="tevas" value="" required placeholder="Tevas">
		<input type="text" name="mama" id="mama" value="" required placeholder="Mama">
		<input type="text" name="defektai" id="defektai" value="" required placeholder="Defektai">
		<input type="text" name="paskirtis" id="paskirtis" value="" required placeholder="Paskirtis">
		<input type="text" name="kaina" id="kaina" value="" required placeholder="Kaina" >
		<input type="submit" name="add" value="Papildyti" class="btn btn-primary">
		<input type="hidden" id="id_suniuko" name="id_suniuko" value="0">
		
	</form>

	<form id="del_rec" method="post" action="">
	<input type="hidden" name="del" value="del1rec">
	<input type="hidden" id="m_del" name="id_suniuko" value="0">
	</form>



</table>

</body>
</html>