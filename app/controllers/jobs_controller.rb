class JobsController < ApplicationController
  def index
  end

  def import
    Job.import(params[:file].path)
    redirect_to jobs_path
  end
end
