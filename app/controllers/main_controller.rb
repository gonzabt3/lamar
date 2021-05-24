class MainController < ApplicationController
  def index
    @posts = posts
  end

  private

  def posts
    Post.all.order('created_at DESC')
  end
end
