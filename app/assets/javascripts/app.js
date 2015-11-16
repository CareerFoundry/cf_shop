var app = angular.module('shop', ['ngResource']);
// we need to include ngResource because angular doesn't include it from the beginning

$(document).on('ready page:load', function() {
  angular.bootstrap(document.body, ['shop'])
});

// service - factory
app.factory('models', ['$resource', function($resource){
  var orders_model = $resource("/orders/:id.json", {id: "@id"});
  var products_model = $resource("/products/:id.json", {id: "@id"});

  var x = { // creating an object variable with "models" in there allows us to add more objects/methods later
    orders: orders_model,
    products: products_model
  };
  return x;
}]);

// to use a service in  a controller we have to INJECT it as a parameter of the controller
app.controller('OrdersCtrl', ['$scope', 'models', function($scope, models){
  $scope.orders = models.orders.query();
  $scope.products = models.products.query();

  // ng-click
  $scope.addOrder = function(){
    //end this function early if the user tries to enter an empty title
    if(!$scope.newOrder.product_id || $scope.newOrder.total === ''){ return; }

    order = models.orders.save($scope.newOrder, function(){
      // to access the controller and product name we need to make another call to the controller:
      // we can't access order.id outside of this function. It is not defined by angular but automatically by rails during the saving process
      recent_order = models.orders.get({id: order.id});
      // The 'push' needs to be INSIDE this function because 'recent_order' is not accessible outside this function
      $scope.orders.push(recent_order);
      // only $scope.orders.push(order); would not make a request to the controller. So the product name wouldn't be loaded
      $scope.newOrder = '';
    });
  };

  // ng-click
  // we call the function inside the views with deleteOrder(order) and define order to be the order object of the current iteration
  $scope.deleteOrder = function(order){
    models.orders.delete(order);
    // splice is the proper way to remove elements from an array
    // first parameter: index/position in array, second: amount of elements to remove
    $scope.orders.splice($scope.orders.indexOf(order), 1);
  };

}])
