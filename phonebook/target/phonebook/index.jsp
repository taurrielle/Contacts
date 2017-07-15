<html ng-app="ContactsApp">
<head>
    <title>Contacts</title>
    <link rel="stylesheet" href="/include/styles.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.min.js"></script>
    <script type="text/javascript" src="include/js/app.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>


<body ng-controller="ContactsController">
<div class="container">
    <div class="col-sm-6 col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">Your Contacts

                    <button ng-click="addContact()" class="btn btn-primary btn-sm pull-right">
                    <span class="glyphicon glyphicon-plus"></span> Add New </button>
                    <div class="clearfix"></div>
                </div>

                <div class="input-group">
                    <input type="text" ng-model="search" class="form-control" placeholder="Search...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="glyphicon glyphicon-search"></i></button>
                    </span>
                </div>
            </div>

            <div class="panel-body fixed-panel">
                <ul class="list-group">
                    <li class="list-group-item"
                        ng-repeat="contact in contacts | filter:search"
                        ng-click="getContact(contact.id)">{{contact.name}} {{contact.surname}}</li>
                </ul>
            </div>
        </div>
    </div>

    <div class="contact-info-panel" ng-show="toggle">
        <div class="col-sm-6 col-md-6">
            <div class="panel panel-default">
                <div class="panel-body">
                    <h2>{{contact.name}} {{contact.surname}}</h2>

                    <table class="table">
                        <tr>
                            <td><span class="fa fa-mobile fa-lg" ></span> {{contact.number}}</td>
                        </tr>
                        <tr>
                            <td><span class="fa fa-envelope-open-o"></span> {{contact.email}}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="col-sm-6 col-md-6" ng-show="toggleNew">
        <div class="panel panel-default">
            <div class="panel-heading"><h3>Add Contact</h3></div>
            <div class="panel-body">

                <form ng-submit="saveContact()" name="contactForm" novalidate>

                    <div class="form-group" ng-class="{'has-error' : contactForm.name.$invalid && contactForm.name.$dirty,
                                                        'has-success': contactForm.name.$valid}">
                        <label>Name:</label>
                        <input type="text" ng-model="contact.name" name="name"
                               class="input-field form-control"
                               placeholder="Name" required/>
                        <p ng-show="contactForm.name.$invalid && contactForm.name.$dirty" class="help-block">This field is required.</p>
                    </div>

                    <div class="form-group" ng-class="{'has-error' : contactForm.surname.$invalid && contactForm.surname.$dirty,
                                                        'has-success': contactForm.surname.$valid}">
                        <label>Surname:</label>
                        <input type="text" ng-model="contact.surname" name="surname"
                               class="input-field form-control"
                               placeholder="Surname" required/>
                        <p ng-show="contactForm.surname.$invalid && contactForm.surname.$dirty" class="help-block">This field is required.</p>
                    </div>

                    <div class="form-group" ng-class="{'has-error' : contactForm.number.$invalid && contactForm.number.$dirty,
                                                        'has-success': contactForm.number.$valid}">
                        <label>Number:</label>
                        <input type="tel" ng-model="contact.number" name="number"
                               class="input-field form-control"
                               placeholder="Phone number"
                               ng-pattern="/^\+?\d+$/" required/>
                        <p ng-show="contactForm.number.$error.pattern" class="help-block ">Invalid number</p>
                        <p ng-show="contactForm.number.$error.required && contactForm.number.$dirty" class="help-block">This field is required.</p>
                    </div>

                    <div class="form-group" ng-class="{'has-error' : contactForm.email.$invalid && contactForm.email.$dirty,
                                                        'has-success': contactForm.email.$valid}">
                        <label>Email:</label>
                            <input type="email" ng-model="contact.email" name="email"
                                   class="input-field form-control"
                                   placeholder="Email" required/>
                        <p ng-show="contactForm.email.$error.email" class="help-block ">Invalid email</p>
                        <p ng-show="contactForm.email.$error.required && contactForm.email.$dirty" class="help-block">This field is required.</p>
                    </div>

                    <div class="form-actions pull-right">
                        <button type="submit" type="reset" class="btn btn-success" ng-disabled="contactForm.$invalid">
                            <span class="glyphicon glyphicon-plus"></span> Save</button>

                        <button type="reset" class="btn btn-danger" ng-click="closeForm()">
                            <span class="glyphicon glyphicon-remove"></span> Cancel</button>
                        <%--value="{{!ctrl.user.id ? 'Add' : 'Update'}}"--%>
                        <%--<button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>--%>
                    </div>


                </form>
            </div>

        </div>
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