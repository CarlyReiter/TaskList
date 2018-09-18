# TASKS = [
#   {name: "Mowing the lawn", duration: 25},
#   {name: "Raking the leaves", duration: 30},
#   {name: "Doing the laundry", duration: 10},
#   {name: "Vacuumming", duration: 15},
#   {name: "Cooking dinner", duration: 60},
# ]

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    task_id = params[:id].to_i
    @task = Task.find_by(id: [task_id])

    if @task.nil?
      head :not_found
    end
  end
end
