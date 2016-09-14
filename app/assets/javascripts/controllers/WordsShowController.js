angular
  .module('wordstock')
  .controller('WordsShowController', WordsShowController);

WordsShowController.inject = ['$http', '$routeParams'];

function WordsShowController($http, $routeParams) {
  var vm = this;

  $http({
    method: 'GET',
    url: '/api/words/' + $routeParams.id
  }).then(onWordsShowSuccess, onWordsShowError);

  // vm.editWord = function(word) {
  //   var id = $(this).attr('data-id');
  //   $http({
  //     method: 'PATCH',
  //     url: '/api/words/' + id,
  //     data: word
  //   }).then(onWordsEditSuccess, onWordsEditError);
  // };

  function onWordsShowSuccess(response) {
    vm.word = response.data;
  }

  function onWordsShowError(error) {
    console.log("There was a show error: ", error);
  }

  // function onWordsEditSuccess(response) {
  //   console.log(response.data);
  // }
  //
  // function onWordsEditError(error) {
  //   console.log("There was an editing error: ", error);
  // }
}
