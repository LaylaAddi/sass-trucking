App.messages = App.cable.subscriptions.create('TextsChannel', {  
  received: function(data) {
    $("#texts").removeClass('hidden')
    return $('#texts').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return "<p> <b>" +  ": </b>" + data.message + "</p>";
  }
});