App.product = App.cable.subscriptions.create({channel: "ProductChannel"}, {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".alert.alert-info").show();
    $('.product-reviews').prepend(data.comment);
    refreshRating();
  },

  listen_to_comments: function() {
    return this.perform('listen', {
      product_id: $("[data-product-id]").data("product-id")
    });
  }
});

$(document).on('turbolinks:load', function() {
	App.product.listen_to_comments();
});
