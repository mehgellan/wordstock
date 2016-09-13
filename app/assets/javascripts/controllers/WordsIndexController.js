angular
  .module('wordstock')
  .controller('WordsIndexController', WordsIndexController);

WordsIndexController.$inject = ['$http', '$routeParams'];

function WordsIndexController($http, $routeParams) {
  var vm = this;

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

  function onWordsIndexSuccess(response) {
    vm.words = response.data;
  }

  function onWordsIndexError(error) {
    console.log("There was an error: ", error);
  }

  function onWordNewSuccess(response) {
    vm.words.push(response.data);
  }

  function onWordNewError(error) {
    console.log("There was post error: ", error);
  }
}
