class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def import
    Job.import(params[:file].path)
    redirect_to jobs_path
  end
end
