class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render('tasks/index.html.erb')
  end

  def new
    @task = Task.new
    render('tasks/new.html.rb')
  end

  def create
    @task = Task.new(:name => params[:name], :description => params[:description])

    if @task.save
      render('tasks/success.html.erb')
    else
      render('tasks/index.html.erb')
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
    render('tasks/edit.html.erb')
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(:name => params[:name],
                    :description => params[:description],
                    :done => params[:done])
      render('tasks/success.html.erb')
    else
      render('tasks/edit.html.erb')
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    render('tasks/destroy.html.erb')
  end

  def mark_done
    @task = Task.find(params[:id])
    @task.update(:done => true)
    render('tasks/done.html.erb')
  end

  def show_done
    @done_tasks = Task.all.where(:done => true)
  end
end
