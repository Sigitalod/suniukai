<!DOCTYPE html>
<%@page pageEncoding="UTF-8" language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link href="css/bootstrap.min.css" rel="stylesheet" />
		<link href="font/css/all.min.css" rel="stylesheet" /> 
		<link href="css/style.css" rel="stylesheet">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<style>
	
		label, input { display:block; }
	
		    input.text { margin-bottom:12px; width:95%; padding: .4em; }
		    fieldset { padding:0; border:0; margin-top:25px; }
		    h1 { font-size: 1.2em; margin: .6em 0; }
		    div#users-contain { width: 350px; margin: 20px 0; }
		    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
		    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
		    .ui-dialog .ui-state-error { padding: .3em; }
		    .validateTips { border: 1px solid transparent; padding: 0.3em; }
	    
		#customers {
		  font-family: Arial, Helvetica, sans-serif;
		  border-collapse: collapse;
		  width: 100%;
		}
		
		#customers td, #customers th {
		  border: 1px solid #ddd;
		  padding: 8px;
		}
		
		#customers tr:nth-child(even){background-color: #f2f2f2;}
		
		#customers tr:hover {background-color: #ddd;}
		
		#customers th {
		  padding-top: 12px;
		  padding-bottom: 12px;
		  text-align: left;
		  background-color: powderblue;
		  color: white;
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

	 $( function() {
		var dialog, form,
		
		emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
		id = $( "#id" ),
		lytis = $( "#lytis" ),
		gimimo_data = $( "#gimimo_data" ),
		tevas = $( "#tevas" ),
		mama = $( "#mama" ),
		defektai = $( "#defektai" ),
		paskirtis = $( "#paskirtis" ),
		kaina = $( "#kaina" ),
		allFields = $( [] ).add( id ).add( lytis ).add( gimimo_data ).add( tevas ).add( mama ).add(defektai).add(paskirtis).add(kaina),
		tips = $( ".validateTips" );
	
	
	
	
	 function updateTips( t ) {
		tips
		.text( t )
		.addClass( "ui-state-highlight" );
		
			setTimeout(function() {
		
				tips.removeClass( "ui-state-highlight", 1500 );
			}, 500 );
	}
	
	 function checkLength( o, n, min, max ) {
		if ( o.val().length > max || o.val().length < min ) {
			o.addClass( "ui-state-error" );
			updateTips( "Length of " + n + " must be between " +
			min + " and " + max + "." );
			return false;
		
		} else {
			return true;
		}
	}
	
	function checkRegexp( o, regexp, n ) {
		if ( !( regexp.test( o.val() ) ) ) {
			o.addClass( "ui-state-error" );
			updateTips( n );
			return false;
		} else {
			return true;
		}
	}
	
	function addUser() {
		var valid = true;
		allFields.removeClass( "ui-state-error" );
	/*  
		valid = valid && checkLength( lytis, "lytis", 1, 1000 );
		valid = valid && checkLength( gimimo_data, "gimimo_data", 1, 10000 );
		valid = valid && checkLength( tevas, "tevas", 1, 10000 );
		valid = valid && checkLength( mama, "mama", 1, 1000 );
		valid = valid && checkLength( defektai, "defektai", 1, 1000 );
		valid = valid && checkLength( paskirtis, "paskirtis", 1, 1000 );
		valid = valid && checkLength( kaina, "kaina", 1, 1000 );
		
		valid = valid && checkRegexp( lytis, /([0-9a-z_\s])+$/i, "Password field only allow : a-z 0-9" );
		valid = valid && checkRegexp( gimimo_data, /([0-9a-z_\s])+$/i,"eg. ui@jquery.com" );
		valid = valid && checkRegexp( tevas, /([0-9a-z_\s])+$/i, "Password field only allow : a-z 0-9" );
		valid = valid && checkRegexp( mama, /([0-9a-z_\s])+$/i, "Password field only allow : a-z 0-9" );
		valid = valid && checkRegexp( defektai, /([0-9a-z_\s])+$/i, "Password field only allow : a-z 0-9" );
		valid = valid && checkRegexp( paskirtis, /([0-9a-z_\s])+$/i, "Password field only allow : a-z 0-9" );
		valid = valid && checkRegexp( kaina, /([0-9a-z_\s])+$/i, "Password field only allow : a-z 0-9" );
	*/	
		if ( valid ) {
		 console.log( $("#duomenys"));
		  	 $("#duomenys").submit();
			 alert("asdf")
		
		}
	 	 
			return valid;
	}
	dialog = $( "#dialog-form" ).dialog({
			autoOpen: false,
			height: 500,
			width: 400,
			modal: true,
		buttons: {
			"Saugoti": addUser,
			"Atšaukti": function() {
			dialog.dialog( "close" );
			}
		},
		
		 close: function() {
			allFields.removeClass( "ui-state-error" );
			}
	});
		
		 $( "#create-user" ).button().on( "click", function() {
			dialog.dialog( "open" );
	  
		});
		
	
	
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

	<div id="dialog-form"  title="Įvesti duomenis">
	 <p class="validateTips">Privaloma užpildyti visus laukelius</p>
		<form action="" method="POST" id="duomenys">
		<fieldset>
		<input type="text" name="lytis" id="lytis" value="" required placeholder="Lytis">
		<input type="text" name="gimimo_data" id="gimimo_data" value="" required placeholder="Gimimo_data">
		<input type="text" name="tevas" id="tevas" value="" required placeholder="Tevas">
		<input type="text" name="mama" id="mama" value="" required placeholder="Mama">
		<input type="text" name="defektai" id="defektai" value="" required placeholder="Defektai">
		<input type="text" name="paskirtis" id="paskirtis" value="" required placeholder="Paskirtis">
		<input type="text" name="kaina" id="kaina" value="" required placeholder="Kaina" >
		<input type="hidden" id="id_suniuko" name="id_suniuko" value="0">
		<input type="hidden" name="add" value="ivesti">
		<input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
		</fieldset>
	</form>
</div>

	<form id="del_rec" method="post" action="">
	<input type="hidden" name="del" value="del1rec">
	<input type="hidden" id="m_del" name="id_suniuko" value="0">
	
	</form>
	
<button id="create-user">Pridėti šuniuką</button>

</body>
</html>