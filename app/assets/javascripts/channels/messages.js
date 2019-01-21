App.messages = App.cable.subscriptions.create('MessagesChannel', {
    received: function(data) {
        $("#messages").removeClass('hidden')
        return $('#messages').append(this.renderMessage(data));
    },

    renderMessage: function(data) {
        //how you want the message to be formatted
        return "<p> <b>" + data.spotify_user.username + ": </b>" + data.message + "</p>"
    }
});
