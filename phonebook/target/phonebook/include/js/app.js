// (function() {

var app = angular.module("ContactsApp", []);

app.controller("ContactsController", function($scope, $http) {

    $scope.toggle = false;
    $scope.toggleNew = false;

    var response = $http.get('/rest/contacts/all');
    response.then(function (result) {
        $scope.contacts = result.data;
        console.log("[main] # of items: " + result.length());
        angular.forEach(result, function (element) {
            console.log("[main] contact: " + element.name);

        });
    });
    response.catch(function (data, status, headers, config) {
        alert("AJAX failed to get data, status=" + status);
    });


    $scope.getContact = function(id) {
        var response=$http.get('/rest/contacts/' + id);
        response.then(function(result) {
            console.log("getContact data: " + angular.toJson(result.data, false));
            $scope.contact = result.data;
            $scope.toggle = true;
            $scope.toggleNew = false;
        });
        response.catch(function(data, status, headers, config) {
            alert("AJAX failed to get data, status=" + status);
        })
    };

    $scope.editContact = function(id) {

    };

    $scope.clearForm = function() {
        $scope.contact = {
            name:'',
            surname:'',
            number:'',
            email:''
        };
        $scope.contactForm.$setPristine();
    };

    $scope.closeForm = function() {
        $scope.clearForm();
        $scope.toggleNew = false;
    };

    $scope.addContact = function() {
        $scope.toggleNew = true;
        $scope.toggle = false;
        $scope.clearForm();
    };

    $scope.saveContact = function() {
        $scope.toggleNew = false;
        $scope.jsonObj = angular.toJson($scope.contact, false);

        console.log("[update] data: " + $scope.jsonObj);

        var response=$http.post('/rest/contacts/get', $scope.jsonObj);

        response.then(function onSuccess(data, status) {
            console.log("Inside create operation..."
                + angular.toJson(data, false) + ", status=" + status);
            $scope.contacts.push($scope.contact);
        })
            .catch(function onError(data, status) {
                alert("AJAX failed to get data, status=" + status);
            });
    };
});
// })();




/*         contactsCtrl.saveContact = function(id) {
 contactsCtrl.toggleNew = false;

 contactsCtrl.jsonObj = angular.toJson($scope.contact, false);

 console.log("[update] data: " + $scope.jsonObj);

 if ($scope.operation == "update") {
 var response = $http.put('/rest/contacts/get'
 + id, $scope.jsonObj);
 response.success(function(data, status) {
 console.log("Inside update operation..."
 + angular.toJson(data, false) + ", status=" + status);
 $scope.resetSearch();
 });

 response.error(function(data, status) {
 alert("AJAX failed to get data, status=" + status);
 })
 } else if ($scope.operation == "create")// {
 var response=$http.post('/rest/contacts/get', $scope.jsonObj);

 response.then(function onSuccess(data, status) {
 console.log("Inside create operation..."
 + angular.toJson(data, false) + ", status=" + status);
 // $scope.resetSearch();
 $scope.contacts.push($scope.contact);
 })
 .catch(function onError(data, status) {
 alert("AJAX failed to get data, status=" + status);
 });
 //}
 };




 $scope.searchActor = function(name) {
 $scope.navTitle = 'Search Criteria';

 var response = $http.get(
 '/RestfulWebServiceExample/rest/actors/search/' + name);
 response.success(function(data) {
 $scope.contacts = data;
 $scope.$apply();

 console.log("[searchActor] # of items: " + data.length)
 angular.forEach(data, function(element) {
 console.log("[searchActor] actor: " + element.name);
 });

 });

 response.error(function(data, status, headers, config) {
 alert("AJAX failed to get data, status=" + status);
 })
 };


 $scope.deleteActor = function(id) {
 var response = $http.delete(
 '/RestfulWebServiceExample/rest/actors/' + id);
 response.success(function(data, status) {
 console.log("Inside delete operation..."
 + angular.toJson(data, false) + ", status=" + status);
 $scope.resetSearch();
 });

 response.error(function(data, status) {
 alert("AJAX failed to get data, status=" + status);
 })
 };

 $scope.resetSearch = function(name) {
 $scope.operation="";
 $scope.clearForm();
 $scope.isSaveDisabled = true;
 $scope.isDeleteDisabled = true;
 $scope.navTitle = 'All Stars';
 $scope.searchName = '';

 var response = $http.get('/RestfulWebServiceExample/rest/actors/');
 response.success(function(data) {
 $scope.contats = data;
 //$scope.$apply();
 console.log("[resetSearch] # of items: " + data.length)
 });

 response.error(function(data, status, headers, config) {
 alert("AJAX failed to get data, status=" + status);
 })
 };*/
