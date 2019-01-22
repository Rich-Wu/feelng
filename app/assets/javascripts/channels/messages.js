App.messages = App.cable.subscriptions.create('MessagesChannel', {
    received: function(data) {
        $("#messages").removeClass('hidden')
        $('#message-box').val('')
        console.log(data)
        return $('#messages').append(this.renderMessage(data));
        
    },

    renderMessage: function(data) {
        //how you want the message to be formatted
        var strong = document.createElement("strong");
        var p = document.createElement("p");
        var userText = document.createTextNode(data.spotify_user + ": ");
        var msgText = document.createTextNode(data.message);
        strong.appendChild(userText);
        p.appendChild(userText);
        p.appendChild(msgText);
        return p;
    }
});
