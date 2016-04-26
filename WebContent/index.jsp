<%@page import="java.util.ArrayList"%>
<%@page import="model.Result"%>

<%
	ArrayList<Result> results = (ArrayList<Result>) request.getAttribute("results");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lucene Example</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.1.3/material.light_green-yellow.min.css" />
<script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
<style>

.margin-top-bottom{
	margin-top: 15px;
	margin-bottom: 15px;
}

.center{
	margin-left: auto;
	margin-right: auto;
}

</style>
</head>
<body>

	<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		<header class="mdl-layout__header">
			<div class="mdl-layout__header-row">
				<span class="mdl-layout-title">Lucene Example</span>
				<div class="mdl-layout-spacer"></div>
			</div>
		</header>
		<main class="mdl-layout__content">
		<div class="page-content">
			<div class="mdl-grid">
				<div class="mdl-cell mdl-cell--4-col"></div>
				<div class="mdl-cell mdl-cell--4-col">
					<img src="https://lucene.apache.org/images/lucene_logo_green_300.png" class="margin-top-bottom center"/>
					<form action="search" method="POST" class="margin-top-bottom">
						<div class="mdl-textfield mdl-js-textfield ">
							<input class="mdl-textfield__input" type="text" name="queryTxt"
								id="queryTxt"> <label class="mdl-textfield__label"
								for="queryTxt">Enter your query here...</label>
						</div>

						<button
							class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored ">
							<i class="material-icons">search</i>
						</button>
					</form>

					<%
						if (results != null && results.size() > 0) {
					%>
					<h4>Results for "<i><%=request.getParameter("queryTxt") %></i>"</h4>

					<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
						<thead>
							<tr>
								<th class="mdl-data-table__cell--non-numeric">Document</th>
								<th>Score</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (Result r : results) {
							%>
							<tr>
								<td class="mdl-data-table__cell--non-numeric"><%=r.getDocumentName()%></td>
								<td><%=r.printScore()%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>

					<%
						} else {
					%>
					No results.
					<%
						}
					%>


				</div>
				<div class="mdl-cell mdl-cell--4-col"></div>
			</div>
		</div>
		</main>
	</div>
</body>
</html>