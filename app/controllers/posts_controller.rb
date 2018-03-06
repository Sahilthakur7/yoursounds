class PostsController < ApplicationController
    def create
        @post = current_user.posts.build(post_params)
    end

    private

    def post_params
        params.require(:post).permit(:content)
    end
end
