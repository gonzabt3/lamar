class PostsController < ApplicationController
  
  def create
    Post.create(body: post_params[:body], user: current_user)
  end

  private

  def post_params
    params.permit(:body)
  end
end
