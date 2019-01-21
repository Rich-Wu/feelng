App.messages = App.cable.subscriptions.create('MessagesChannel', {
    received: function(data) {
        $("#messages").removeClass('hidden')
        $('#message-box').val('')
        console.log("aylmao")
        return $('#messages').append(this.renderMessage(data));
        
    },

    renderMessage: function(data) {
        //how you want the message to be formatted 
        return "<p> <b>" + data.spotify_user + ": </b>" + data.message + "</p>"
    }
});