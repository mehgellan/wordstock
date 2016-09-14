angular
  .module('wordstock')
  .controller('TopicShowController', TopicShowController);

TopicShowController.inject = ['$http', '$routeParams', '$window'];

function TopicShowController($http, $routeParams, $window) {
  var vm = this;
  vm.sortType = 'created_at';
  vm.sortReverse = false;

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
    var id = $('button').attr('data-word-id');
    console.log("id: ", id, "word: ", word);
    $http({
      method: 'PATCH',
      url: '/api/words/' + word.id,
      data: word
    }).then(onWordsEditSuccess, onWordsEditError);
  };

  vm.deleteWord = function(word) {
    var id = $('button').attr('data-word-id');
    if (confirm("Are you sure you want to delete this word?")) {
        $http({
        method: 'DELETE',
        url: '/api/words/' + word.id,
        data: word
      }).then(onWordDeleteSuccess, onWordDeleteError);
    }
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
    vm.words.unshift(response.data);
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
    console.log(response.data);
  }

  function onWordsEditError(error) {
    console.log("There was an editing error: ", error);
  }

  function onWordDeleteSuccess(response) {
    console.log(response.data);
    var deletedWordId = response.data.id;
    $('tr[data-id=' + deletedWordId + ']').remove();
    // $window.location.href = '/topics/' + $routeParams.id;
    // var index = vm.words.indexOf(word);
    // vm.words.splice(index,1);
  }

  function onWordDeleteError(error) {
    console.log("There was a delete error: ", error);
  }
}
