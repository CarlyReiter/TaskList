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
    @task = Task.find_by(id: params[:id])
    #@task in form needs to know which instance to edit.
  end

  def update
    task = Task.find_by(id: params[:id])
    # @task not needed, since not associated with a view

    task.update(name: params[:task][:name], description: params[:task][:description], completion_date: params[:task][:completion_date])

      #can pass in strong parameter above
      # @task.update(task_params)
      redirect_to task_path(task.id)

      #!!!!!NEED TO SEE CONDITIONAL IN UPDATE, IF FAILS.  SIMILAR TO ABOVE.

  end

  def destroy
    # task_id = params[:id].to_i
    # @task = Task.find_by(id: task_id)
    task = Task.find_by(id: params[:id])
    # !!!!No incidence variable needed if controller not communicating with the view.  Because destroy not getting a view, can be a local variable.
    task.destroy
    redirect_to tasks_path

  end

  def checkoff
    task = Task.find_by(id: params[:id])
    task.update(completion_date: Date.today)
  end

end
