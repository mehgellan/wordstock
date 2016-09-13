angular.module('wordstock', ['ngRoute', 'templates'])
       .config(config)
       .controller('HomeIndexCtrl', [
          '$scope',
          function($scope){
            $scope.test = 'Hello world!';
          }
        ]);

config.$inject = ['$routeProvider', '$locationProvider'];
function config(  $routeProvider,   $locationProvider  )  {
 $routeProvider
   .when('/', {
     templateUrl: 'home.html',
     controller: 'HomeIndexController',
     controllerAs: 'homeIndexCtrl'
   })
   .otherwise({
     redirectTo: '/'
   });

 $locationProvider
   .html5Mode({
     enabled: true,
     requireBase: false
   });
}
// 
// HomeIndexController.$inject = [];
// function HomeIndexController() {
//   var vm = this;
//   vm.greeting = "what's up?";
// }
