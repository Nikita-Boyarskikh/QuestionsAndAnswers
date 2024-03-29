$(() => {
  // Fade out flash messages
  $('.message.closable .close.icon').on('click', () => {
    $('.message.closable').fadeOut('slow');
    return false;
  });

  // fix menu when passed
  $('.masthead').visibility({
    once: false,
    onBottomPassed: () => {
      $('.fixed.menu').transition('fade in');
    },
    onBottomPassedReverse: () => {
      $('.fixed.menu').transition('fade out');
    }
  });

  // create sidebar and attach to menu open
  $('.ui.sidebar').sidebar('attach events', '.toc.item');

  // Initialize dropdowns
  $('.ui.dropdown').dropdown();
});
