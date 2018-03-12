class UsersChannel < ApplicationCable::Channel
    def subscribed
        stream_from "users_#{params['user_id']}_channel"
    end

    def unsubscribed

    end

    def send_post(data)
        current_user.posts.create!(content: data['post'], user_id: data['user_id'])
    end

end
