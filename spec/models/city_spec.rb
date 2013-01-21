require 'spec_helper'

describe City do
  describe "validations" do
    it "should not add a city with out a name" do
      city = City.new
      city.should have(1).error_on(:name)
    end
  end
  
  describe "city creation" do
    it "should get the city by name" do
      city = City.find_by_name("Sydney")
      city.id.should == 1
    end
  end
  
  describe "City associations" do
    it {should have_many(:jobs)}
  end
  
end
