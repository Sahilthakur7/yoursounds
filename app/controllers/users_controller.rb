class UsersController < ApplicationController

    def show
        @user = User.includes(:posts).find(params[:id])
        @post = Post.new
    end
end
