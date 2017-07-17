(function() {

    var app = angular.module("ContactsApp", []);

    app.directive('contactForm', function(){
        return {
            restrict: 'E',
            templateUrl: 'contact-form.html'
        };
    });

    app.directive('contactsPanel', function() {
        return {
            restrict: 'E',
            templateUrl: 'contacts-panel.html'
        };
    });

    app.directive('contactPanel', function() {
        return {
            restrict: 'E',
            templateUrl: 'contact-panel.html'
        };
    });

    app.directive('settingsButton', function() {
        return {
            restrict: 'E',
            templateUrl: 'settings-button.html'
        };
    });


    app.controller("ContactsController", function($scope, $http) {

        $scope.toggle = true;
        $scope.toggleNew = false;
        $scope.contactExists = false;
        $scope.contactSaved = false;
        $scope.editFlag = false;

        $scope.activeTab = 0;



        $scope.setActiveTab = function(value) {
            $scope.activeTab = value;
        };


        $scope.getContact = function(id) {
            var response=$http.get('/rest/contacts/' + id);
            response.then(function(result) {
                console.log("getContact data: " + angular.toJson(result.data, false));
                $scope.contact = result.data;
                $scope.toggle = true;
                $scope.toggleNew = false;
                $scope.closeAlert();
            });
            response.catch(function(data, status, headers, config) {
                alert("AJAX failed to get data, status=" + status);
            })
        };



        var response = $http.get('/rest/contacts/all');
        response.then(function (result) {
            $scope.contacts = result.data;
            console.log("[main] # of items: " + result.data.length);
            angular.forEach(result.data, function (element) {
                console.log("[main] contact: " + element.name);

                $scope.getContact(result.data[0].id);
            });
        });
        response.catch(function (data, status, headers, config) {
            alert("AJAX failed to get data, status=" + status);
        });



        $scope.saveContact = function() {
            $scope.contactExists = false;
            $scope.contactSaved = false;

            $scope.jsonObj = angular.toJson($scope.contact, false);

            console.log("[save] data: " + $scope.jsonObj);

            var response=$http.post('/rest/contacts/put', $scope.jsonObj);

            response.then(function onSuccess(result, status) {
                console.log("Inside create operation..."
                    + angular.toJson(result.data, false) + ", status=" + status);
                $scope.contacts.push(result.data);
                $scope.toggleNew = false;
                $scope.contactSaved = true;
            });
            response.catch(function onError(data, status) {
                $scope.contactExists = true;

            });
        };

        $scope.editContact = function(id) {
            $scope.toggle = false;
            $scope.toggleNew = true;

            $scope.jsonObj = angular.toJson($scope.contact, false);
            console.log("[update] data: " + $scope.jsonObj);
            console.log("addFlag" + $scope.addFlag);
            var response = $http.get('/rest/contacts/' + id);
            response.then(function(result, status) {
                console.log("Inside edit operation..."
                    + angular.toJson(result.data, false) + ", status=" + status);
            });

            response.catch(function(result, status) {
                alert("AJAX failed to get data, status=" + status);
            })
        };

        $scope.deleteContact = function(id) {
            var response = $http.delete('/rest/contacts/' + id);
            response.then(function(result, status) {
                console.log("Inside delete operation..."
                    + angular.toJson(result.data, false) + ", status=" + status);
                $scope.contacts = $scope.contacts.filter(function( obj ) {
                    return obj.id !== result.data.id;
                });
                $scope.toggle = false;
            });

            response.catch(function(result, status) {
                alert("AJAX failed to get data, status=" + status);
            });
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
            $scope.addFlag = true;
            $scope.clearForm();
        };

        $scope.edit =function() {
            $scope.toggleNew = true;
            $scope.toggle = false;
            $scope.addFlag = false;
        }

        $scope.closeAlert = function() {
            $scope.contactSaved = false;
            $scope.contactExists = false;
        };
    });
})();