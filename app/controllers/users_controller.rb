class UsersController < ApplicationController

    def show
        @user = User.friendly.find(params[:id])
        @posts = @user.posts.recent.page(params[:page]).per(5)
        @post = Post.new
    end
end
