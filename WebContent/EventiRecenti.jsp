<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,model.bean.*" %>
    
<% 
    ArrayList<?> eventi = (ArrayList<?>) request.getAttribute("eventiRecenti");
	if(eventi == null) {
		response.sendRedirect("./eventiRecenti");	
		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  
  <meta name="description" content="Mobile Application HTML5 Template">

  <meta name="copyright" content="MACode ID, https://www.macodeid.com/">

  <title>Partecipa evento</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 
</head>
<body>
<%@ include file="./fragments/header.jsp" %>
<div class="container" style="margin: 100px;">
	<div class="row">
	<%
		if (eventi != null && eventi.size() != 0) {
			Iterator<?> it = eventi.iterator();
			while (it.hasNext()) {
				EventoBean e = (EventoBean) it.next();
	%>
		<div class="col-lg-4 cusom_event_class mt-5">
			<div class="card" style="width: 18rem;">
  				<div class="card-body">
    			<h3 class="card-title"><%=e.getNome() %></h3>
   				<p class="card-text">e.getDescrizione()</p>
    			<p class="card-text"><%=e.getData() %></p><p class="card-text"<%=e.getOra() %>></p>
    			<a href="recensione?&nome="<%=e.getNome() %> class="card-link">Recensisci</a>
  				</div>
			</div>
		</div>
		<%
			}
		} else {
	%>
	
	<h2>Non hai partecipato a nessuna partita nell'ultima settimana</h2>
		
	<%
		}
	%>
	</div>
</div>

<%@ include file="./fragments/footer.html" %>
</body>
</html>