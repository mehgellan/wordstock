angular
  .module('wordstock')
  .controller('TopicShowController', TopicShowController);

TopicShowController.inject = ['$http', '$routeParams'];

function TopicShowController($http, $routeParams) {
  var vm = this;
  $http({
    method: 'GET',
    url: '/api/topics/' + $routeParams.id
  }).then(onTopicShowSuccess, onTopicShowError);

  $http({
    method: 'GET',
    url: '/api/topics/' + $routeParams.id + '/words'
  }).then(onWordsIndexSuccess, onWordsIndexError);

  function onTopicShowSuccess(response) {
    vm.topic = (response.data);
  }

  function onTopicShowError(error) {
    console.log("There was an error: ", error);
  }

  function onWordsIndexSuccess(response) {
    vm.words = (response.data);
  }

  function onWordsIndexError(error) {
    console.log("There was an error: ", error);
  }
}
