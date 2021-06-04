var WhoIsWhoComponent = (function () {

  var WhoIsWhoComponent = function (el) {
    this.el = el;
    this.init();
  };

  WhoIsWhoComponent.prototype.init = function() {
    this.items = this.el.querySelectorAll('li');

    for (var i = 0; i < this.items.length; i++) {
      var openButton = this.items[i].querySelector('.who-is-who__open');
      if (openButton) {
        openButton.addEventListener('click', this.toggle.bind(this, null, this, this.items[i]));
      }
      var closeButton = this.items[i].querySelector('.who-is-who__close');
      if (closeButton) {
        closeButton.addEventListener('click', this.close.bind(this, null, this, this.items[i]));
      }
    }
  };
  WhoIsWhoComponent.prototype.close = function (e, parent, item) {
    item.open = false;
    item.classList.remove('open');
  };

  WhoIsWhoComponent.prototype.toggle = function (e, parent, item) {
    item.open = !item.open;

    for (var i = 0; i < parent.items.length; i++) {
      if (parent.items[i] != item) {
        parent.items[i].classList.remove('open');
        parent.items[i].open = false;
      }
    }

    if (item.open) {
      item.classList.add('open');
    } else {
      item.classList.remove('open');
    }
  };

  return WhoIsWhoComponent;
})();

var els = document.querySelectorAll(".who-is-who");

if (!els || els.length <= 0) {
	return null;
}

for (var i = 0; i < els.length; i++) {
	new WhoIsWhoComponent(els[i]);
}