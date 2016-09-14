var app = angular.module('wordstock', ['ngRoute', 'templates'])
       .config(config);

config.$inject = ['$routeProvider', '$locationProvider'];
function config(  $routeProvider,   $locationProvider  )  {
 $routeProvider
   .when('/', {
     templateUrl: 'home.html',
     controller: 'HomeIndexController'
   })
   .when('/users/:id', {
     templateUrl: 'users/show.html',
     controller: 'UserShowController',
     controllerAs: 'userShowCtrl'
   })
   .when('/topics/:id', {
     templateUrl: 'topics/show.html',
     controller: 'TopicShowController',
     controllerAs: 'topicShowCtrl'
   })
   .when('/topics/:id/words', {
      templateUrl: 'words/index.html',
      controller: 'WordsIndexController',
      controllerAs: 'wordsIndexCtrl'
    })
    .when('/words/:id', {
      templateUrl: 'words/show.html',
      controller: 'WordsShowController',
      controllerAs: 'wordsShowCtrl'
    })
  //  .otherwise({
  //    redirectTo: '/'
  //  });
;
 $locationProvider
   .html5Mode({
     enabled: true,
     requireBase: false
   });
}
