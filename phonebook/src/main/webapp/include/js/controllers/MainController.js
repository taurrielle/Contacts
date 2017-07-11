app.controller("HttpCtrl", function($scope, $http) {
    $scope.navTitle = 'All Contacts';
    $scope.operation="";
    $scope.isSaveDisabled = true;
    $scope.isDeleteDisabled = true;

    var response = $http.get('/rest/contacts/all');
    response.success(function(data) {
        $scope.contacts = data;
        console.log("[main] # of items: " + data.length)
        angular.forEach(data, function(element) {
            console.log("[main] contact: " + element.name);
        });
    })
    response.error(function(data, status, headers, config) {
        alert("AJAX failed to get data, status=" + status);
    })

    $scope.getContact = function(id) {
        var response=$http.get('/rest/contacts/'+ id );

        response.success(function(data) {
            console.log("getContact data: " + angular.toJson(data, false));
            $scope.contact = data;
            $scope.operation="update";
            $scope.isSaveDisabled = false;
            $scope.isDeleteDisabled = false;
        })

        response.error(function(data, status, headers, config) {
            alert("AJAX failed to get data, status=" + status);
        })
    };
})();
