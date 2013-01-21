require 'spec_helper'

describe Category do
  describe "Category associations" do
    it {should have_many(:jobs)}
  end
end
