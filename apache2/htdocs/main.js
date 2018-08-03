$(document).ready(function() {
  $.ajax({
    type: 'POST',
    url: 'functions.php',
    data: ({
      action: 'get_current_inv',
      query: $('.query').val()
    }),
    success: function(response) {
      $('table').html(response);
    }
  });
  $.ajax({
    type: 'POST',
    url: 'functions.php',
    data: ({
      action: 'prod_dropdown',
      query: $('.query').val()
    }),
    success: function(response) {
      $('.loader-create select').html(response);
    }
  });
  $('.addNew').on('click', function(e) {
    e.preventDefault();
    e.stopPropagation();
    $('.mod').html($('.product-create').html());
    $('.mod').css({
      'display': 'block'
    }).animate({
      'width': '50vw',
      'height': '50vh',
      'left': '25vw',
      'top': '25vh'
    }, 400, function() {

      $('body .prodConfirm').on('click', function() {
        alert($('.prodName').val());
        var $action = $(this).data('action');
        $.ajax({
          type: 'POST',
          url: 'functions.php',
          data: ({
            prodName: $('.mod .prodName').val(),
            starting: $('.mod .startingInventory').val(),
            minimum: $('.mod .minimumRequired').val(),
            action: $action
          }),
          success: function(response) {
            $('.parCreate').html(response);
          }
        });
      });
    });
    // here
  })

  $('.view').on('click', function() {
    var $action = $(this).data('action');
    $.ajax({
      type: 'POST',
      url: 'functions.php',
      data: ({
        action: $action,
        query: $('.query').val()
      }),
      success: function(response) {
        $('table').html(response);
      }
    });
  })
  $('.createProduct').on('click', function(e) {
    e.preventDefault();
    e.stopPropagation();
    $('.mod').html($('.loader-create').html());
    $('.mod').css({
      'display': 'block'
    }).animate({
      'width': '50vw',
      'height': '50vh',
      'left': '25vw',
      'top': '25vh'
    });
    $('body .create-confirm').on('click', function() {
      alert($('option:selected').text().split(':')[1]);
    });
    // $('.modal').html(response);
    // }
  });
  // })
  $('.signInvoice').on('click', function(e) {
    e.preventDefault();
    e.stopPropagation();
    $('.mod').html($('.invoice-sign').html());
    $('.mod').css({
      'display': 'block'
    }).animate({
      'width': '50vw',
      'height': '50vh',
      'left': '25vw',
      'top': '25vh'
    });
  })
  $('.current-inventory').addClass('active');
  $('.nav-bar').children().each(function(i, obj) {
    $(this).on('click', function() {
      $('.nav-bar *').removeClass('active');
      $(this).addClass('active');
    })
  })
  var container = $('.mod');
  $(document).mouseup(function(e) {
    if (!container.is(e.target) && container.has(e.target).length === 0) {
      container.attr("style", "");
    }
  });
})
