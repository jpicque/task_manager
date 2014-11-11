class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  def index         # GET /tasks
    @tasks = Task.all
  end

  def show          # GET /tasks/:id
  end

  def new           # GET /tasks/new
    @task = Task.new

  end

  def create        # POST /tasks
    @task = Task.new(task_params)
    @task.save
    redirect_to @task
  end

  def edit          # GET /tasks/:id/edit
  end

  def update        # PATCH /tasks/:id
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to @task
  end

  def destroy       # DELETE /tasks/:id
    task = Task.find(params[:id])
    task.destroy
    redirect_to root_path
  end

private

  def task_params
    params.require(:task).permit(:name, :status)
  end

  def find_task
    @task = Task.find(params[:id])
  end

end
