require File.dirname(__FILE__) + '/../spec_helper'

describe Category do
  
  it "should have a name" do
    @category = Category.new
    @category.should_not be_valid 
  end 
  
  it "should have a name that's at least 2 characters" do
    @category = Category.new(:name => "a")
    @category.should_not be_valid 
  end 
  
  it "should have a name that's less than 30 characters" do
    @category = Category.new(:name => "i have a very long name that oveflows the buffer of this holder so it doesnot work!")
    @category.should_not be_valid 
  end 
 
  it "should have plugins associated with it" do
    @category = Category.new(:name => "a sample one")
    @category.should have(:no).plugins
    @category.plugins.build(:name => "test", :description => "testing", :url => "www.test.com")   
    @category.should have(1).plugin
  end  
end