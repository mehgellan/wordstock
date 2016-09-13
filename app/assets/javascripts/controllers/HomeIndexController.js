angular
  .module('wordstock')
  .controller('HomeIndexController', HomeIndexController);


HomeIndexController.$inject = ['$http', '$window'];
function HomeIndexController($http, $window) {
  var vm = this;
  vm.greeting = "what's up?";
}
