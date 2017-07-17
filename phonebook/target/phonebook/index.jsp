<html ng-app="ContactsApp">
<head>
    <title>Contacts</title>
    <link rel="stylesheet" href="/include/styles.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.min.js"></script>
    <script type="text/javascript" src="include/js/app.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>


<body ng-controller="ContactsController">
    <div class="container">
        <div ng-show="contactExists" class="alert alert-danger alert-dismissable">
            <a href="#" class="close" ng-click="closeAlert()">&times;</a>
            <strong>Contact already exists!</strong>
        </div>

        <div ng-show="contactSaved" class="alert alert-success alert-dismissable">
            <a href="#" class="close" ng-click="closeAlert()">&times;</a>
            <strong>Contact created successfully!</strong>
        </div>


        <div class="col-sm-6 col-md-4">
            <contacts-panel></contacts-panel>
        </div>

        <div class="contact-info-panel" ng-show="toggle">
            <div class="col-sm-6 col-md-6">

                <contact-panel></contact-panel>
            </div>
        </div>

        <div class="col-sm-6 col-md-6" ng-show="toggleNew">
            <contact-form></contact-form>
        </div>
    </div>

    <%--<div class="RightPanel">--%>
        <%--<image src="{{actor.image}}" width="220">--%>
    <%--</div>--%>

                    <%--<td><input type="text" ng-model="searchName" size="30"></td>
                    <td>
                        <button type="button" ng-click="searchActor(searchName)"
                                class="btn btn-primary btn-sm">
                            <span class="glyphicon glyphicon-search"></span>Search</button>
                    </td>--%>

<%--<td><button ng-click="saveActor(contact.id)"
                class="btn btn-success btn-sm"
                title="Save actor's details..." ng-disabled="isSaveDisabled">
        <span class="glyphicon glyphicon-plus"></span>
        Save </button>
    </td>
    <td>
        <button ng-click="deleteActor(contact.id)"
                class="btn btn-danger btn-sm" ng-disabled="isDeleteDisabled">
            <span class="glyphicon glyphicon-trash"></span>
            Delete </button></td>--%>

    </body>
</html>