var app = angular.module('wordstock', ['ngRoute', 'templates'])
       .config(config);

config.$inject = ['$routeProvider', '$locationProvider'];
function config(  $routeProvider,   $locationProvider  )  {
 $routeProvider
   .when('/', {
     templateUrl: 'home.html',
     controller: 'HomeIndexController'
   })
   .when('/words', {
      templateUrl: 'words/index.html',
      controller: 'WordsIndexController',
      controllerAs: 'wordIndexCtrl'
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
