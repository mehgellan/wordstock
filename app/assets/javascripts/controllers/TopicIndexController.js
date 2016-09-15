angular
  .module('wordstock')
  .controller('TopicIndexController', TopicIndexController);

TopicIndexController.$inject = ['$http', '$routeParams'];

function TopicIndexController($http, $routeParams) {
  var vm = this;
  var id = $('a').attr('data-topic-id');

  $http({
    method: 'GET',
    url: '/api/topics'
  }).then(onTopicIndexSuccess, onTopicIndexError);

  vm.createTopic = function() {
    $http({
      method: 'POST',
      url: '/api/topics',
      data: vm.newTopic
    }).then(onTopicNewSuccess, onTopicNewError);
  };

  function onTopicIndexSuccess(response) {
    vm.topics = response.data;
  }

  function onTopicIndexError(error) {
    console.log("There was a topic indexing error: ", error);
  }

  function onTopicNewSuccess(response) {
    vm.topics.unshift(response.data);
  }

  function onTopicNewError(error) {
    console.log('There was an error creating a topic: ', error);
  }

  function onTopicDeleteSuccess(response) {
    console.log(response.data);
    var deletedTopicId = response.data.id;
    $('div[data-topic-id=' + deletedTopicId + ']').remove();
  }

  function onTopicDeleteError(error) {
    console.log("There was an error deleting your topic: ", error);
  }

}
