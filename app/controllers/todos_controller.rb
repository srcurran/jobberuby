class TodosController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @todo = current_user.todos.build(micropost_params)
    if @todo.save
      flash[:success] = "Todo created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def micropost_params
      params.require(:todo).permit(:content)
    end
end
