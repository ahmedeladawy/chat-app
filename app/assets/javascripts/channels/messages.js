function createMessageChannel() {
  App.messages = App.cable.subscriptions.create({
        channel: 'MessagesChannel', chat_id: parseInt($("#message_chat_id").val())
        },
        {
        received: function(data) {
          $("#messages").removeClass('hidden')
          return $('#messages').append(this.renderMessage(data));
        },
        renderMessage: function(data) {

        const date = moment(data.created_at).format("LT")
    return "<div class=\"message\"> <a href class=\"message_profile-pic\">" +
        "<img class=\"message_profile-pic\" src=\"" + data.image +"\"" + "/>" +
      "</a>" +
      "<a href class=\"message_username\">" + data.user + "</a>" +
      "<span class=\"message_timestamp\">" + date + " </span>" +
      "<span class=\"message_content\">" + data.message + "</span>" +

    "</div>";

  },
      });


return App.messages;
}
