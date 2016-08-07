jQuery(document).ready ->
  messages = $('#messages')
  if $('#messages').length > 0
    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))

    messages_to_bottom()

    App.global_chat = App.cable.subscriptions.create {
        channel: "ChatRoomsChannel"
        chat_room_id: messages.data('chat-room-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        messages.append data['message']
        messages_to_bottom()

      send_message: (message, chat_room_id) ->
        @perform 'send_message', message: message, chat_room_id: chat_room_id

    # $('#new_message').on('keypress', (e) ->
    #     console.log('hit');
    #   if e.keycode is 13
    #         console.log $('#message_body').val();
    #         # $this = $(this)
    #         # textarea = $this.find('#message_body')
    #         # if $.trim(textarea.val()).length > 1
    #         #   App.global_chat.send_message textarea.val(), messages.data('chat-room-id')
    #         #   textarea.val('')
    #         # e.preventDefault()
    #         # return false

    # $('#new_message').on 'keypress', (e) ->
    #     if e.which == 13
    #     console.log $('#message_body').val()
    # return
    #
    $('#new_message').on 'keypress', (e) ->
      if e.which == 13
        $this = $(this)
        textarea = $this.find('#message_body')
        if $.trim(textarea.val()).length > 1
          App.global_chat.send_message textarea.val(), messages.data('chat-room-id')
          textarea.val('')
        e.preventDefault()
        return false

    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 1
        App.global_chat.send_message textarea.val(), messages.data('chat-room-id')
        textarea.val('')
      e.preventDefault()
      return false
