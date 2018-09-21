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
    # task_id = params[:id]
    # @task = Task.find_by(id: task_id)
    @task = Task.find_by(id: params[:id])
  end

  def update
    # task_id = params[:id]
    # @task = Task.find_by(id: task_id)
    @task = Task.find_by(id: params[:id])

    edit_successful = @task.update(name: params[:task][:name], description: params[:task][:description], completion_date: params[:task][:completion_date])

    if edit_successful
      redirect_to tasks_path
    else
      render :new
      #new or something else?
    end

  end

  def destroy
    # task_id = params[:id].to_i
    # @task = Task.find_by(id: task_id)
    task = Task.find_by(id: params[:id])
    # !!!!No incidence variable needed if controller not communicating with the view.  Because destroy not getting a view, can be a local variable.
    # Task.find_by(id: task_id).destroy???
    task.destroy
    redirect_to tasks_path
    # delete_successful = @task.destroy

    # if delete_successful
    #   redirect_to tasks_path
    # else
    #   render :new
    #   #new or something else?
    # end

  end

end
