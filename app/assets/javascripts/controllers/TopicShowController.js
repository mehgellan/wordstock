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


  vm.createWord = function() {
    $http({
      method: 'POST',
      url: '/api/topics/' + $routeParams.id + '/words',
      data: vm.newWord
    }).then(onWordNewSuccess, onWordNewError);
  };

  $http({
    method: 'GET',
    url: '/api/words/' + $routeParams.id
  }).then(onWordShowSuccess, onWordShowError);

  vm.editWord = function(word) {
    var id = $(this).attr('data-id');
    $http({
      method: 'PATCH',
      url: '/api/words/' + word.id,
      data: word
    }).then(onWordsEditSuccess, onWordsEditError);
  };

  function onTopicShowSuccess(response) {
    vm.topic = (response.data);
  }

  function onTopicShowError(error) {
    console.log("There was an error: ", error);
  }

  function onWordsIndexSuccess(response) {
    vm.words = response.data;
  }

  function onWordsIndexError(error) {
    console.log("There was an error updating the index: ", error);
  }

  function onWordNewSuccess(response) {
    vm.words.push(response.data);
  }

  function onWordNewError(error) {
    console.log("There was post error: ", error);
  }

  function onWordShowSuccess(response) {
    // vm.word = response.data;
  }

  function onWordShowError(error) {
    console.log("There was a showing error: ", error);
  }

  function onWordsEditSuccess(response) {
    vm.updatedWord = response.data;
  }

  function onWordsEditError(error) {
    console.log("There was an editing error: ", error);
  }
}
