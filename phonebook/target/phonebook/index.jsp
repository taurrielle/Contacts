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


<body ng-controller="HttpCtrl as app">
<div class="container">
    <div class="col-sm-6 col-md-4">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">{{panelTitle}}

                    <button ng-click="addNew()" class="btn btn-primary btn-sm pull-right">
                    <span class="glyphicon glyphicon-plus"></span> Add New </button>
                    <div class="clearfix"></div>
                </div>
            </div>

            <div class="panel-body">
                <ul class="list-group">
                    <li class="list-group-item"
                        ng-repeat="contact in contacts"
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
                            <td><i class="fa fa-mobile fa-lg"></i> {{contact.number}}</td>
                        </tr>
                        <tr>
                            <td><i class="fa fa-envelope-open-o"></i> {{contact.email}}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="col-sm-6 col-md-6" ng-show="toggleNew">
        <div class="panel panel-default">
            <div class="panel-body">

                <form ng-submit="app.saveActor(contact.id)" name="myForm">

                    <div class="row">
                        <div class="form-group col-md-12">
                            <label class="control-label col-sm-2" for="name">Name:</label>
                            <div class="col-md-6">
                                <input type="text" ng-model="contact.name" id="name"
                                       class="input-field form-control input-sm"
                                       placeholder="Contact name" required/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-12">
                            <label class="col-md-2 control-label" for="surname">Surname:</label>
                            <div class="col-md-6">
                                <input type="text" ng-model="contact.surname" id="surname"
                                       class="input-field form-control input-sm"
                                       placeholder="Contact surname" required/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-12">
                            <label class="col-md-2 control-label" for="number">Number:</label>
                            <div class="col-md-6">
                                <input type="tel" ng-model="contact.number" id="number"
                                       class="input-field form-control input-sm"
                                       placeholder="Contact number"
                                       ng-pattern="/^\+?\d+$/(" required/>
                                <span ng-show="myForm.number.$error.pattern">Not a valid number!</span>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-md-12">
                            <label class="col-md-2 control-lable" for="email">Email</label>
                            <div class="col-md-6">
                                <input type="email" ng-model="contact.email" id="email"
                                       class="input-field form-control input-sm"
                                       placeholder="Contact email" required/>
                            </div>
                        </div>
                    </div>

                </form>
                <%--
                                    <div class="row">
                                        <div class="form-actions floatRight">
                                            <input type="submit"  value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                                            <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                                        </div>
                                    </div>
                                </form>--%>





            </div>
        </div>
    </div>

    <%--<div class="RightPanel">--%>
        <%--<image src="{{actor.image}}" width="220">--%>
    <%--</div>--%>

    <div class="MainBody">
        <form>
            <table>
                <tr>
                    <td><input type="text" ng-model="searchName" size="30"></td>
                    <td>
                        <button type="button" ng-click="searchActor(searchName)"
                                class="btn btn-primary btn-sm">
                            <span class="glyphicon glyphicon-search"></span>Search</button>
                    </td>

                    <td><button ng-click="addNew()" class="btn btn-primary btn-sm right">
                        <span class="glyphicon glyphicon-plus"></span> Add New </button></td>


                    <td><button ng-click="editContact()" class="btn btn-primary btn-sm right">
                        <span class="glyphicon glyphicon-pencil"></span> Edit </button></td>


                    <td><button ng-click="resetSearch()"  class="btn btn-info btn-sm">
                        <span class="glyphicon glyphicon-refresh"></span> Reset Search
                    </button></td>
                </tr>
            </table>
        </form>

        <form id="main">
            <table>
                <%--<tr>--%>
                    <%--<td class="display_bold"><label for="name">ID:</label></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                    <%--<td class="display"><input id="id" type="text"--%>
                                               <%--ng-model="contact.id" size="4"></td>--%>
                <%--</tr>--%>
                <tr>
                    <td class="display_bold">
                        <label for="name">Name:</label>
                    </td>
                </tr>
                <tr>
                    <td class="display"><input type="text"
                                               ng-model="contact.name" size="30"></td>
                </tr>
                <tr>
                    <td class="display_bold">
                        <label for="name">Surname:</label>
                    </td>
                </tr>
                <tr>
                    <td class="display"><input type="text"
                                               ng-model="contact.surname" size="40"></td>
                </tr>
                <tr>
                    <td class="display_bold">
                        <label for="name">Number:</label>
                    </td>
                </tr>
                <tr>
                    <td class="display"><input type="text"
                                               ng-model="contact.number" size="20"></td>
                </tr>
                <tr>
                    <td class="display_bold">
                        <label for="name">Email:</label>
                    </td>
                </tr>
                <tr>
                    <td class="display"><input type="text"
                                               ng-model="contact.email" size="30"></td>
                </tr>

                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td><button ng-click="saveActor(contact.id)"
                                            class="btn btn-success btn-sm"
                                            title="Save actor's details..." ng-disabled="isSaveDisabled">
                                    <span class="glyphicon glyphicon-plus"></span>
                                    Save </button>
                                </td>
                                <td>
                                    <button ng-click="deleteActor(contact.id)"
                                            class="btn btn-danger btn-sm" ng-disabled="isDeleteDisabled">
                                        <span class="glyphicon glyphicon-trash"></span>
                                        Delete </button></td>
                            </tr>
                        </table>
                    </td>
                </tr>

            </table>
        </form>
    </div>
</div>
</body>
</html>