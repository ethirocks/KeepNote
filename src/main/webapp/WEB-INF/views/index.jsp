<!DOCTYPE html>
<html lang="en">

<head>
<title>Keep-Board</title>
</head>

<body>
	<!-- Create a form which will have text boxes for Note title, content and status along with a Add 
		 button. Handle errors like empty fields -->
	<div class="form-group form">
		<form action='add' method="post">
			<label>Note Title:</label> <input type="text" id="noteTitle"
				name="noteTitle" placeholder="note title" class="form-control" /> <br />
			<label>Note Content:</label> <input type="text" id="noteContent"
				name="noteContent" placeholder="note content" class="form-control" />
			<br /> <label>Note Status:</label> <select name="noteStatus">
				<option value="active">active</option>
				<option value="inactive">inactive</option>
			</select> <br /><br />
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
	<c:if test="${!errorMessage.isEmpty()}">
		<p style="color: red;">${errorMessage}</p>
</c:if>
	<!-- display all existing notes in a tabular structure with Title,Content,Status, Created Date and Action -->
		<table>
    		<c:forEach items="${noteList}" var="note">
    			<tr>
    				<td>Note Id :</td>
    				<td>${note.noteId}</td>
    			</tr>
    			<tr>
    				<td>Note Title :</td>
    				<td>${note.noteTitle}</td>
    			</tr>
    			<tr>
    				<td>Note Content :</td>
    				<td>${note.noteContent}</td>
    			</tr>
    			<tr>
    				<td>Note Status :</td>
    				<td>${note.noteStatus}</td>
    			</tr>
    			<tr>
    				<td>Note created at :</td>
    				<td>${note.createdAt}</td>
    			</tr>
    			<tr>
    				<td>
    					<div>
    						<form action='delete' method="post">
    							<input type="hidden" id="noteId" name="noteId"
    								value="${note.noteId}"/>
    							<button type="submit" class="btn btn-dark">Delete</button>
    						</form>
    					</div>
    				</td>
    				<td><button data-toggle="modal" data-target="#exampleModal" class="btn btn-primary">Update</button></td>
    			</tr>
    			<div class="modal" id="exampleModal" tabindex="-1" role="dialog">
    				<div class="modal-dialog" role="document">
    					<div class="modal-content">
    						<div class="modal-header">
    							<h5 class="modal-title">Update</h5>
    							<button type="button" class="close" data-dismiss="modal"
    								aria-label="Close">
    								<span aria-hidden="true">&times;</span>
    							</button>
    						</div>
    						<div class="modal-body">
    							<form action='update' method="post">
    								<input type="hidden" id="noteId" name="noteId"
    									value="${note.noteId}" class="form-control" /> <label>Note
    									Title:</label> <input type="text" id="noteTitle" name="noteTitle"
    									placeholder="note title" value="${note.noteTitle}"
    									class="form-control" /> <br /> <label>Note Content:</label> <input
    									type="text" id="noteContent" name="noteContent"
    									placeholder="note content" value="${note.noteContent}"
    									class="form-control" /> <br /> <label>Note Status:</label> <select
    									name="noteStatus">
    									<option value="active">active</option>
    									<option value="inactive">inactive</option>
    								</select> <br />
    								<button type="submit" class="class="btn btn-primary">Update</button>
    							</form>
    						</div>
    					</div>
    				</div>
    			</div>
    		</c:forEach>

    </table>
</body>

</html>