angular
  .module('wordstock')
  .controller('HeaderController', HeaderController);

HeaderController.$inject = ['$scope', '$location'];
function HeaderController($scope, $location) {
  $scope.isActive = function(viewLocation) {
    return viewLocation === $location.path();
  };
}
