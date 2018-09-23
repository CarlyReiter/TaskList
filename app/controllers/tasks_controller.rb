class TasksController < ApplicationController


  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      head :not_found
    end
  end

  def new
    @task = Task.new
  end

  # private

  # def task_params
  #   return params.require(:task).permit(:name, :description, :completion_date)
  # end

  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description], completion_date: params[:task][:completion_date])


    # Not sure why the strong params won't allow me to pass in the task_params here instead of the long list of params.

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

    is_successful = task.update(name: params[:task][:name], description: params[:task][:description], completion_date: params[:task][:completion_date])
    #similar to create, I'm not sure why I'm unable to pass in the strong params here.

      if is_successful
        redirect_to tasks_path
      else
        render :edit
      end
  end

  def destroy
    task = Task.find_by(id: params[:id])
    # !!!!No incidence variable needed if controller not communicating with the view.
    task.destroy
    redirect_to tasks_path

  end

  def checkoff
    task = Task.find_by(id: params[:id])
    task.update(checkoff_status: true, completion_date: Date.today)
  end

end
