<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>


<div ng-controller="tripSdManageController as c" ng-init="c.getAllTripSd()" style="margin-top: 5%">
	<div class="bootstrap snippet">
		<div class="row">
			<h1 class="title">Przejazdy</h1>
			<form class="adminManage">
				Szukaj
				<p>
					<input type="text" ng-model="filter" class="textbox">
				</p>
			</form>
			<div id="no-more-tables">
				<table class="table-bordered table-striped table-condensed cf">
					<thead class="cf">
						<tr>
							<th>Skąd</th>
							<th>Dokąd</th>
							<th>Utworzono</th>
							<th>Autor</th>
							<th>Akcja</th>
						</tr>
					</thead>
					<tbody>

						<tr ng-repeat="t in c.trips | filter:filter">
							<td data-title="Skąd">{{t.fromPlace}}</td>
							<td data-title="Dokąd">{{t.toPlace}}</td>
							<td data-title="Utworzono">{{t.createdDate}}</td>
							<td data-title="Autor">{{t.user.username}}</td>
							<td data-title="Akcja">

							

								  <button class="btn btn-primary" data-toggle="modal"
									data-target="#edit" ng-click="c.select(t)">Edytuj</button>

								<button class="btn btn-danger" data-toggle="modal"
									data-target="#remove" ng-click="c.select(t)">Usuń</button>
								
							</td>

						</tr>


					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div id="edit" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Edycja</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
					   
					    <div class="form-group">
							<label class="control-label col-sm-2" for="pwd">Skąd</label>
							<div class="col-sm-10">
								<input type="text" class="textbox" id="pwd"
									ng-model="c.selectedTripSd.fromPlace">
							</div>
						</div>
						
						<div class="form-group">
							<label class="control-label col-sm-2" for="pwd">Dokąd</label>
							<div class="col-sm-10">
								<input type="text" class="textbox" id="pwd"
									ng-model="c.selectedTripSd.toPlace">
							</div>
						</div>
					

						<!-- <div class="form-group">
							<label class="control-label col-sm-2" for="pwd">Opis</label>
							<div class="col-sm-10">
								<input type="text" class="textbox" id="pwd"
									ng-model="c.selectedTripSd.description">
							</div>
						</div> -->


						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-info"
									data-dismiss="modal" ng-click="c.updateAdmin()">Zapisz</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Zamknij</button>
				</div>
			</div>

		</div>
	</div>


	<!-- Modal -->
	<div id="remove" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Czy na pewno usunąć przejazd</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">{{c.selectedTripSd.fromPlace}}
						-> {{c.selectedTripSd.toPlace}}</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger" data-dismiss="modal"
						ng-click="c.remove()">Tak</button>
					<button type="button" class="btn btn-success" data-dismiss="modal">Nie</button>
				</div>
			</div>

		</div>
	</div>

</div>
