class Api::V1::TasksController < ApplicationController
  
  # GET api/v1/tasks/
  def index
    @tasks = Task.all
    render json: { status: 'success', data: @tasks }
  end

  # GET api/v1/tasks/:id
  def show
    render json: {status: 'success', data: Task.find(params[:id])}
  end

  # POST api/v1/tasks
  def create
    @task = Task.new(task_params)
    if @task.save
      render json: { status: 'success', data: @task }
    else
      render json: { status: 'failed', errors: @task.errors }
    end
  end

  # PUT api/v1/tasks/:id
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      render json: { status: 'success', data: @task }
    else
      render json: { status: 'failed', errors: @task.errors }
    end
  end

  # DELETE api/v1/tasks/:id
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    render json: { status: 'success', data: @task }
  end

  private
  def task_params
    params.require(:task).permit(:title, :description)
  end

end
