class PostsController < ApplicationController
  
  def create
    Post.create(body: post_params[:body], user_id: 1)
  end

  private

  def post_params
    params.permit(:body)
  end
end
