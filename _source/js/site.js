/* forEach loop through for querySelectorAll
we need to convert it to an array first */
var forEach = function (array, callback, scope) {
  for (var i = 0; i < array.length; i++) {
    callback.call(scope, i, array[i]);
  }
};

/* for showing and hiding sibling elements
(similar to details/summary progressive disclosure pattern but different markup) */
var Details = (function () {

  var title = document.querySelectorAll('.jsDisclose');
  var expanded = document.querySelectorAll('.jsExpanded');

  function toggleActive(element) {
    var classList = element.classList;
    if (classList.contains('jsActive')) {
      classList.remove('jsActive');
    } else {
      classList.add('jsActive');
    }
  }

  function toggleHidden(element) {
    var classList = element.classList;
    if (classList.contains('jsHidden')) {
      classList.remove('jsHidden');
    } else {
      classList.add('jsHidden');
    }
  }

  function rotateArrow(element) {
    var classList = element.classList;
    if (classList.contains('jsRotated')) {
      classList.remove('jsRotated');
    } else {
      classList.add('jsRotated');
    }
  }

  function showDetails() {
    toggleActive(this);

    var titleSibling = this.parentNode.querySelector('.jsExpanded');
    toggleHidden(titleSibling);

    var buttonArrow = this.querySelector('.arrow--down');
    rotateArrow(buttonArrow);
  }

  /* hide all expanded items by default */
  forEach(expanded, function (index, element) {
    element.classList.add('jsHidden');
  });

  /* assign click event handlers to all title button items */
  forEach(title, function (index, element) {
    element.addEventListener('click', showDetails, false);
  });
})();
