require File.dirname(__FILE__) + '/../../spec_helper'

describe "/plugins/index.html.erb" do

	before do
		plugin_1 =  mock_model(Plugin)
		plugin_1.should_receive(:name).and_return("Test 1")
		plugin_1.should_receive(:rating).twice.and_return("5")	
		plugin_1.should_receive(:description).and_return("MyText")
		
		plugin_2 =  mock_model(Plugin)
		plugin_2.should_receive(:name).and_return("Test 2")
		plugin_2.should_receive(:rating).twice.and_return("5")	
		plugin_2.should_receive(:description).and_return("MyText")		
		
		assigns[:plugins] = [plugin_1, plugin_2]
	end
	
	it "should display our plugin names" do
		render "/plugins/index.html.erb"
		response.should have_tag("dt", "Test 1")
		response.should have_tag("dt", "Test 2")	
	end
end	