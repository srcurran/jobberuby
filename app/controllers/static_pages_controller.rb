class StaticPagesController < ApplicationController

  def home
    if logged_in?
      @todo = current_user.todos.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def todos
    @todo = current_user.todos.build
    @full_feed_items = current_user.full_feed.paginate(page: params[:page])
  end

end
