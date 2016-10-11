var app = angular.module('wordstock', ['ngRoute', 'templates'])
       .config(config);
// TODO: Clean up unused controllers- there are 7 files but only 4 wired up
config.$inject = ['$routeProvider', '$locationProvider'];
function config(  $routeProvider,   $locationProvider  )  {
 $routeProvider
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
    .when('/users/:id', {
      templateUrl: 'users/show.html',
      controller: 'UserShowController',
      controllerAs: 'userShowCtrl'
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
