angular
  .module('wordstock')
  .controller('WordsIndexController', WordsIndexController);

WordsIndexController.$inject = ['$http'];

function WordsIndexController($http) {
  var vm = this;

  // fetch all of the user's routes
  $http({
    method: 'GET',
    url: '/api/words'
  }).then(onWordsIndexSuccess, onWordsIndexError);

  function onWordsIndexSuccess(response) {
    vm.words = response.data;
  }

  function onWordsIndexError(error) {
    console.log("There was an error: ", error);
  }
}
