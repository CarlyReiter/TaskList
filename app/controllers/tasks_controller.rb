class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    # @task = Task.find(task_id)
    @task = Task.find_by(id: task_id)

    #have to use .find_by because need the nil below
    if @task.nil?
      head :not_found
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description], completion_date: params[:task][:completion_date])

    is_successful = @task.save

    if is_successful
      redirect_to tasks_path
    else
      render :new
    end

  end

  def edit
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)
  end

  def update
    task_id = params[:id].to_i
    @task = Task.find_by(id: task_id)

    edit_successful = @task.update(name: params[:task][:name], description: params[:task][:description], completion_date: params[:task][:completion_date])

    if edit_successful
      redirect_to tasks_path
    else
      render :new
    end

  end

end
