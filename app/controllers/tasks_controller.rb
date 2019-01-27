class TasksController < ApplicationController
	def index
  	#@tasks = Task.all
    if params[:type_search].present?
      type =  Type.find(params[:type_search])
      @tasks = type.tasks

    elsif params[:date_sort].present?
      item = params[:date_sort]
      if item == 'start'
        if params[:up_down] == 'asc'
          @tasks = Task.order('start IS NULL, due_date ASC')
        else
          @tasks = Task.order('start IS NULL, due_date DESC')
        end
      elsif item == 'due_date'
        if params[:up_down] == 'asc'
          @tasks = Task.order('due_date IS NULL, due_date ASC')
        else
          @tasks = Task.order('due_date IS NULL, due_date DESC')
        end
      else
        if params[:up_down] == 'asc'
          @tasks = Task.order('end_date IS NULL, due_date ASC')
        else
          @tasks = Task.order('end_date IS NULL, due_date DESC')
        end
      end
        

    else
      @tasks = Task.all
    end
 
  end
 
  def show
  	@task = Task.find(params[:id])
  end
  	
	def new
    @task = Task.new
    #if @task.status.name != "Complete"
     # @task.end_date = nil
    #end
	end

  def edit
    @task = Task.find(params[:id])
  end

	def create
		ActionController::Parameters.permit_all_parameters = true
		#render plain: params[:task].inspect
  	@task = Task.new(params[:task])
 
  	if @task.save
      redirect_to @task
    else
      render 'new'
    end
	end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(params[:task])
      redirect_to @task
    else
      render 'edit'
    end
  end


  def destroy
    @task = Task.find(params[:id])
    @task.destroy
 
    redirect_to tasks_path
  end

	private
  		def task_params
    		params.require(:task).permit(:title, :description, :start, :due_date, :end_date, :status, :priority, :type)
  			#params.require(:task)
  		end
end