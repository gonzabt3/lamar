class MainController < ApplicationController
  def index
    byebug
    @posts = posts
  end

  private

  def posts
    Post.all.order('created_at DESC')
  end
end
