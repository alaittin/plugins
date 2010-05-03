require File.dirname(__FILE__) + '/../spec_helper'

describe PluginsController, " GET  to /plugins " do
	
	before do
		@plugin = mock_model(Plugin)
		Plugin.stub!(:find).and_return([@plugin])
	end
	
	it "should be successful" do
		get	:index
		response.should be_success
	end
	
	it "should find a list of all plugins" do
		Plugin.should_receive(:find).with(:all).and_return([@plugin])
		get :index			
	end
	
	it "should assign the list of all plugins for the view" do 
		get :index
		assigns[:plugins].should == [@plugin]
	end
	
	it "should render the index template" do
		get :index
		response.should render_template('index')
	end
	
end

describe PluginsController, " POST to /plugins " do
	
	before do
		@plugin = mock_model(Plugin)
		Plugin.stub!(:new).and_return(@plugin)	
		@params = {
			:name => 'Test',
			:description => 'My Test Plugin',
			:url => 'www.test.com',
			:category_id =>'1'		
		}
	end
		
	describe "success path" do
		before do 
			@plugin.should_receive(:save).and_return(true)
		end
			
		it "should create a new plugin" do
			Plugin.should_receive(:new).with(anything()).and_return(@plugin)
			post :create	
		end
		
		it "should redirect to the show template" do
			post :create
			response.should redirect_to(plugin_url(@plugin))	
		end	
		
		it "should populate the flash message" do
			post :create
			flash[:notice].should == ('Plugin was successfully created.')
		end
	end
	
	describe "failure path" do
		before do
			@plugin.should_receive(:save).and_return(false)
		end
			
		it "should redisplay the new template" do
			post :create
			response.should render_template(:new)	
		end
		
		it "should not populate the flash message" do
			post :create
			flash[:notice].should be_nil
		end			
	end	
end	





