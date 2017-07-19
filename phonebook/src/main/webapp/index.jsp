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
    <%--<div class="container">--%>


        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/">Contacts</a>
                </div>
                <%--<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                        <li><a href="/">Link</a></li>
                    </ul>
                </div>--%>
            </div>
        </nav>



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
    </body>
</html>