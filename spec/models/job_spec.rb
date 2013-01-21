require 'spec_helper'

describe Job do
  describe "Job associations" do
    it {should belong_to(:city)}
    it {should belong_to(:category)}
  end
  
  describe "validations" do
    it "should validate seeK_job_id" do
      job = FactoryGirl.build(:job, :seek_id => "")
      job.should have(1).error_on(:seek_id)
    end
    
    it "should validate :advert_link" do
      job = FactoryGirl.build(:job, :advert_link => "")
      job.should have(1).error_on(:advert_link)
    end
    
    it "should validate :category_id" do 
      job = FactoryGirl.build(:job, :category_id => nil)
      job.should have(1).error_on(:category_id)
    end
    
    it "should validate :posted_date" do
      job = FactoryGirl.build(:job, :posted_date => nil)
      job.should have(1).error_on(:posted_date)
    end
  end
  
  describe "saving options" do
    
    it "should save the city as Not-Specified if the city cannot be found" do
      job = FactoryGirl.create(:job, :city_id => nil)
      job.city.name.should == "Not-Specified"
    end
    
    it "should save the city as Sydney" do
      job = FactoryGirl.create(:job)
      job.city.name.should == "Sydney"
    end
    
  end
  
  describe "methods" do
    it "should get the latest 10 jobs" do
       FactoryGirl.create(:job)
       jobs = Job.latest_10_jobs("Ruby")
       jobs.length.should == 1  
    end
  end
  
end
