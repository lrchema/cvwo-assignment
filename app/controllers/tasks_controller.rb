class TasksController < ApplicationController
	def index
    	@tasks = Task.all
  	end
 
  	def show
    	@task = Task.find(params[:id])
  	end
  	
	def new
	end

	def create
		ActionController::Parameters.permit_all_parameters = true
		#render plain: params[:task].inspect
  		@task = Task.new(params[:task])
 
  		@task.save
  		redirect_to @task
	end
	private
  		def task_params
    		params.require(:task).permit(:title, :description, :start, :due_date, :end_date, :status, :priority, :type)
  			#params.require(:task)
  		end
end