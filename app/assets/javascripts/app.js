var app = angular.module('wordstock', ['ngRoute', 'templates'])
       .config(config);

config.$inject = ['$routeProvider', '$locationProvider'];
function config(  $routeProvider,   $locationProvider  )  {
 $routeProvider
   .when('/', {
     templateUrl: 'home.html',
     controller: 'HomeIndexController'
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