var app = angular.module('wordstock', ['ngRoute', 'templates'])
       .config(config);

config.$inject = ['$routeProvider', '$locationProvider'];
function config(  $routeProvider,   $locationProvider  )  {
 $routeProvider
   .when('/', {
     templateUrl: 'home.html',
     controller: 'HomeIndexController'
   })
  .when('/topics', {
    templateUrl: 'topics/index.html',
    controller: 'TopicIndexController',
    controllerAs: 'topicIndexCtrl'
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
