# app/models/task.rb
class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  def list
    @tasks = Task.all
  end

  def show
    set_task
  end

  def new
    @task = Task.new
  end

  def create
    @new_task = Task.new(task_params)
    @new_task.save
    redirect_to list_path
  end

  def edit
    set_task
  end

  def update
    set_task
    @task.update(task_params)
    redirect_to list_path
  end

  def destroy
    set_task
    @task.destroy
    redirect_to list_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
