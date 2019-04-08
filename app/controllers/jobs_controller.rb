class JobsController < ApplicationController
  def index
    @jobs = Job.order(name: :asc).order(year: :desc)
    @job_count = Job.count
  end

  def import
    Job.import(params[:file].path)
    redirect_to jobs_path
  end
end
