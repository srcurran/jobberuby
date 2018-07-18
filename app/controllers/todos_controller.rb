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
    @todo = Todo.find(params[:id])
    @todo.update_attribute(:completed, "true")
    redirect_to root_url
  end

  def todone
    @todo.update_attribute(:content, nil)
  end



  private

    def todo_params
      params.require(:todo).permit(:content)
    end



end
