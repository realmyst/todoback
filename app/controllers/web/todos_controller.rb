class Web::TodosController < ApplicationController
  respond_to :json

  def index
    @todos = Todo.active
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(params[:todo])
    @todo.save
    respond_with @todo
  end

  def show
    @todo = Todo.find(params[:id])
    respond_with @todo
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.title = params[:todo][:title]
    @todo.state = params[:todo][:state]
    @todo.save
    respond_with @todo
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.hide
    respond_with @todo
  end
end
