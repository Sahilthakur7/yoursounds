jQuery(document).on 'turbolinks:load' , ->
    posts = $('#posts')
    if posts.length > 0
        App.global_chat = App.cable.subscriptions.create {
            channel: 'UsersChannel'
            user_id: posts.data('user-id')
        },
        connected: ->
        disconnected: ->
        received: (data) ->
            posts.append data['post']
        send_post: (post, user_id) ->
            @perform 'send_post',post: post, user_id: user_id


    $('#new_post').submit (e) ->
        $this = $(this)
        textarea = $this.find('#post_content')
        if $.trim(textarea.val()).length > 1
            App.global_chat.send_post textarea.val(),
                posts.data('user-id')
                textarea.val('')
        e.preventDefault()
        return false

