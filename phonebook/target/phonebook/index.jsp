<html ng-app="ContactsApp">
<head>
    <title>Show Contacts</title>
    <link rel="stylesheet" href="/include/styles.css">
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/ng2-bootstrap/x.x.x/ng2-bootstrap.min.js"></script>--%>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.min.js"></script>

    <script type="text/javascript" src="include/js/app.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body ng-controller="HttpCtrl as app">
<div class="container">
    <div class="header">
        <h1 class="custom">Contacts</h1>
    </div>

    <div class="leftPanel">
        <div class="LeftPanelHeader">{{ navTitle }}</div>
        <table class="side">
            <tr ng-repeat="c in contacts" ng-click="getContact(c.id)" >
                <td class="side">{{ c.name }}</td>
            </tr>
        </table>
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
                    <td><button ng-click="addNew()" class="btn btn-primary btn-sm">
                        <span class="glyphicon glyphicon-plus"></span> Add New </button></td>
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