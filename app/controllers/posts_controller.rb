class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts[0].title = "Spam"
#I did not get this on my own.
    @posts.each_with_index do |post, index|
#I knew this part, but didn't know where to put it.
      if index % 5 == 0
        post.title = "Spam"
      end
    end
  end

#I tried to write a spam method.  It didn't work.
  def spam

  end

  def show
  end

  def new
  end

  def edit
  end


end
