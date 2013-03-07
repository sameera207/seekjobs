require 'spec_helper'


describe SeekJobReader do
  it "should save the 31 of December 2012" do
    job = FactoryGirl.build(:job, :posted_date => "2012-12-31")
    job.posted_date == Date.new(2012,12,31)
  end
end
