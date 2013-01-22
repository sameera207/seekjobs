class Job < ActiveRecord::Base
  attr_accessible :advert_link, :category_id, :city_id, :pay_heigh, :pay_low, :posted_date, :seek_id, :title
  
  belongs_to :city
  belongs_to :category
 
  validates :seek_id, :presence => true
  validates :category_id, :presence => true
  validates :advert_link, :presence => true
  validates :posted_date, :presence => true

  scope :by_category, lambda {|category|
    {
      :joins => :category,
      :conditions => "categories.name = '#{category}'"}  
  }
  
  scope :between_last_month, lambda {
    {:conditions => {:created_at => (((Date.today - 1.month) - 1)..(Date.today + 1))}}
  }
  
  scope :latest_10, lambda {
    {:limit => 10}
  }
  
  scope :order, lambda {
    {:order => "id desc"}
  }
  
  before_create :assign_city
  
  def self.jobs_by_category(category)
    job_list = []
    jobs = Job.by_category(category).between_last_month.count(:group => 'city_id', :include => :city)
    jobs.each do |job|
      job_list << [City.find(job[0]).name, job[1]]    
    end
    job_list
  end
  
  def assign_city
    self.city_id = City.city_not_specified unless self.city_id
  end
  
  def self.latest_10_jobs(category)
    self.by_category(category).latest_10.between_last_month
  end
  
  def self.date_range
    jobs = Job.order
    [jobs.last, jobs.first]
  end


end
