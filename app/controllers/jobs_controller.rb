class JobsController < ApplicationController
  def index
    @jobs = Job.order(name: :asc).order(year: :desc)
    @job_count = Job.count
  end

  def import
    job_names = Job.import(params[:file].path)
    Job.save_api_data(job_names)
    redirect_to jobs_path
  end
end
