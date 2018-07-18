class TodosController < ApplicationController
  before_action :logged_in_user, only: [:update, :destroy, :create]

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      flash[:success] = "Todo created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end


  def update
    flash[:success] = "hot dogs"
  end

  def edit
  end

  private

    def todo_params
      params.require(:todo).permit(:content)
    end

    def set_done
      flash[:success] = "hot dogs"
    end
end
