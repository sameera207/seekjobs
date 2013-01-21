class HomeController < ApplicationController
  respond_to :js, :html
  
  before_filter :categories
  
  
  def index
    session[:key] ||= Category.first.name
    latest_10_jobs
  end
  
  def search
    key = params[:key]
    session[:key] = params[:key]
    @jobs = Job.jobs_by_category(key)
    @h = LazyHighCharts::HighChart.new('pie') do |f|
       f.options[:chart][:defaultSeriesType] = "pie"
       f.options[:title][:text] = "Searching jobs for #{key}"
       f.series(:name=> key, :data=> @jobs)
    end
    latest_10_jobs
    @current_key = key
  end
  
  def categories
    @categories = Category.all
  end
  
  def latest_10_jobs
    @latest_jobs = Job.latest_10_jobs(session[:key])
  end
  
end
